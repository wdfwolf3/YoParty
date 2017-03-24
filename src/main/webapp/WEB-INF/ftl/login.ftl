<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
    <link href="/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <meta name="renderer" content="webkit">
    <title>登录－友派</title>
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
</head>
<body onload="javascript:to_top()">

<#include "template/js.ftl"/>
<#include "template/head.ftl"/>
<div class="loginContainer">
    <div class="login-box-wrap">
        <div class="login-box no-longlogin module-static" id="LoginBox">
            <div class="login-form">
                <div class="login-title">密码登录</div>
                <form action="" method="post" id="loginForm">
                    <!--用户名field-->
                    <div class="field username-field">
                        <label for="username">用户名</label>
                        <input placeholder="请输入用户名" type="text" name="username" id="username"
                               class="login-text userName" value="" maxlength="32" tabindex="1">
                    </div>
                    <!--密码field-->
                    <div class="field pwd-field">
                        <label id="password-label" for="password">密 码</label>
                        <input placeholder="请输入密码" type="password" name="password" id="password" class="login-text"
                               maxlength="40" tabindex="2" autocomplete="off" aria-label="登录密码">
                    </div>
                </form>
                <div class="submit field">
                    <button type="submit" class="formSubmit" tabindex="3" id="formSubmit" data-ing="正在登录...">登 录
                    </button>
                </div>















                <div class="login-links">
                    <a href="/yo-party-net/findpassword" class="forget-pwd" target="_blank">忘记密码</a>
                    <a href="/yo-party-net/register/register.shtml" class="register" target="_blank">免费注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "template/footer.ftl"/>
<script type="text/javascript">


    if ("" != "") {
        alert("");
    }
    ;

    $(function(){
        $("#formSubmit").click(function(){
            checkUserForm()
        })
    })
    function checkUserForm() {
        var username = $("#username").val();
        if(username == ""){
            alert("请填写用户名!")
            return;
        }
        var password = $("#password").val();
        if(password == ""){
            alert("请填写密码!")
            return;
        }
        $("#loginForm").attr("action","/yo-party-net/validate")
        $("#loginForm").submit();
    }
    function to_top() {
        if (window != top) {
            top.location.href = location.href;
        }
    }
</script>
</body>
</html>