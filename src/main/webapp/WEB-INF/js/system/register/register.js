

$(function() {

});

//产生验证码
function checkcode(){
    $("#checkcode").attr("src",rootPath+"/register/checkCodeUI.shtml"+'?'+new Date())
}


//校验验证码
function validateCode(){
    if(!CommnUtil.notNull($("#accountName").val())){
        alert("请输入用户名！")
        return
    }
    password = $("#password").val()
    if(!CommnUtil.notNull(password)){
        alert("请输入密码！")
        return
    }
    confirmPassword= $("#confirmPassword").val()
    if(confirmPassword!=password){
        alert("两次输入的密码不一致！")
        return
    }

    code = $("#code").val()
    if(!CommnUtil.notNull(code)){
        alert("请输入验证码！")
        return
    }
    data = CommnUtil.ajax(rootPath+"/register/addEntity.shtml",$("#form").serializeJson(),"json")
    if(data.status=='error'){
        alert(data.msg)
    }else if(data.status=='success'){
        alert("注册成功！")
        location.href=rootPath+"/home.shtml"
    }

}
