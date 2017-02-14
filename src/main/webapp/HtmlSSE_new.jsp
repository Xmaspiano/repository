<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/9
  Time: 上午11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <%--<link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="/static/weui/weui.min.css"/>
    <%--<link rel="stylesheet" href="/static/weui/example.css"/>--%>

    <script src="/static/bootstrap3/js/jquery-1.11.1.min.js"></script>
    <script src="/static/bootstrap3/js/jquery.form-3.51.0.js"></script>
</head>
<body ontouchstart>
<!DOCTYPE html><html><head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="https://production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico">
    <link rel="mask-icon" type="" href="https://production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111">
    <title>CodePen - WeUI-Form-Submit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet prefetch" href="https://res.wx.qq.com/open/libs/weui/0.3.0/weui.css">

    <style>
        body{
            background-color: #efeff4;
        }
    </style>

    <script>
        window.console = window.console || function(t) {};
    </script>



    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>

</head>

<body translate="no" ontouchstart="">

<div id="msg_from_server"></div>
<script type="text/javascript">
    if (!!window.EventSource) {
        var source = new EventSource('/bell/msg'); //为http://localhost:8080/testSpringMVC/push
        s='';
        source.addEventListener('update', function(e) {
            alert(e);
            s+=e.data+"<br/>"
            $("#msg_from_server").html(s);

        });

        source.addEventListener('open', function(e) {
            console.log("连接打开.");
        }, false);

        source.addEventListener('error', function(e) {
            if (e.readyState == EventSource.CLOSED) {
                console.log("连接关闭");
            } else {
                console.log(e.readyState);
            }
        }, false);
    } else {
        console.log("没有sse");
    }
</script>
</body></html>
</body>
</html>
