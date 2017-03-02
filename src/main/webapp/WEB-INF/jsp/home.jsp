<%--
  Created by IntelliJ IDEA.
  User: wdfwolf3
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
<sf:form method="GET" commandName="user">
    First Name: <sf:input path="firstName" /><br>
    First Name: <sf:input path="firstName1" /><br>
    First Name: <sf:input path="firstName2" /><br>
    First Name: <sf:input path="firstName3" /><br>
    First Name: <sf:input path="firstName4" /><br>
    <a href="">我的活动参与伙伴</a><br>
    <a href="">我的活动参与伙伴</a><br>
    <a href="">我的活动参与伙伴</a><br>
</sf:form>
</body>
</html>
