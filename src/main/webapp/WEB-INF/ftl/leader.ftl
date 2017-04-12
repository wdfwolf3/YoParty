<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>活动详情</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/yo-party-net/images/logo_ico.png" type="image/x-icon"/>
    <link href="/yo-party-net/css/style.css" rel="stylesheet" type="text/css">
    <link href="/yo-party-net/css/actDetail.css" rel="stylesheet" type="text/css">
    <script src="/yo-party-net/js/jquery/jquery-2.1.4.min.js"></script>
    <script src="/yo-party-net/js/bussiness/leader/detail.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript" src="/yo-party-net/js/common/common.js"></script>

</head>
<body>
<#include "template/js.ftl"/>
<#include "template/head.ftl"/>


<div class="lp-body">
    <input type="hidden" id="event_id" value=""/>
    <!--活动介绍模块-->

    <div class="lp-page clearfix">
        <div class="lp-lside fll">

            <div class="lp-intro clearfix">
                <div class="lp-lintro fll">



                    <img src="/images/uploadFile/photo/2017041214/201704121435302579.jpg"
                         width="250" height="250">





                </div>

                <div class="lp-rintro fll">
                    <div class="lp-rtitle">
                        <h5>国王无双的资料</h5>
                    </div>
                    <div class="ap-rintro-top">
                        <div class="lp-rinto">
                            <table>
                                <tr>
                                    <td class="lp-tr-title">名号:</td>
                                    <td class="lp-4info">国王无双</td>
                                    <td class="lp-tr-title">领队编号:</td>
                                    <td class="lp-4info">5</td>
                                    <td class="lp-tr-title">性别:</td>
                                    <td class="lp-4info">未知</td>
                                </tr>
                                <tr>
                                    <td class="lp-tr-title">简介:</td>
                                    <td class="lp-4info" colspan="5">


                                    </td>
                                </tr>
                                <tr>
                                    <td class="lp-tr-title">兴趣爱好:</td>
                                    <td class="lp-4info" colspan="5">


                                    </td>
                                </tr>
                                <tr>
                                    <td class="lp-tr-title"><p>带队经历:</p></td>
                                    <td class="lp-4info" colspan="5">


                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="ld-ev-tl">
            <h5>等待您参与的活动:</h5>
        </div>
        <!--未参加的活动-->
        <div class="ld-ev-lst clearfix">

        </div>

        <div class="ld-ev-tl">
            <h5>那些年您错过的活动:</h5>
        </div>
        <!--那些年错过的活动-->
        <div class="ld-ev-lst clearfix">

        </div>
    </div>

</div>

<#include "template/footer.ftl"/>
</body>
</html>