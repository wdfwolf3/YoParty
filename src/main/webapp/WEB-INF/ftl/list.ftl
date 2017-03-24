<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>活动列表</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <script type="text/javascript" src="/yo-party-net/js/endless-scroll/jquery.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/endless-scroll/jquery.endless-scroll.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/bussiness/event_info/list.js">
    </script>
</head>
<body>

<#include "template/js.ftl"/>
<#include "template/head.ftl"/>
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
<#include "template/footer.ftl"/>
</body>
</html>