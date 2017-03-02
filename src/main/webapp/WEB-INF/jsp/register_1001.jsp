<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
        .error {
            color: #fe2617;
        }

        .item {
            clear: both;
            margin: 0 0 15px;
            zoom: 1;
        }

        .basic-input {
            width: 200px;
            padding: 5px;
            height: 18px;
            font-size: 14px;
            vertical-align: middle;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            border: 1px solid #c9c9c9
        }

        .basic-input.small {
            width: 100px;
        }

        .item-submit {
            margin-bottom: 2em;
        }

        .captcha-item {
            zoom: 1
        }

        .item {
            clear: both;
            margin: 15px 0
        }

        .btn-submit {
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            padding: 6px 26px;
            border-radius: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            *width: 100px;
            color: #ffffff;
            background: #3fa156;
            border: 1px solid #528641
        }
    </style>
    <script type="text/javascript">
    function checkUser(e){
    var result = document.getElementById("error-panel").value;
    var password = document.getElementById("dd").value;
    if(result == ""  ){
    var n = e.elements.firstname;
    displayError(n,"请输入密码")
    return false;
    }
    if(password == ""  ){
    alert("密码不能为空");
    return false;
    }else{
    return true;
    }
    function displayError(e,r)
    {var t=document.getElementById(e.name+"_err");
    t||(t=document.createElement("span"),t.id=e.name+"_err",t.className="error-tip",e.parentNode.appendChild(t)),t.style.display="inline",t.innerHTML=r}
    }
    function validateForm(e)
    {var r=0,t=e.elements["captcha-solution"],l=e.elements.form_email,n=e.elements.form_password,a=document.getElementById("item-error");
    if(a&&(a.style.display="none"),t)
    {var o=trim(t.value);
    ""===o?(displayError(t,"请输入验证码"),r=1):o.length<4?(displayError(t,"请输入正确的验证码"),r=1):clearError(t)}
    if(l)
    {var i=trim(l.value);
    ""===i||"邮箱/手机号/用户名"===i?(displayError(l,"请输入正确的邮箱/手机号/用户名"),r=1):clearError(l)}
    return n&&(""===n.value?(displayError(n,"请输入密码"),r=1):n&&clearError(n)),!r}


    </script>

    <title>注册</title>
</head>
<body>
<form id="formid" name="myform" method='post' action="/register">
    <p class="error">该用户已存在</p><br>
    <div class="item">
        <label>帐号</label>
        <input id="username" name="form_username" type="text" class="basic-input"
               maxlength="60" value="邮箱/手机号/用户名" tabindex="1"/>
    </div>
    <div class="item">
        <label>密码:</label>
        <input id="password" name="form_password" type="password" class="basic-input" maxlength="20" tabindex="2"/>
    </div>
    <div class="item">
        <label>确认密码:</label>
        <input id="password1" name="form_password" type="password" class="basic-input" maxlength="20" tabindex="3"/>
    </div>
    <div class="item">
        <label>手机号码:</label>
        <input id="phone" name="form_phone" type="text" class="basic-input" maxlength="11" tabindex="4"/>
    </div>
    <div class="item captcha-item">
        <label>验证码</label>
        <input id="code" name="code" type="text" class="basic-input small" maxlength="10" tabindex="5"/>
        <input id="request-phone-code-btn" type="submit" value="获取验证码"/>
        <span id="tips-error" class="tips"><em></em></span>
        <span id="tips-info" class="tips"></span>
        <span class="validate-error" id="frm_error"></span>
    </div>
    <div class="item-submit">
        <label>&nbsp;</label>
        <input type="submit" name="register" value="注册" id="button" class="btn-submit disabled" tabindex="6"/>
    </div>
</form>
</body>
</html>
