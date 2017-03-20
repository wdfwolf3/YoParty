$(function () {
    if(CommnUtil.isPhone()){
        $("#logo_a").attr("href",rootPath+"/event/list.ftl.shtml")
    }

})

function loginOut(){
    layer.confirm("纭畾娉ㄩ攢鍚�?",function () {
        var rst = CommnUtil.ajax(rootPath + "/loginOut.shtml", {}, 'json');
        if (rst == "success") {
            $("#header div ul.login").attr("class", "login")
            $("#header div ul.info").attr("class", "info hd-hidden")
            layer.closeAll('dialog');//鍏抽棴瀵硅瘽妗� dialog涓哄叧闂獥鍙ｇ殑绫诲瀷
            $("#loginUid").val("");
            window.location.reload()
        }
    })
}