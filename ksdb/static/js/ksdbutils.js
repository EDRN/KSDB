function updateselectobjs(objtype, objs) {
    $('#'+objtype).html("");
    $.each(objs, function(key, value) { 
        $('#'+objtype).append($("<option></option>")
            .attr("value",value[0])
            .text(value[1])); 
    });
}
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
function setAutocompleteList(id, type){
    $('#'+id).select2({
        minimumInputLength: 1,
        ajax: {
            url : "/ksdb/ekeapi/?action=getobjlist&eketype="+type,
            type : 'GET',
            dataType: 'json',
            data: function (params) {
              return {
                filter: params.term, // search term
                page: params.page
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
