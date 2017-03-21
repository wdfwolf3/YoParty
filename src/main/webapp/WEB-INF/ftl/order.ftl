<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>友派</title>
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <script type="text/javascript" src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/common/common.js"></script>

    <script type="text/javascript" src="/yo-party-net/js/bussiness/order/list.js"></script>
    <link rel="stylesheet" href="/yo-party-net/css/cypager.min.css"/>
    <link href="/yo-party-net/css/style.css" type="text/css" rel="stylesheet"/>
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

<div class="hfbody">
    <div class="hfItem">
        <dl>
            <dt>
                <a href="" target="_blank">



                    <img src="/yo-party-net/images/pic_sun.jpg"
                         style="width: 80px; height: 80px;">


                </a>
            </dt>
            <dd>
                <ul class="dn-u">
                    <li>
                        <h5>
                            <a href="#">
                                国王无双
                            </a>
                        </h5>
                    </li>
                    <li style="margin-top: 20px;width: 200px;">
                        <label>
                            有你有我，友行友派
                        </label>
                    </li>
                </ul>


                <div class="di clearfix flr userInfo-title">
                    <ul class="di-l flr">
                        <div class="row1 flr">
                            <li><a href="/yo-party-net/user_info/personalEdit/companys.shtml">参与伙伴</a></li>
                            <li><a href="javaScript:discout()">优惠信息</a></li>
                            <li><a href="/yo-party-net/user_info/personalEdit/basic.shtml">个人信息</a></li>

                        </div>

                    </ul>

                </div>
            </dd>
        </dl>
    </div>

    <input type="hidden" id="total_count">
    <input type="hidden" id="pageNow">
    <div class="hf-detail clearfix">
        <div class="hf-ldetail fll clearfix">
            <div class="title-bar-wrap clearfix">
                <ul class="bill-bar">
                    <li class="selected">所有订单</li>



                    <li value="1">待付款</li>








                    <li value="2">待参与</li>








                    <li value="3">已完成</li>






                    <li class="last" value="">退款/售后</li>
                </ul>
            </div>
        </div>

    </div>
    <div class="billDetail">
        <table class="tableTitle pc">
            <tbody>
            <tr>
                <td>活动名称</td>
                <td>领队</td>
                <td>单价</td>
                <td>参与人数</td>
                <td>实付金额</td>
                <td>订单状态</td>
                <td>交易</td>
            </tr>

            </tbody>
        </table>

    </div>
    <div class="billDetail" id="orderInfo">
        <table class="tableInfo">
            <tr>
                <td colspan="7">暂无订单</td>
            </tr>

        </table>
    </div>
    <div class="myPagePlug">
        <div id="pagerArea" unselectable="on" onselectstart="return false;" style="-moz-user-select:none;">

        </div>
        <div id="console" style='padding-left:10px'></div>
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
<script type="text/javascript" src="/yo-party-net/js/jquery/cypager.min.js"></script>
<script>
    var pageSize = 10;
    var pg_prev_name = "上一页";
    var pg_next_name = "下一页"
    $(function () {
        $("#pagerArea").cypager({
            pg_size: pageSize,
            pg_nav_count: 8,
            pg_cur_count: $('#pageNow').val(),
            pg_total_count: $('#pageNow').val(),
            pg_prev_name: pg_prev_name,
            pg_next_name: pg_next_name,
            pg_call_fun: function (count) {
                showPage(count)
            }
        });
        loadData({'pageNow': 1})
        $(".bill-bar li").click(function () {
            $(".bill-bar").find('li.selected').toggleClass('selected');
            $(this).toggleClass('selected');
            o_status = $(this).val();
            filter_data = {'pageNow': 1, 'eventOrderFormMap.status': o_status}
            loadData(filter_data)

        })
        function showPage(pageNow) {
            o_status = $(".bill-bar").find('li.selected').val();
            filter_data = {'pageNow': pageNow, 'eventOrderFormMap.status': o_status}
            loadData(filter_data)

        }

        function loadData(para) {
            var url = rootPath + "/event_order/findByPage.shtml";
            para['pageSize'] = pageSize;
            data = CommnUtil.ajax(url, para, "json");
            var html = ""
            if (CommnUtil.notNull(data) && CommnUtil.notNull(data.records) && data.records.length > 0) {
                //设置总数
                $('#total_count').val(data.rowCount);
                $('#pageNow').val(data.pageNow);
                var oProduct;
                records = data.records;

                for (var i = 0, l = records.length; i < l; i++) {
                    oProduct = records[i];

                    if (CommnUtil.isPhone()) {
                        html += ('<table class="mb_billInfo">'
                        + '<tr>'
                        + '<td colspan="2" class="billNo">订单号：<a href="' + rootPath + '/event/eventOrderUI/' + oProduct.id + '.shtml" class="billDetail_a" >' + CommnUtil.notEmpty(oProduct.order_no) + '</a></td>'
                        + '<td>' + oProduct.status + '</td>'

                        + '</tr>'
                        + '<tr>'
                        + '<td colspan="3">'+oProduct.title+'</td>'
                        + '</tr>'
                        + '<tr>'
                        + '<td>领队:'+oProduct.leader_name+'</td>'
                        + '<td colspan="2">'+CommnUtil.notEmpty(new Date(oProduct.create_time).format("yyyy-MM-dd hh:mm:ss"))+'</td>'
                        + '</tr>'
                        + '<tr>'
                        + '<td>单价:'+oProduct.price+' </td>'
                        + '<td colspan="2">实付'+oProduct.final_total+'(共'+oProduct.people_num+'人)</td>'
                        + '</tr>'
                        + '</table>')
                    } else {
                        html += ('<table class="tableInfo" ><tr>'
                        + '<td colspan="6" class="billNo">订单号：<a href="'+rootPath+'/event/eventOrderUI/'+oProduct.id+'.shtml" class="billDetail_a" >' + CommnUtil.notEmpty(oProduct.order_no) + '</a></td>'
                        + '<td >' + CommnUtil.notEmpty(new Date(oProduct.create_time).format("yyyy-MM-dd hh:mm:ss")) + '</td>'
                        + '</tr>'
                        + '<tr >'
                        + '<td >' + oProduct.title + '</td>'
                        + '<td>' + oProduct.leader_name + '</td>'
                        + '<td>' + oProduct.price + '</td>'
                        + '<td>' + oProduct.people_num + '</td>'
                        + '<td>' + oProduct.final_total + '</td>'
                        + '<td>' + oProduct.status + '</td>'
                        + '<td><p>付款</p><p>取消订单</p></td>'
                        + '</tr></table>')
                    }

                }

            } else {
                $('#total_count').val(0);
                $('#pageNow').val(1);
                html = '<table class="tableInfo"><tr><td colspan="7">暂无订单</td></tr></table>'
                have_data = false;
            }
            $("#orderInfo").html(html)
            $("#pagerArea").cypager({
                pg_size: pageSize,
                pg_nav_count: 8,
                pg_cur_count: $('#pageNow').val(),
                pg_total_count: $('#total_count').val(),
                pg_prev_name: pg_prev_name,
                pg_next_name: pg_next_name,
                pg_call_fun: function (count) {
                    showPage(count)
                }
            });
        }
    });
    function discout() {
        layer.alert("您暂时没有优惠信息,请积极关注友派的优惠活动.")
    }


</script>
</html>
