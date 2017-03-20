

<html lang="en"
      class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">

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
    <!--[if lt IE 9]>
    <![endif]-->
</head>
<body onload="javascript:to_top()">


<script src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/yo-party-net/js/layer-v1.9.2/layer/layer.js"></script>
<script src="/yo-party-net/common/common.js"></script>
<script src="/yo-party-net/js/common/header.js"></script>
<script>
    var rootPath = "/yo-party-net";
</script>

<div id="header">
    <div>
        <a id="logo_a" href="/yo-party-net/home.shtml"> <img class="logo" src="/yo-party-net/images/logo.png" width="55.62" height="55.62" alt="">
            <p class="masthead-brand">友派</p></a>

        <ul class="navigation">
            <li>
                <a href="/yo-party-net/home.shtml">首页</a>
            </li>
            <li>
                <a href="/yo-party-net/event/list.shtml">活动</a>
            </li>
            <li>
                <a href="about.html">关于</a>
            </li>
        </ul>



        <ul class="login ">
            <li>
                <a href="/yo-party-net/login.shtml">登录</a>
            </li>
            <li>
                <a href="/yo-party-net/register/register.shtml">注册</a>
            </li>
        </ul>


        <ul class="info hd-hidden">
            <li><a id="loginUnmae" href="/yo-party-net/event_order/list.shtml"></a></li>
            <li id="imleader"><a href="http://127.0.0.1:8080/yo-party/index.shtml" target="_blank">我是领队</a></li>
            <li><a href="javaScript:loginOut()">注销</a></li>
        </ul>

        <input type="hidden" id="loginUid" value=""/>
    </div>
</div>
<div id="hdline"></div>

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
                    <a href="" class="forget-pwd" target="_blank">忘记密码</a>
                    <a href="" class="register" target="_blank">免费注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <div>
        <div class="section">
            <div>
                <div>
                    <ul>
                        <li class="first">
                            <h2>关于我们</h2>
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;友派是一个泛娱乐化的社交平台，力图创建一个以年轻人的兴趣、爱好为中心，以线上线下结合为立足点的文化社区。友派倡导勇于尝试、乐于参与、积极分享的社交理念，旨在提供一种健康有营养的生活方式，希望能给大家带来更加丰富和精彩的人生体验。
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footnote">
            <p>
                &copy; Copyright 2017. All rights reserved.&nbsp;
            </p>
        </div>
    </div>
</div>
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
        $("#loginForm").attr("action","/yo-party-net/login.shtml")
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