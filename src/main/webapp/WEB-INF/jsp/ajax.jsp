<%--
  Created by IntelliJ IDEA.
  User: wdfwolf3
  Date: 2017/3/8
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>helloworld</title>
    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#testButton").click(function () {
                var $a = $(this);
                $.ajax({
                    url: "http://localhost:8080/hello/ajax",
                    type: 'post',
                    data: 'name=admin&password=123456',
                    dataType: 'html',
                    success: function (data, status) {
                        if (status == "success") {
                            var objs = jQuery.parseJSON(data);
                            var str = "";
                            for (var i = 0; i < objs.length; i++) {
                                str = str + objs[i].activityName + " ";
                            }
                            $("#content").html(str);
                        }
                    },
                    error: function (xhr, textStatus, errorThrown) {
                    }
                });
            });
        });
    </script>
</head>
<body>
<button id="testButton">异步传输</button>
<div id="content"></div>
</body>
</html>
