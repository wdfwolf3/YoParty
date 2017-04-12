<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>报名页面</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <script type="text/javascript" src="/yo-party-net/js/common/common.js"></script>
    <script src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
    <script src="/yo-party-net/js/bussiness/event_info/join.js"></script>
    <meta content="telephone=no" name="format-detection" />
</head>
<body>


<head>
<#include "template/js.ftl"/>
</head>

<#include "template/head.ftl"/>

<div class="signupPage">
    <div class="mainbox">
        <div class="content hdInfoBox">
            <h5>活动信息</h5>
            <input type="hidden" id="eid" value="15">
            <div class="innerHdInfo">
                <p class="t"><a href="" target="_blank">测试1</a>
                </p>
                <div class="d mobile_ed">
                    <div class="hdDetail ">
                        <ul>
                            <li class="col100">
                                <dl>
                                    <dt>领队：</dt>
                                    <dd>国王无双</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul class="clearfix">
                            <li class="col100">
                                <dl>
                                    <dt>开始时间：</dt>
                                    <dd>2017年04月24日</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul>
                            <li class="col100">
                                <dl>
                                    <dt>目的城市：</dt>
                                    <dd>天津市  天津市  河西区</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>

                    <div class="hdDetail ">
                        <ul class="clearfix">

                            <li class="col100">
                                <dl>
                                    <dt >集合地点：</dt>
                                    <dd class="horiwrap" id="meet_places">asdf</dd>
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
                                    <dd>2017年04月24日</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>结束日期：</dt>
                                    <dd>2017年04月26日</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>出发城市：</dt>
                                    <dd>北京市  北京市  西城区</dd>
                                </dl>
                            </li>
                            <li class="col25">
                                <dl>
                                    <dt>目的城市：</dt>
                                    <dd>天津市  天津市  河西区</dd>
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
                                    <dd>轻量</dd>
                                </dl>
                            </li>

                            <li class="col25">
                                <dl>
                                    <dt>持续时间：</dt>
                                    <dd>3日活动</dd>
                                </dl>
                            </li>

                        </ul>
                    </div>
                    <div class="hdDetail ">
                        <ul class="clearfix">
                            <li class="col25">
                                <dl>
                                    <dt>领队：</dt>
                                    <dd>国王无双</dd>
                                </dl>
                            </li>
                            <li class="col75">
                                <dl>
                                    <dt style="width:14%">集合地点：</dt>
                                    <dd class="horiwrap" >asdf</dd>
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
                        <td class="hdName">测试1</td>
                        <td>国王无双</td>
                        <td id="price">200.0</td>
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
                        <td class="hdName" colspan="2">测试1</td>
                        <td>国王无双</td>
                    </tr>
                    <tr class="tableTitle">

                        <td>单价</td>
                        <td>参与人数</td>
                        <td>小计</td>
                    </tr>
                    <tr class="tableInfo">

                        <td id="mb_price">200.0</td>
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
<#include "template/footer.ftl"/>
</body>
</html>