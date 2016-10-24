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
        url : "/ksdb/ekeapi?action=getobjlist&eketype="+type,
        type : 'GET',
        success : function (response) {
            updateselectobjs(ele,response.objlist);
        },
        error : function(xhr, status, error) {
            alert("Error: "+xhr.responseText);
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
