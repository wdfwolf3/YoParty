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
    <link rel="stylesheet" href="/yo-party-net/css/notebook/notebook_files/font.css" type="text/css">
    <link rel="stylesheet" href="/yo-party-net/css/notebook/notebook_files/app.v1.css" type="text/css">
    <!-- base start 重要部分不可删改-->
    <script type="text/javascript" src="/yo-party-net/js/notebook/notebook_files/app.v1.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/notebook/notebook_files/app.plugin.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/common/common.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jquery/underscore.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/common/lyGrid.js"></script>
    <!--[if lt IE 9] <script src="/yo-party-net/js/jquery/ie/html5shiv.js"></script> <script src="/yo-party-net/js/jquery/ie/respond.min.js"></script><![endif]-->
    <link href="/yo-party-net/css/date/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/yo-party-net/css/date/font-awesome.min.css" rel="stylesheet" type="text/css">


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

<#include "template/js.ftl"/>
<#include "template/head.ftl"/>
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
<#include "template/footer.ftl"/>
<script type="text/javascript">


</script>
<script type="text/javascript"
        src="/yo-party-net/js/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>