<%--
  Created by IntelliJ IDEA.
  User: wdfwolf3
  Date: 2017/3/16
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<table>
    <tr>
        <td>id</td>
        <td><input id="id" value="100"/></td>
    </tr>
    <tr>
        <td>name</td>
        <td><input id="name" value="snowolf"/></td>
    </tr>
    <tr>
        <td>status</td>
        <td><input id="status" value="true"/></td>
    </tr>
    <tr>
        <td><input type="button" id="profile" value="Profile——GET"/></td>
        <td><input type="button" id="login" value="Login——POST"/></td>
    </tr>
</table>
</body>
<script type='text/javascript'>
    $(document).ready(function () {
        $("#profile").click(function () {
            profile();
        });
        $("#login").click(function () {
            login();
        });
    });
    function profile() {
        var url = 'http://localhost:8080/json/';
        var query = $('#id').val() + '/' + $('#name').val() + '/'
            + $('#status').val();
        url += query;
        alert(url);
        $.get('http://localhost:8080/entity', function (data) {
            alert("id: " + data.id + "\nname: " + data.name + "\nstatus: "
                + data.avatar);
        });
    }
    function login() {
        var mydata = '{"name":"' + $('#name').val() + '","id":"'
            + $('#id').val() + '","verify":"' + $('#status').val() + '"}';
        alert(mydata);
        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            url: 'http://localhost:8080/json',
            processData: false,
            dataType: 'json',
            data: mydata,
            success: function (data) {
                alert("id: " + data.id + "\nname: " + data.name + "\nstatus: "
                    + data.status);
            },
            error: function (data) {
                alert("Err:" + "id: " + data.id + "\nname: " + data.name);
            }
        });
    }
</script>
</html>
