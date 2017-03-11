<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<#list list as names>
${names.name}
</#list>
<div class="changePage">
    <div class="snPages">
    <#import "querypage.ftl" as p>
    <#assign parameterMap = {} />
    ${param.pageCount}
    <@p.pager pager = param  baseUrl = "/page"/>
    </div>
</div>
</body>
</html>