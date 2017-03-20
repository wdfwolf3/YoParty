<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<head>

    <title>活动列表</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <!--[if IE 7]>
    <link href="/yo-party-net/css/ie7.css" rel="stylesheet" type="text/css">
    <![endif]-->
    <script type="text/javascript">
        var rootPath = "/yo-party-net";
    </script>

    <script type="text/javascript" src="/yo-party-net/js/endless-scroll/jquery.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/endless-scroll/jquery.endless-scroll.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript" src="/yo-party-net/common/common.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/bussiness/event_info/list.js">
    </script>
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



<div class="container clearfix">
    <div class="searchBox">
        <div class="innerSearch wrapper fn-pr clearfix">

            <div class="searchArea">
                <div class="sfliter s_place fn-pr" id="search-type">
                    <div class="f" type="0">
                        <span class="p">按活动搜索</span>

                    </div>
                    <b class="arrow deploy"></b>
                    <div class="fresult" type="1">
                        <p>按领队搜索</p>

                    </div>
                </div>
                <div class="search_bar">
                    <input type="text" id="searchKeyword" name="eventInfoFormMap.keyword" placeholder="请输入目的地、景点等关键词"
                           value="">

                    <input type="hidden" id="searchType" name="eventInfoFormMap.searchType" value="0">
                    <input type="submit" value="搜索" id="submit-btn">
                </div>
            </div>
        </div>
    </div>
    <div class="inner_container clearfix">
        <div class="wrapper">
            <!-- hd filter -->
            <div class="hdFliter fll tabs clearfix">
                <div class="fbox_hd fll">
                    <div class="fgroup  tab-panel">


                        <dl class="clearfix btm-doted navmenu">
                            <dt>活动性质：</dt>
                            <dd>
                                <a href="#" class="selected" eventType="0" eventKey="0">全部</a>

                                <a href="#none" eventType="1"
                                   eventKey="1">脱单</a>

                                <a href="#none" eventType="1"
                                   eventKey="2">纯玩</a>

                            </dd>
                        </dl>


                        <dl class="clearfix btm-doted navmenu">
                            <dt>活动强度：</dt>
                            <dd>
                                <a href="#" class="selected" eventType="0" eventKey="0">全部</a>

                                <a href="#none" eventType="2"
                                   eventKey="1">休闲</a>

                                <a href="#none" eventType="2"
                                   eventKey="2">轻量</a>

                                <a href="#none" eventType="2"
                                   eventKey="3">专业</a>

                            </dd>
                        </dl>


                        <dl class="clearfix  navmenu">
                            <dt>持续时间：</dt>
                            <dd>
                                <a href="#" class="selected" eventType="0" eventKey="0">全部</a>

                                <a href="#none" eventType="3"
                                   eventKey="1">1日活动</a>

                                <a href="#none" eventType="3"
                                   eventKey="2">2日活动</a>

                                <a href="#none" eventType="3"
                                   eventKey="3">3日活动</a>

                                <a href="#none" eventType="3"
                                   eventKey="5">5日活动</a>

                                <a href="#none" eventType="3"
                                   eventKey="7">7日活动</a>

                            </dd>
                        </dl>

                    </div>
                </div>
            </div>
            <!-- 活动列表 -->
            <div class="hdList clearfix">
                <div class="hdListLeft fll">
                    <div class="orderHd">
                        <a href="#none" class="ol tj selected" eventSort="prior_status">推荐排序</a>
                        <a href="#none" class="ol price" eventSort="price">价格</a>
                        <a href="#none" class="ol " eventSort="start_time">出发时间</a>
                        <div class="n">共计<span id="total"></span>个活动</div>
                    </div>
                    <div class="hdListArea">
                        <ul id="stage">
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
            <input type="hidden" value="/yo-party" id="manager_upload_prefix">
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
</html>