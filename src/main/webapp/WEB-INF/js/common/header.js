$(function () {
    if(CommnUtil.isPhone()){
        $("#logo_a").attr("href",rootPath+"/event/list.shtml")
    }

})

function loginOut(){
    layer.confirm("确定注销吗?",function () {
        var rst = CommnUtil.ajax(rootPath + "/loginOut.shtml", {}, 'json');
        if (rst == "success") {
            $("#header div ul.login").attr("class", "login")
            $("#header div ul.info").attr("class", "info hd-hidden")
            layer.closeAll('dialog');//关闭对话框 dialog为关闭窗口的类型
            $("#loginUid").val("");
            window.location.reload()
        }
    })
}