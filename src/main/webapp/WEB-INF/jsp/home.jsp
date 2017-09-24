<%--
  Created by IntelliJ IDEA.
  User: wdfwolf6
  Date: 2017/3/2
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<html>
<head>
    <title>个人主页</title>
</head>
<body>
<img src="/images/timg.jpg" alt="wdfwolf3">
<img src="http://localhost:8080/images/timg.jpg" alt="wdfwolf3">
<sf:form method="GET" commandName="user">
    First Name: <sf:input path="name"/><br>
    First Name: <sf:input path="locationPro"/><br>
    First Name: <sf:input path="locationCity"/><br>
</sf:form>
<br>
<a href="/partner" class="setting-profile">我的活动参与伙伴</a>
<a href="/fullcut" class="setting-profile">我的优惠信息</a>
<a href="/data" class="setting-profile">我的个人资料</a>
<br>
待付款
待参与
待评价
已完成
所有订单
<% out.print("");%>
</body>
</html>