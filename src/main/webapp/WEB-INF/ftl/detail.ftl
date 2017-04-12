<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>活动详情</title>
    <meta charset="utf-8">
    <!-- name="viewport" 的详细用法  http://www.php100.com/html/webkaifa/HTML5/2012/0831/10979.html -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <link href="/yo-party-net/css/actDetail.css" rel="stylesheet" type="text/css">
    <script src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/jbase64.js"></script>

    <script src="/yo-party-net/js/P7ssm/unslider-min.js"></script>
    <script src="/yo-party-net/js/P7ssm/show.js"></script>
    <script src="/yo-party-net/js/bussiness/event_info/detail.js"></script>
</head>
<body>


<head>
<#include "template/js.ftl"/>
</head>

<#include "template/head.ftl"/>


<div class="ap-body">
    <input type="hidden" id="event_id" value="15"/>
    <!--活动介绍模块-->
    <div class="ap-title">
        <h2>${activity.title}</h2>
    </div>

    <div class="activityprofile clearfix">
        <div class="ap-lside fll">

            <div class="ap-intro clearfix">
                <div class="ap-lintro fll">

                    <div id="p7ssm">
                        <div id="p7ssm_cf" style="left: 6px; top: 6px; visibility: hidden; opacity: 0.99;"></div>
                        <div id="p7ssm_loading" style="top: 126px; left: 163px; visibility: hidden;"><img
                                src="/yo-party-net/images/loading.gif" alt="" width="78" height="8"></div>
                        <table id="p7ssm_fstbl" border="0" cellpadding="0" cellspacing="0" summary="Fullsize Image">
                            <tbody>
                            <tr>
                                <td>
                                    <div id="p7ssm_fullsize">
                                        <div id="p7ssm_fsc">
                                            <div id="p7ssm_fsw" style="overflow: visible;">
                                                <div id="p7ssm_fsimg"><a href="" id="p7ssm_fslink"><img

                                                        src="/images/uploadFile/image/2017041118/201704111803042555_thumb.png"
                                                        alt="点击查看详情" name="p7ssm_im" border="0"
                                                        id="p7ssm_im" style="visibility: visible; opacity: 0.99;"></a>
                                                </div>
                                                <div id="p7ssm_description"></div>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div id="p7SSMwhmb">
                            <div id="p7ssm_thumbs">
                                <div id="p7SSMwp_1" style="overflow: hidden; height: auto;">
                                    <div class="p7ssm_thumb_section" style="display: block;">
                                        <ul><!-- 修改内容开始 -->

                                            <li>

                                                <a href="/images/uploadFile/image/2017041118/201704111803042555_thumb.png"
                                                   class='down'>
                                                    <img src="/images/uploadFile/image/2017041118/201704111803042555_thumb.png"></a>
                                                <div class="p7ssm_lk">

                                                </div>
                                                <div class="p7ssm_fd"></div>
                                            </li>


                                            <!-- 修改内容结束 --></ul>
                                        <br class="p7ssm_clearThumbs">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="p7ssm_toolbar">
                            <div class="p7ssm_sectionTrigger"><a id="p7SSMtp_1" href="#" class="down">New Image Set</a>
                            </div>
                            <div id="p7ssm_dragbar" title="Move"><span>Move</span></div>
                            <div id="p7ssm_preview">
                                <table summary="Thumbnail Preview">
                                    <tbody>
                                    <tr>
                                        <td><img src=""
                                        ></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="p7ssm_tools">
                                <table border="0" cellpadding="0" cellspacing="0" summary="Slideshow Toolbar">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div id="p7ssm_nav_wrapper"><a id="p7SSMtnav" href="#" title="Menu"><em>Navigate</em></a>
                                                <div id="p7SSMwnav">
                                                    <div id="p7ssm_navList">
                                                        <ul>
                                                            <li></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><a href="#" title="Hide or Show Thumbnails" id="p7SSMthmb"><em>Hide
                                            Thumbs</em></a></td>
                                        <td><a href="#" id="p7ssm_first" title="First Image"><em>First</em></a></td>
                                        <td><a href="#" id="p7ssm_prev" title="Previous Image"><em>Previous</em></a>
                                        </td>
                                        <td><a href="#" id="p7ssm_pp" class="p7ssm_pause" title="Pause Slideshow"><em>Pause</em></a>
                                        </td>
                                        <td><a href="#" id="p7ssm_next" title="Next Image"><em>Next</em></a></td>
                                        <td><a href="#" id="p7ssm_last" title="Last Image"><em>Last</em></a></td>
                                        <td>
                                            <div id="p7ssm_slidechannel">
                                                <div id="p7ssm_slider" style="left: 0px;"><a href="#"
                                                                                             id="p7ssm_slidebar"
                                                                                             title="Delay: 5 seconds"><em>Set
                                                    Speed</em></a></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <script type="text/javascript">
                            P7_SSMinit(1, 1, 1, 1, 0, 1, 1, 1, 5);
                        </script>
                    </div>
                </div>
                <div class="mobile-rintro">
                    <table>
                        <tr>
                            <td class="mb-tl">日期:</td>
                            <td class="mb-inf">2017年04月24日</td>
                            <td colspan="2" class="price">￥200</td>
                        </tr>
                        <tr>
                            <td class="mb-tl">领队:</td>
                            <td class="mb-inf">国王无双</td>
                            <td class="mb-tl">状态:</td>
                            <td class="mb-inf"></td>
                        </tr>
                    </table>
                </div>
                <div class="ap-rintro fll">
                    <div class="ap-rintro-top">
                        <!--<p class="price">￥550<span>起</span></p>-->
                        <div class="tour-intro">
                            <!--类型一，类型二，类型三-->
                            <div class="bytwo ap-3col">
                                <dl class="clearfix">
                                    <dt>活动性质:</dt>
                                    <dd>${activity.type1}</dd>
                                </dl>
                                <dl class="clearfix">
                                    <dt>活动强度:</dt>
                                    <dd>${activity.type2}</dd>
                                </dl>
                                <dl class="clearfix">
                                    <dt>持续时间:</dt>
                                    <dd>${activity.type3}</dd>
                                </dl>
                            </div>
                            <!--出发地，目的地-->
                            <div class="bytwo ap-2col">
                                <dl class="clearfix">
                                    <dt>出发城市:</dt>
                                    <dd>${activity.origin}</dd>
                                </dl>
                                <dl class="clearfix">
                                    <dt>目的城市:</dt>
                                    <dd>${activity.destination}</dd>
                                </dl>
                            </div>

                            <!--出发时间-->
                            <div class="bytwo ap-1col">
                                <dl class="clearfix">
                                    <dt>出发时间:</dt>
                                    <dd>${activity.startTime}</dd>
                                </dl>
                            </div>
                            <!--返回时间-->
                            <div class="bytwo ap-1col">
                                <dl class="clearfix">
                                    <dt>返回时间:</dt>
                                    <dd>${activity.endTime}</dd>
                                    <input type="hidden" id="countTime" value="${countTime}">
                                </dl>
                            </div>
                            <!--状态-->
                            <div class="bytwo ap-2col pri_btn">
                                <dl class="clearfix">
                                    <dt>活动状态:</dt>
                                    <dd>

                                    </dd>
                                </dl>
                            <div class=""><p class="price">￥${activity.price}</p></div>
                            </div>
                            <!--距离报名结束时间和我要报名啊你牛-->
                            <div class="time bytwo clearfix" id="timer">
                                <div class="remaining">距报名截止还有：
                                    <div class="timer">
                                        <span class="day" id="day">0</span>天<span class="hour" id="hour">0</span>小时<span
                                            class="minute" id="minute">0</span>分<span class="second"
                                                                                      id="second">0</span>秒
                                    </div>
                                </div>
                                <div class="signup">
                                    <button type="submit" value="true" name="ijoin" id="hdOpBtn"
                                    >我要报名
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="ap-rside fll">
            <div class="ap-rside-box">
                <div class="leader">
                    <div class="lheader clearfix">
                        <h5>领队</h5>
                    </div>
                    <div class="pic_info clearfix">
                        <div class="pic clearfix">
                            <a class="p fll" href="/yo-party-net/leader/detail/5.shtml" target="_blank">


                                <img src="/yo-party-net/images/pic_sun.jpg"
                                     width="60" height="60">


                            </a>
                            <div class="i fll">
                                <p class="na"><a href="/yo-party-net/leader/detail/5.shtml"
                                                 target="_blank">${mainLeader.nickname}</a></p>
                            </div>
                        </div>
                        <div class="c fll clearfix">
                            <p>手机号：<span>${mainLeader.telephone}</span></p>
                            <p class="winxin">微信号：<span>${mainLeader.wechat}</span></p>
                            <p class="ledtime">微信二维码： <img id="wechate_qr"
                                                           onclick="showLeaderQr('/images')"
                                                           src="/yo-party-net/images/qr_code.png" width="16px"
                                                           height="16px"/>


                            </p>
                        </div>
                    </div>
                </div>
                <div class="lines">
                    <hr>
                </div>
                <div class="vice_leader">
                    <div class="lheader clearfix">
                        <h5>副领队</h5>
                    </div>
                    <div class="c fll clearfix linfo">
                        <#list assistLeaderList as ass>
                            ${ass.nickname}
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--活动详情模块-->
    <div class="hd-detail clearfix">
        <div class="hd-ldetail fll clearfix" style="width:883px">
            <!--滚动的标签 -->
            <div id="scroll_tap" class="sc_tap pad-pc">
                <ul class="sc-title-bar" id="sc_content_bar">


                    <li


                            class="selected"


                            id="sc_event_tab_1" onclick="scTabSelect(1)"
                            style="width:175.8px">活动简介
                    </li>

                    <li


                            id="sc_event_tab_2" onclick="scTabSelect(2)"
                            style="width:175.8px">行程安排
                    </li>

                    <li


                            id="sc_event_tab_3" onclick="scTabSelect(3)"
                            style="width:175.8px">费用说明
                    </li>

                    <li


                            id="sc_event_tab_4" onclick="scTabSelect(4)"
                            style="width:175.8px">注意事项
                    </li>

                    <li class="last" style="width:175.8px">
                        <button type="submit" id="scOpBtn">我要报名</button>
                    </li>
                </ul>

            </div>
            <div id="pc_tab_div" class="title-bar-wrap clearfix">
                <ul class="title-bar" id="content_bar">

                    <li


                            class="selected"


                            id="event_tab_1" onclick="tabSelect(1)"
                            style="width:220.0px">活动简介
                    </li>

                    <li


                            id="event_tab_2" onclick="tabSelect(2)"
                            style="width:220.0px">行程安排
                    </li>

                    <li


                            id="event_tab_3" onclick="tabSelect(3)"
                            style="width:220.0px">费用说明
                    </li>

                    <li


                            class="last"


                            id="event_tab_4" onclick="tabSelect(4)"
                            style="width:220.0px">注意事项
                    </li>

                </ul>
            </div>
            <div id="content_detail">


                <div class="hd-content selected"
                     id="event_detail_1"><p>${activity.introduce}<br/></p></div>


                <div class="hd-content" id="event_detail_2">${activity.trip}</div>


                <div class="hd-content" id="event_detail_3">${activity.expenses}</div>


                <div class="hd-content" id="event_detail_4">${activity.attention}</div>


            </div>


        </div>
    </div>
</div>
<div class="mb_sign">
    <button type="submit" value="true" name="ijoin" id="mbOpBtn">我要报名
    </button>
</div>
<#include "template/footer.ftl"/>

</body>
</html>