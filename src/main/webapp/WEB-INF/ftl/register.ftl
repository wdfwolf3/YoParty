
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>





    <title>友派</title>
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <!-- name="viewport" 的详细用法  http://www.php100.com/html/webkaifa/HTML5/2012/0831/10979.html -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon" />
    <!--
    width - viewport的宽度 height - viewport的高度
    initial-scale - 初始的缩放比例
    minimum-scale - 允许用户缩放到的最小比例
    maximum-scale - 允许用户缩放到的最大比例
    user-scalable - 用户是否可以手动缩放
     -->
    <link rel="stylesheet" href="/yo-party-net/notebook/notebook_files/font.css" type="text/css">
    <link rel="stylesheet" href="/yo-party-net/notebook/notebook_files/app.v1.css" type="text/css">
    <link rel="stylesheet" href="/yo-party-net/css/yoparty.css" type="text/css">
    <!-- base start 重要部分不可删改-->
    <script type="text/javascript" src="/yo-party-net/notebook/notebook_files/app.v1.js"></script>
    <script type="text/javascript" src="/yo-party-net/notebook/notebook_files/app.plugin.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript" src="/yo-party-net/common/common.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/underscore.js"></script>
    <script type="text/javascript" src="/yo-party-net/common/lyGrid.js"></script>
    <!--[if lt IE 9]> <script src="/yo-party-net/js/jquery/ie/html5shiv.js"></script> <script src="/yo-party-net/js/jquery/ie/respond.min.js"></script><![endif]-->
    <link href="/yo-party-net/js/date/bootstrap.min.css" rel="stylesheet">
    <link href="/yo-party-net/js/date/font-awesome.min.css" rel="stylesheet">


    <script type="text/javascript" src="/yo-party-net/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/system/user/updatePassword.js"></script>

    <style type="text/css">
        .l_err{
            background: none repeat scroll 0 0 #FFFCC7;
            border: 1px solid #FFC340;
            font-size: 12px;
            padding: 4px 8px;
            width: 200px;
            display: none;
        }
        .error{
            border: 3px solid #FFCCCC;
        }
        .form-group{
            padding-left: 15px
        }
        .left{
            text-align: left;
            padding-left: 10px;
        }
        .right{
            text-align: right;
        }
        .hidden-xs{
            display: inherit;
        }
        .dmycol-menu{
            position: absolute;
            background-color: white;
            font-size: 14px;
            text-align: left;
            list-style: none;
            border: 1px solid rgba(0,0,0,.15);
            z-index: 1000;
            margin-top: 8px;
            width: 120px;
            left: auto;
            right: 0;
        }
        .dmycol-menu >li{
            margin-left: -30px;
        }
        .span_checkbox{
            display: inline-block;
            vertical-align: middle;
            margin: 0;
            padding: 0;
            width: 20px;
            height: 20px;
            background: url(/yo-party-net/images/custom.png) no-repeat;
            border: none;
            cursor: pointer;
            top: -2px;
        }
        .span_checkbox.checked {
            background-position: -20px 0;
        }
        .span_checkbox {
            background-position: 0 0;
        }
    </style>
    <!-- base end -->
    <script type="text/javascript">
        function onloadurl(){
            $("[data-url]").each(function () {
                var tb = $(this);
                tb.html(CommnUtil.loadingImg());
                tb.load(rootPath+tb.attr("data-url"));
            });
        }
        layer.config({
            extend: ['skin/style.css'], //加载新皮肤
            fix : false,// 用于设定层是否不随滚动条而滚动，固定在可视区域。
            skin: 'layer-ext-myskin' //一旦设定，所有弹层风格都采用此主题。
        });
        var rootPath = "/yo-party-net";
        /**
         * options:
         * url : 获取select数据的路径
         * name : input name
         * textFiled :显示
         * valueFiled:value
         * data : 查询条件{}
         * value ：默认值
         */
        function getSelectEx(byId,options){
            if(byId && options){
                if(options.url && options.textFiled
                        && options.valueFiled && options.name){
                    $.ajax({
                        type : "post", //使用get方法访问后台
                        dataType : "json", //json格式的数据
                        async : true, //同步   不写的情况下 默认为true
                        url : rootPath + options.url,
                        data : options.data,
                        success : function(data){
                            for(var i = 0; i < data.length;i++){
                                var selectObj = $("#"+byId).find("ul");
                                if(selectObj){
                                    if(options.value == "" && i == 0){
                                        $("#"+byId).append("<button data-toggle='dropdown' class='btn btn-sm btn-default dropdown-toggle'> "+
                                                "<span class='dropdown-label'>"+data[i][options.textFiled]+"</span> <span class='caret'></span></button>");
                                        $("#"+byId).find("ul").append("<li class='active'><a href='#'><input type='radio' name="+options.name+
                                                " value="+data[i][options.valueFiled]+" checked='checked'>"+data[i][options.textFiled]+"</a></li>");
                                    }else{
                                        if(options.value == data[i][options.valueFiled]){
                                            $("#"+byId).append("<button data-toggle='dropdown' class='btn btn-sm btn-default dropdown-toggle'> "+
                                                    "<span class='dropdown-label'>"+data[i][options.textFiled]+"</span> <span class='caret'></span></button>");
                                            $("#"+byId).find("ul").append("<li class='active'><a href='#'><input type='radio' name="+options.name+
                                                    " value="+data[i][options.valueFiled]+" checked='checked'>"+data[i][options.textFiled]+"</a></li>");
                                        }else{
                                            $("#"+byId).find("ul").append("<li class=''><a href='#'><input type='radio' name="+options.name+
                                                    " value="+data[i][options.valueFiled]+" >"+data[i][options.textFiled]+"</a></li>");
                                        }
                                    }
                                }
                            }
                        }
                    });

                }
            }
        }
    </script>
    <!-- 返回顶部 -->
    <script type="text/javascript" src="/yo-party-net/js/scrolltopcontrol.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/system/register/register.js"></script>

    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">

    <style type="text/css">
        .col-sm-3 {
            width: 25%;
            float: left;
            text-align: right;
        }

        .col-sm-9 {
            width: 75%;
            float: left;
            text-align: left;
        }

        .col-sm-6 {
            width: 53.5%;
            float: left;
            text-align: left;
        }

        .col-img-3 {
            width: 15%;
            float: left;
            text-align: center;
            margin-right: 15px;
            margin-left: 15px;
        }

        label[class^="btn btn-default"] {
            margin-top: -4px;
        }

        #code {
            font-family: Arial;
            font-style: italic;
            font-weight: bold;
            letter-spacing: 2px;
            color: blue;
        }

        #checkcode:hover {
            cursor: pointer;
        }

        .form-group {
            margin: 30px 0px;
        }
    </style>

</head>
<body>


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



<div class="register-main" >
    <div class="register-left" >
        <form id="form" name="form" class="form-horizontal" method="post" >
            <section class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <div class="col-sm-3">
                            <label class="control-label">昵称：</label>
                        </div>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" placeholder="请输入昵称" name="userFormMap.userName"
                                   id="userName">
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-sm-3 ">
                            <label style="color:red"> * </label>
                            <label class="control-label">账号：</label>
                        </div>
                        <div class="col-sm-9">
                            <input type="text" class="form-control " placeholder="请输入账号"
                                   name="userFormMap.accountName" id="accountName">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 ">
                            <label style="color:red"> * </label>
                            <label class="control-label">密码：</label>
                        </div>
                        <div class="col-sm-9" style="color: red;">
                            <input type="password" class="form-control " placeholder="请输入密码"
                                   name="userFormMap.password" id="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-3 ">
                            <label style="color:red"> * </label>
                            <label class="control-label">确认密码：</label>
                        </div>
                        <div class="col-sm-9" style="color: red;">
                            <input type="password" class="form-control " placeholder="请输入确认密码"
                                   id="confirmPassword">
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-3 ">
                            <label style="color:red"> * </label>
                            <label class="control-label">验证码：</label>
                        </div>
                        <div class="col-img-3">
                            <img src="/yo-party-net/register/checkCodeUI.shtml" width="80px" id="checkcode"
                                 height="32px" scrolling="no" onclick="checkcode()" title="点我重新生成验证码"></img></div>
                        <div class="col-sm-6" style="color: red;">

                            <input type="text" class="form-control" placeholder="请输入验证码" id="code"
                                   name="userFormMap.rCode">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机号码：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control " placeholder="手机号码"
                                   name="userFormMap.phone_no" id="phone">
                        </div>
                    </div>
                </div>
                <footer class="panel-footer text-right bg-light lter">
                    <button type="button" onclick="validateCode()" class="btn btn-success btn-s-xs">确认注册</button>
                </footer>
            </section>
        </form>

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
                        <!-- <li>
                            <h2>联系我们</h2>
                            <ul class="connect">
                                <li>
                                    <a href="#go/facebook/" class="facebook">&nbsp;</a>
                                </li>
                                <li>
                                    <a href="#go/twitter/" class="twitter">&nbsp;</a>
                                </li>
                                <li>
                                    <a href="#misc/contact" class="googleplus">&nbsp;</a>
                                </li>
                            </ul>
                        </li> -->
                    </ul>
                </div>
            </div>
        </div>
        <input type="hidden" id="chcode" value="">
        <div class="footnote">
            <p>
                &copy; Copyright 2017. All rights reserved.&nbsp;
            </p>
        </div>
    </div>
</div>
<script type="text/javascript">


</script>
<script type="text/javascript"
        src="/yo-party-net/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>