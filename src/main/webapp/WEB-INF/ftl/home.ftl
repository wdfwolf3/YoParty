<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>个人主页</title>
</head>
<body>
<img src="/images/timg.jpg" alt="wdfwolf3" >
<img src="http://localhost:8080/images/timg.jpg" alt="wdfwolf3" >
<form method="GET" >
    Name: ${user.name}<br>
    所在地: ${user.locationPro}<br>
    所在城市: ${user.locationCity}<br>
</form>
<br>
<a href="/partner/${user.name}" class="setting-profile">我的活动参与伙伴</a>
<a href="/fullcut/${user.name}" class="setting-profile">我的优惠信息</a>
<a href="/data/${user.name}" class="setting-profile">我的个人资料</a>
<br>
待付款
待参与
待评价
已完成
所有订单
<#list list as l>
活动名称
领队
单价
参与人数
实付金额
交易
list.signupList.orderData
list.signupList.orderNumber
list.signupList.orderNumber
list.activityList.name
list.activityList.leadId
list.activityList.money
list.activityList.signupNumber

<a href="/signup" >付款</a>
<a href="" >取消订单</a>


</#list>



</body>
</html>