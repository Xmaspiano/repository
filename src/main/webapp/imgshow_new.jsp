<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/6
  Time: 下午6:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE=html>
<html>
<head>
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/jquery.bottomScrollLoading.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).bottomScrollLoading({
            out:$(document),
            ajaxData:{
                url: "test5.html",  //就是ajax时用的地址
                success:function(ret){
                    //alert(ret);
                    $("#content").append("<div style='height: 500px;background-color: #FF0000;'></div>");
                }
            }
        });
    </script>
</head>
<body>

<div id="content" style="height:960px">
    <div id="follow">this is a scroll test;<br/>    页面下拉自动加载内容</div>
    <div style='border:1px solid tomato;margin-top:20px;color:#ac1;height:800' >hello world test DIV</div>
</div>
</body>
</html>
