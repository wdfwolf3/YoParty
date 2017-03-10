<%--
  Created by IntelliJ IDEA.
  User: wdfwolf3
  Date: 2017/3/1
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/css/home.css" />
    <script>
function trim(e){return e.replace(/^(\s|\u00A0)+/,"").replace(/(\s|\u00A0)+$/,"")}function validateForm(e){var r=0,t=e.elements["captcha-solution"],l=e.elements.form_email,n=e.elements.form_password,a=document.getElementById("item-error");if(a&&(a.style.display="none"),t){var o=trim(t.value);""===o?(displayError(t,"请输入验证码"),r=1):o.length<4?(displayError(t,"请输入正确的验证码"),r=1):clearError(t)}if(l){var i=trim(l.value);""===i||"邮箱/手机号/用户名"===i?(displayError(l,"请输入正确的邮箱/手机号/用户名"),r=1):clearError(l)}return n&&(""===n.value?(displayError(n,"请输入密码"),r=1):n&&clearError(n)),!r}function displayError(e,r){var t=document.getElementById(e.name+"_err");t||(t=document.createElement("span"),t.id=e.name+"_err",t.className="error-tip",e.parentNode.appendChild(t)),t.style.display="inline",t.innerHTML=r}function clearError(e){var r=document.getElementById(e.name+"_err");r&&(r.style.display="none")}!function(e){var r=function(r){return e.getElementById(r)},t="邮箱/手机号/用户名",l=r("email"),n=r("password"),a=r("captcha_field");l.onfocus=function(){this.value==t&&(this.value="",this.style.color="#000")},l.onblur=function(){this.value||(this.value=t,this.style.color="#ccc")},l.value==t?l.style.color="#ccc":""===n.value?n.focus():a&&a.focus()}(document);

    </script>
    <title>登陆友派</title>
</head>
<body>
<div id="content">
    <h1>登录友派</h1>
    <div class="article">


        <form id="lzform" name="lzform" method="post" onsubmit="return validateForm(this);"
              action="/validate">

            <div class="item">
                <label>帐号</label>
                <input id="11username" name="username" type="text" class="basic-input"
                       maxlength="60"  tabindex="1"/>
            </div>
            <div class="item">
                <label>密码</label>
                <input id="11password" name="password" type="password" class="basic-input" maxlength="20"
                       tabindex="2"/>
            </div>
            <div class="item">
                <label>&nbsp;</label>
                <p class="remember">
                    <input type="checkbox" id="remember-me" name="remember-me" tabindex="4"/>
                    <label for="remember-me" class="remember">下次自动登录</label>
                    | <a href="">忘记密码了</a>
                </p>
            </div>
            <div class="item">
                <label>&nbsp;</label>
                <input type="submit" value="登录" name="login" class="btn-submit" tabindex="5"/>
            </div>


        </form>

    </div>
    <ul id="side-nav" class="aside">
        <li>&gt;&nbsp;还没有友派帐号？<a rel="nofollow" href="">立即注册</a></li>
        <li>&gt;&nbsp;<a href="">点击下载友派移动应用</a></li>
    </ul>
</div>
</body>
</html>
