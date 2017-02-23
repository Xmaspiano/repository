<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/22
  Time: 上午11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String img = request.getParameter("img") == null?"": URLDecoder.decode(request.getParameter("img"),"UTF-8");
    String img = request.getParameter("img") == null?"":request.getParameter("img");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=0.8, maximum-scale=3, user-scalable=yes">

    <link rel="stylesheet" href="/static/weui/weui.min.css"/>
    <link rel="stylesheet" href="/static/weui/example.css"/>

    <script src="/static/js/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="weui-gallery" id="gallery">
    <span class="weui-gallery__img" id="galleryImg" style="<%= img%>"></span>
    <div class="weui-gallery__opr">
        <a href="javascript:" class="weui-gallery__del">
            <i class="icon-reply icon-2x" style="color: white"></i>
        </a>
    </div>
</div>
</body>
<script>
    $(function(){
         var $gallery= $("#gallery");
        $gallery.fadeIn(200);

        $gallery.on("click", function(){
//            $gallery.fadeOut(200);
//            history.go(-1);
            history.back();
        });
    });
</script>
</html>
