<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<!DOCTYPE html>
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
    <title>友派</title>
    <meta charset="utf-8">
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <script src="/yo-party-net/sitelogo/jquery-2.1.4.js"></script>
    <link href="/yo-party-net/sitelogo/cropper/cropper.min.css" rel="stylesheet">
    <link href="/yo-party-net/sitelogo/sitelogo/sitelogo.css" rel="stylesheet">
    <script src="/yo-party-net/sitelogo/cropper/cropper.min.js"></script>
    <script src="/yo-party-net/sitelogo/sitelogo/sitelogo4frame.js"></script>
    <script src="/yo-party-net/sitelogo/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>


<head>
    <script src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/layer-v1.9.2/layer/layer.js"></script>
    <script src="/yo-party-net/common/common.js"></script>
    <script src="/yo-party-net/js/common/header.js"></script>
    <script>
        var rootPath = "/yo-party-net";
    </script>

</head>

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



        <ul class="login hd-hidden">
            <li>
                <a href="/yo-party-net/login.shtml">登录</a>
            </li>
            <li>
                <a href="/yo-party-net/register/register.shtml">注册</a>
            </li>
        </ul>


        <ul class="info ">
            <li><a id="loginUnmae" href="/yo-party-net/event_order/list.shtml">国王无双</a></li>
            <li id="imleader"><a href="http://127.0.0.1:8080/yo-party/index.shtml" target="_blank">我是领队</a></li>
            <li><a href="javaScript:loginOut()">注销</a></li>
        </ul>

        <input type="hidden" id="loginUid" value="17"/>
    </div>
</div>
<div id="hdline"></div>
<div class="personal-edit-wrap">
    <div class="personal-edit clearfix">
        <div class="edit-lside">
            <div class="lside-img">












            </div>
            <div class="lside-manager">
                <b class="lside-icon">-</b>
                <div class="lside-title">账号管理</div>
                <ul>
                    <li id="manager-basic">基本信息</li>
                    <li id="manager-companys">参与伙伴管理</li>
                </ul>
            </div>
        </div>
        <div class="edit-rside">
            <iframe src="/yo-party-net/user_info/baseInfo.shtml" frameborder="0" id="frame_1" name="frame_1"
                    scrolling="no" width="850px" height="550px"
                    style="position: relative;"></iframe>
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
        <div class="footnote">
            <p>
                &copy; Copyright 2017. All rights reserved.&nbsp;
            </p>
        </div>
    </div>
</div>
</body>
<div class="modal fade" id="avatar-modal"
     aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-lg"
         style="top: -10%; left: 0; width: 65%">
        <div class="modal-content" tabindex="-1">
            <form class="avatar-form" id="avatar-form"
                  action="/yo-party-net/common/photoupld.shtml?src_tbl=user_info&rid=12&ref_col=photoUrl"
                  enctype="multipart/form-data" method="post">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                    <h4 class="modal-title" id="avatar-modal-label">更换头像</h4>
                </div>
                <div class="modal-body">
                    <div class="avatar-body">
                        <div class="avatar-upload">

                            <label for="avatarInput">图片上传</label> <input type="file"
                                                                         class="avatar-input" id="avatarInput"
                                                                         name="avatar_file">
                            <input class="avatar-src" name="avatar_src" type="hidden">
                            <input class="avatar-data" name="avatar_data" id="avatar_data"
                                   type="hidden">
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="avatar-preview preview-lg" name="avatar_file_lg"></div>
                                <div class="avatar-preview preview-md"></div>
                                <div class="avatar-preview preview-sm"></div>
                            </div>
                        </div>
                        <div class="row avatar-btns">
                            <div class="col-md-9">
                                <div class="btn-group">
                                    <button class="btn" data-method="rotate" data-option="-90"
                                            type="button" title="Rotate -90 degrees">
                                        <i class="fa fa-undo"></i> 向左旋转
                                    </button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn" data-method="rotate" data-option="90"
                                            type="button" title="Rotate 90 degrees">
                                        <i class="fa fa-repeat"></i> 向右旋转
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-success btn-block avatar-save"
                                        type="submit">
                                    <i class="fa fa-save"></i> 保存修改
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="./js/jquery-2.1.4.min.js"></script>
<script src="./js/swiper-2.1.min.js"></script>
<script src="./js/fenye.js"></script>
<script>
    var pageii = null;
    $(function () {
        $("#manager-basic").click(function(){
            $("#frame_1").attr("src",rootPath+"/user_info/baseInfo.shtml")
        })
        $("#manager-companys").click(function(){
            $("#frame_1").attr("src",rootPath+"/user_partner/list.ftl.shtml")
        })
        //根据参数选择显示的页面
        var frame_type='companys'
        if(frame_type=="basic"){
            $("#frame_1").attr("src",rootPath+"/user_info/baseInfo.shtml")
        }else if(frame_type == "companys"){
            $("#frame_1").attr("src",rootPath+"/user_partner/list.ftl.shtml")
        }


    });
    function addNewPartner(addData){
        $("#frame_1").attr("src",rootPath+"/user_partner/list.ftl.shtml")
    }
</script>
</html>
