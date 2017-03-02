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
    <style type="text/css">
        /* Reset */
        body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        fieldset, img {
            border: 0;
        }

        address, caption, cite, code, dfn, em, strong, th, var {
            font-style: normal;
            font-weight: normal;
        }

        ol, ul {
            list-style: none;
        }

        caption, th {
            text-align: left;
        }

        h1, h2, h3, h4, h5, h6 {
            font-size: 100%;
            font-weight: normal;
        }

        q:before, q:after {
            content: '';
        }

        abbr, acronym {
            border: 0;
        }

        /* Font,  Link & Container */
        body {
            font: 12px/1.6 arial, helvetica, sans-serif;
        }

        a:link {
            color: #369;
            text-decoration: none;
        }

        a:visited {
            color: #669;
            text-decoration: none;
        }

        a:hover {
            color: #fff;
            text-decoration: none;
            background: #039;
        }

        a:active {
            color: #fff;
            text-decoration: none;
            background: #f93;
        }

        button {
            cursor: pointer;
            line-height: 1.2;
        }





        /* Layout */


        #content {
            min-height: 400px;
            *height: 400px;
        }



        .article {
            float: left;
            width: 590px;
        }

        .aside {
            float: right;
            width: 310px;
            color: #666;
        }

        .aside li {
            padding-bottom: 1em;
        }


        .narrow-layout h1 {
            padding-bottom: 10px;
        }


        .narrow-layout .article, .narrow-layout .aside {
            width: auto;
            float: none;
            margin-bottom: 20px;
        }

        .narrow-layout .aside li {
            padding: 0;
            margin-bottom: 10px;
        }


        /* header */

        h1 {
            color: #494949;
            display: block;
            font-size: 25px;
            font-weight: bold;
            line-height: 1.1;
            margin: 0;
            padding: 0 0 30px;
            word-wrap: break-word;
        }

        /* form */
        .item {
            clear: both;
            margin: 0 0 15px;
            zoom: 1;
        }

        label {
            display: inline-block;
            float: left;
            margin-right: 15px;
            text-align: right;
            width: 60px;
            font-size: 14px;
            line-height: 30px;
            vertical-align: baseline
        }

        .remember {
            cursor: pointer;
            font-size: 12px;
            display: inline;
            width: auto;
            text-align: left;
            float: none;
            margin: 0;
            color: #666
        }

        .item-captcha input,
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

        .basic-input{
            width: 100px;
        }

        .item-captcha input:focus,
        .basic-input:focus {
            border: 1px solid #a9a9a9
        }

        .item-captcha input {
            width: 100px;
        }


        .btn-submit {
            cursor: pointer;
            color: #ffffff;
            background: #3fa156;
            border: 1px solid #528641;
            font-size: 14px;
            font-weight: bold;
            padding: 6px 26px;
            border-radius: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            *width: 100px;
            *height: 30px;
        }

        .btn-submit:hover {
            background-color: #4fca6c;
            border-color: #6aad54;
        }

        .btn-submit:active {
            background-color: #3fa156;
            border-color: #528641;
        }



        .item-captcha img {
            max-width: 70%;
        }

        body {
            -webkit-text-size-adjust: none;
            -webkit-touch-callout: none;
            -webkit-tap-highlight-color: transparent;
        }

        /* 3rd login*/

        .item-3rd label {
            width: auto;
            margin: 0;
            font-size: 12px;
            color: #999;
            line-height: 1.5;
        }

        .item-3rd img {
            margin: 0 5px;
            vertical-align: middle;
        }

        .item-3rd a:hover {
            background-color: transparent;
        }

        .item-3rd a:active {
            background-color: transparent;
        }


    </style>
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
              action="https://accounts.douban.com/login">

            <div class="item">
                <label>帐号</label>
                <input id="email" name="form_email" type="text" class="basic-input"
                       maxlength="60" value="邮箱/手机号/用户名" tabindex="1"/>
            </div>
            <div class="item">
                <label>密码</label>
                <input id="password" name="form_password" type="password" class="basic-input" maxlength="20"
                       tabindex="2"/>
            </div>
            <div class="item">
                <label>&nbsp;</label>
                <p class="remember">
                    <input type="checkbox" id="remember" name="remember" tabindex="4"/>
                    <label for="remember" class="remember">下次自动登录</label>
                    | <a href="https://accounts.douban.com/resetpassword">忘记密码了</a>
                </p>
            </div>
            <div class="item">
                <label>&nbsp;</label>
                <input type="submit" value="登录" name="login" class="btn-submit" tabindex="5"/>
            </div>


        </form>

    </div>
    <ul id="side-nav" class="aside">
        <li>&gt;&nbsp;还没有豆瓣帐号？<a rel="nofollow" href="https://accounts.douban.com/register">立即注册</a></li>
        <li>&gt;&nbsp;<a href="https://www.douban.com/mobile/">点击下载豆瓣移动应用</a></li>
    </ul>
</div>
</body>
</html>
