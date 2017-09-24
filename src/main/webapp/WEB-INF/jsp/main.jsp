<%--
  Created by IntelliJ IDEA.
  User: wdfwolf3
  Date: 2017/3/6
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<sec:authentication property="principal.username" var="name"/>
<sec:authorize access=" hasRole('ROLE_ADMIN')">
    <a href="/admin">管理员</a>
</sec:authorize>
<s:url value="/data/{name}" var="url">
    <s:param name="name" value="${name}"/>
</s:url>
<p>${name}</p>
<a id="home" href="${url}">个人主页</a>
<a id="login" href="/login">登录</a>
<a id="register" href="/register">注册</a>

</body>
</html>
