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
            src="/yo-party-net/js/jbase64.js"></script>
    <script
            src="/yo-party-net/js/sitelogo/jquery-2.1.4.js"></script>

    <link
            href="/yo-party-net/css/sitelogo/sitelogo/sitelogo.css"
            rel="stylesheet">


</head>
<body>


<div class="edit-info basicInfo">
    <div class="edit-title basicInfo-title">
        <span>个人资料</span>
    </div>
    <div class=" edit-detail basicInfo-detail">
        <div class="bd">
            <form id="baseInfoForm" name="baseInfoForm" method="post"
                  class="infoForm">
                <input type="hidden" name="userInfoFormMap.id" value="12">
                <div id="main-profile" class="parts">
                    <div class="area">
                        <label>当前头像：</label>
                        <div id="crop-avatar" class="col-md-6">
                            <div class="avatar-view" title="点击修改头像"
                                 style="width: 82; height: 82;">


                                <img src="/yo-party-net/images/pic_sun.jpg"
                                     style="width: 80px; height: 80px;">


                            </div>
                        </div>
                    </div>
                    <p>
                        <label>昵称：<em>*</em></label> <input id="nickname" name="userInfoFormMap.nickname"
                                                            class="f-txt" type="text" value="国王无双"
                                                            maxlength="25">
                    </p>
                    <p>
                        <label>真实姓名：</label>
                        <input id="truename" class="f-txt" name="userInfoFormMap.truename" type="text"
                               value=""
                               maxlength="6">
                    </p>
                    <p>
                        <label>性别：<em>*</em></label>




                        <input type="radio"

                               value="1" name="userInfoFormMap.gender">&nbsp;男



                        <input type="radio"

                               value="2" name="userInfoFormMap.gender">&nbsp;女


                    </p>
                    <p>
                        <label>生日：</label>
                        <input
                                id="birthday" type="text" class="f-txt"
                                name="userInfoFormMap.birthday" value=""
                                onClick="WdatePicker({minDate:'1975-01-01',maxDate:'2000-12-31',dateFmt:'yyyy-MM-dd'})"/>
                    </p>
                    <div class="area">
                        <label>居住地：</label>
                        <div id="userInfoFormMap.residence" value=""></div>
                    </div>

                    <div class="area">
                        <label>家乡：</label>
                        <div id="userInfoFormMap.hometown" value=""></div>
                    </div>
                    <p>
                        <label>兴趣爱好：</label> <input id="interest" class="f-txt" name="userInfoFormMap.interest"
                                                    type="text" value="">
                    </p>
                    <p>
                        <label>工作：</label> <input id="work" class="f-txt" name="userInfoFormMap.work"
                                                  type="text" value="">
                    </p>
                </div>
                <div class="act skin-blue">
						<span class="btn n-btn">
							<button type="button" id="J_saveProfile">保存</button>
							<div style="width: 1px; height: 1px; overflow: hidden;">
								<input type="submit">
							</div>
						</span>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
<script type="text/javascript">
    $(function () {
        CommnUtil.area_gen("userInfoFormMap.residence")
        CommnUtil.area_gen("userInfoFormMap.hometown")
        $('#J_saveProfile').click(function () {
            if ($('#nickname').val() == "") {
                layer.msg("请填写昵称!")
                return
            }
            gender = $('input:radio[name="userInfoFormMap.gender"]:checked').val()
            if (!CommnUtil.notNull(gender)) {
                layer.msg("请选择性别!")
                return
            }
            data = CommnUtil.ajax(rootPath + "/user_info/addEntity.shtml", $('#baseInfoForm').serialize(), 'json')
            if (data == 'success') {
                parent.layer.alert("修改成功!", function () {
                    parent.location.reload()
                })

            }
        })

    })

</script>
</html>