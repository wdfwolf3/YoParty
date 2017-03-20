<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>报名页面</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <script type="text/javascript" src="/yo-party-net/common/common.js"></script>
    <script src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
    <script src="/yo-party-net/js/bussiness/event_info/join.js"></script>
    <meta content="telephone=no" name="format-detection" />
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


<div class="signupPage">
    <div class="mainbox">
        <div class="content hdInfoBox">
            <h5>活动信息</h5>
            <input type="hidden" id="eid" value="1">
            <div class="innerHdInfo">
                <p class="t"><a href="" target="_blank">熊出没2017春节雾凇岛长白山魔界雪乡雪谷哈尔滨冰雪大世界~春节走起来~北国风光一览无余！</a>
                </p>
                <div class="d mobile_ed">
                    <div class="hdDetail ">
                        <ul>
                            <li class="col100">
                                <dl>
                                    <dt>领队：</dt>
                                    <dd>七胖</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul class="clearfix">
                            <li class="col100">
                                <dl>
                                    <dt>开始时间：</dt>
                                    <dd>2017年03月11日</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul>
                            <li class="col100">
                                <dl>
                                    <dt>目的城市：</dt>
                                    <dd>黑龙江省  伊春市</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>

                    <div class="hdDetail ">
                        <ul class="clearfix">

                            <li class="col100">
                                <dl>
                                    <dt >集合地点：</dt>
                                    <dd class="horiwrap" id="meet_places">牡丹园 花园桥</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="d pc_ed">
                    <div class="hdDetail ">
                        <ul class="clearfix">
                            <li class="col25">
                                <dl>
                                    <dt>开始日期：</dt>
                                    <dd>2017年03月11日</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>结束日期：</dt>
                                    <dd>2017年03月11日</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>出发城市：</dt>
                                    <dd>北京市  北京市</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>目的城市：</dt>
                                    <dd>黑龙江省  伊春市</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul class="clearfix">
                            <li class="col25">
                                <dl>
                                    <dt>活动性质：</dt>
                                    <dd>脱单</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>活动强度：</dt>
                                    <dd>休闲</dd>
                                </dl>
                            </li>

                            <li class="col25">
                                <dl>
                                    <dt>持续时间：</dt>
                                    <dd>1日活动</dd>
                                </dl>
                            </li>

                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul class="clearfix">
                            <li class="col25">
                                <dl>
                                    <dt>领队：</dt>
                                    <dd>七胖</dd>
                                </dl>
                            </li>
                            <li class="col75">
                                <dl>
                                    <dt style="width:14%">集合地点：</dt>
                                    <dd class="horiwrap" >牡丹园 花园桥</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>


                </div>
            </div>
        </div>
        <div class="content hdCompanys">
            <h5>选择参与活动的小派</h5>
            <div class="hdCompany clearfix">

                <div class="person margin1 notselected"
                     data-id="39">
                    <div class="basicInfo">
                        <ul class="clearfix">
                            <li class="name">123</li>
                            <li class="idcard_typ" style="display:none">身份证</li>
                            <li class="idCard" style="display:none">210281198909306816</li>
                        </ul>
                    </div>
                    <div class="line line-dashed "></div>
                    <div class="otherInfo">
                        <dl class="clearfix">
                            <dt>性别：</dt>
                            <dd class="sex">
                                男

                            </dd>
                        </dl>
                        <dl>
                            <dt class="phone_title">电话号码：</dt>
                            <dd class="phoneNumber">12345123451</dd>
                        </dl>
                    </div>
                </div>


                <div class="addperson" id="addUP"></div>


            </div>
        </div>
        <div class="content addBtn">
            <button id="addBtn">新增参与人</button>
            <button id="managerBtn">管理参与人</button>
        </div>
        <div class="content hdHandle">
            <div class="personChoice">
                <table>
                    <tr class="tableTitle">
                        <td>上车地点</td>
                        <td>昵称</td>
                        <td>性别</td>
                        <td>手机号</td>
                        <td>证件类型</td>
                        <td>证件号码</td>
                        <td>操作</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="content hdOrder pc">
            <h5>订单详情</h5>
            <div class="orderDetail">
                <table>
                    <tr class="tableTitle">
                        <td>活动名称</td>
                        <td>领队</td>
                        <td>单价</td>
                        <td>参与人数</td>
                        <td>小计</td>
                    </tr>
                    <tr class="tableInfo">
                        <td class="hdName">熊出没2017春节雾凇岛长白山魔界雪乡雪谷哈尔滨冰雪大世界~春节走起来~北国风光一览无余！</td>
                        <td>七胖</td>
                        <td id="price">300.0</td>
                        <td id="signupNumber">0</td>
                        <td id="countMoney">0</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="content other pc">
            <div class="message clearfix">
                <div class="toLeader">
                    <dl class="clearfix">
                        <dt>给领队的话：</dt>
                        <dd class="word"><input id="comment" value=""/></dd>
                    </dl>
                </div>

                <div class="insurance">
                    <dl class="clearfix">
                        <dt>保险：</dt>
                        <dd class="price"><input

                                checked="checked" id='insurance'
                                type="checkbox"/><span>每人5.0元</span>
                        </dd>
                        <dd class="count"><span id="insurancePrice">5.0</span></dd>
                    </dl>
                </div>

            </div>
        </div>
        <div class="content countMoney pc">
            <div class="sum clearfix">
                <dl class="clearfix">
                    <dt>总计：</dt>
                    <dd><span id="allMoney">0</span></dd>
                </dl>
            </div>
            <div class="submit clearfix pc">

                <button id="subBtn">付款报名</button>
            </div>
        </div>


        <div class="content hdOrder phone">
            <h5>订单详情</h5>
            <div class="orderDetail">
                <table>




                    <tr class="tableInfo">
                        <td class="hdName" colspan="2">熊出没2017春节雾凇岛长白山魔界雪乡雪谷哈尔滨冰雪大世界~春节走起来~北国风光一览无余！</td>
                        <td>七胖</td>
                    </tr>
                    <tr class="tableTitle">

                        <td>单价</td>
                        <td>参与人数</td>
                        <td>小计</td>
                    </tr>
                    <tr class="tableInfo">

                        <td id="mb_price">300.0</td>
                        <td id="mb_signupNumber">0</td>
                        <td id="mb_countMoney">0</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="content other phone">
            <div class="message clearfix">
                <div class="toLeader">
                    <dl class="clearfix">
                        <dt>给领队的话：</dt>
                        <dd class="word"><input id="mb_comment" value=""/></dd>
                    </dl>
                </div>

                <div class="insurance">
                    <dl class="clearfix">
                        <dt>保险：</dt>
                        <dd class="price"><input

                                checked="checked" id='mb_insurance'
                                type="checkbox"/><span>每人5.0元</span>
                        </dd>
                        <dd class="count"><span id="mb_insurancePrice">5.0</span></dd>
                    </dl>
                </div>

            </div>
        </div>
        <div class="content countMoney phone">
            <div class="sum clearfix">
                <dl class="clearfix">
                    <dt>总计：</dt>
                    <dd><span id="mb_allMoney">0</span></dd>
                </dl>
            </div>
            <div class="submit clearfix phone">

                <button id="mb_subBtn">付款报名</button>
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