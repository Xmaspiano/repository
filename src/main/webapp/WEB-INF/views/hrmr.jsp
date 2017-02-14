<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/11
  Time: 上午11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/weui/weui.min.css"/>
    <link rel="stylesheet" href="/static/weui/example.css"/>

    <script src="/static/bootstrap3/js/jquery-1.11.1.min.js"></script>
    <script src="/static/bootstrap3/js/jquery.form-3.51.0.js"></script>
</head>
<body>
<div class="weui-cells weui-cells_radio">
    <label class="weui-cell weui-check__label" for="x11">
        <div class="weui-cell__bd">
            <p>cell standard</p>
        </div>
        <div class="weui-cell__ft">
            <input type="radio" class="weui-check" name="radio1" id="x11">
            <span class="weui-icon-checked"></span>
        </div>
    </label>
    <label class="weui-cell weui-check__label" for="x12">

        <div class="weui-cell__bd">
            <p>cell standard</p>
        </div>
        <div class="weui-cell__ft">
            <input type="radio" name="radio1" class="weui-check" id="x12" checked="checked">
            <span class="weui-icon-checked"></span>
        </div>
    </label>
    <a href="javascript:void(0);" class="weui-cell weui-cell_link">
        <div class="weui-cell__bd">添加更多</div>
    </a>
</div>
</body>
</html>
