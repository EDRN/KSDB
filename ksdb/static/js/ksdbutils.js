function updateselectobjs(objtype, objs) {
    var selected = $('#'+objtype).val();
    $('#'+objtype).html("");
    $.each(objs, function(key, value) {
        addedflag = 0;
        $.each(selected, function(selkey, selvalue) {
            if(value.join(":")  == selvalue){
                $('#'+objtype).append($("<option selected></option>")
                .attr("value",value.join(":"))
                .text(value[1]));
                addedflag = 1;
            }
        });
        if (addedflag == 0){
            $('#'+objtype).append($("<option></option>")
                .attr("value",value[0])
                .text(value[1]));
        }
    });
}
//This functions automatically queries the db. For short queries.
function updateLists(type, ele) {
    $.ajax({
        url : "/ksdb/ekeapi/?action=getobjlist&eketype="+type,
        type : 'GET',
        success : function (response) {
            updateselectobjs(ele,response.objlist);
        },
        error : function(xhr, status, error) {
            alert("Error: "+xhr.responseText);
        }
    });
}
//This function requires you to type at least one character to start
//searching through the db. Speeds up the processing time. For large
//queries. Also allows filtering by linking other tables to main table.
function setAutocompleteList(id, type, filterby, filterval, minlength){
    $('#'+id).select2({
        minimumInputLength: minlength,
        ajax: {
            url : "/ksdb/ekeapi/?action=getobjlist&eketype="+type,
            type : 'GET',
            dataType: 'json',
            data: function (params) {
              return {
                filter: params.term, // search term
                page: params.page,
                filtervalue: filterval,
                filterby: filterby,
              };
            },
            processResults: function (data, page) {
              return {
                results: data.objlist,
              };
            },
        },templateResult: function (option) {
            return option.id;
        },
        templateSelection: function (option) {
            return option.id;
        }
    });
}
function startModal(link){
    var modal = $('#modal');
    $.ajax({
        url: "/ksdb/modalview/",
        data: "type="+link.getAttribute("href")+"&target="+link.getAttribute("target"),
        context: document.body
    }).done(function(response) {
        modal.html(response);
    });
}
function getTodayDate(){
    var d = new Date();
    var month = d.getMonth();
    var day = d.getDate();
    var year = d.getFullYear();

    return new Date(year, month, day, 00, 00);
}
//Adds person to people search widget
function addPersonWidget(ids, fieldid){
    var ppl_array = ids.split(',');
    for(var i = 0; i < ppl_array.length; i++) {
        ppl_array[i] = ppl_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
        if(ppl_array[i] != ""){
            var $option = $('<option value="'+ppl_array[i]+'" selected></option>');
            $('#'+fieldid).append($option);
        }
    }
}
