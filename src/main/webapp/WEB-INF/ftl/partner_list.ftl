<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>友派</title>
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-Frame-Options" content="SAMEORIGIN">
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
    <link href="/yo-party-net/css/date/bootstrap.min.css" rel="stylesheet">
    <link href="/yo-party-net/css/date/font-awesome.min.css" rel="stylesheet">


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
    <script type="text/javascript"
            src="/yo-party-net/js/bussiness/user_partner/list.js"></script>

    <style type="text/css">
        .cursor_a:hover{
            cursor: pointer;
        }

    </style>
</head>
<body>


<div class="edit-info companysInfo" >
    <div class="edit-title companysInfo-title"><span>参与人管理</span></div>
    <div class="edit-detail companysInfo-detail">
        <div class="companysInfo-handle">
            <button type="button" id="addPartner" class="btn btn-primary marR10">新增</button>
            <button type="button" id="editPartner" class="btn btn-info marR10">编辑</button>
            <button type="button" id="delPartner" class="btn btn-danger marR10">删除</button>
        </div>

    </div>
</div>
<div class="table-responsive" style="margin: 10px;">
    <div id="paging" class="pagclass"></div>
</div>
</html>