function showMore(obj){
    layer.open({
        type: 1,
        shadeClose: true,
        title: false, //涓嶆樉绀烘爣棰�
        area: ['500px', '300px'],
        content: '<div style="margin:20px;">'+obj+"</div>"
    });
}