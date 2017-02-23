<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/7
  Time: 下午4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/weui/weui.min.css"/>
    <link rel="stylesheet" href="/static/weui/example.css"/>

    <script src="/static/js/jquery-1.11.1.min.js"></script>
</head>
<body onload="<c:if test="${error}">toolShow('${error}')</c:if>">
<div class="weui-toptips weui-toptips_warn js_tooltips">${error}</div>
<div class="container" id="container">
    <form id="form1" role="form">
        <div class="page input js_show">
            <div class="weui-cells__title">登陆</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="username" type="text" placeholder="请输入OA登陆账号">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="password" type="password" placeholder="请输入密码">
                    </div>
                </div>
                <div class="weui-cell weui-cell_switch">
                    <div class="weui-cell__bd">自动登陆</div>
                    <div class="weui-cell__ft">
                        <input class="weui-switch" type="checkbox" name="rememberMe" value="true">
                    </div>
                </div>
            </div>
            <div class="weui-btn-area">
                <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">确定</a>
            </div>
        </div>
    </form>
</div>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">数据加载中</p>
    </div>
</div>
</body>
<script type="text/javascript" class="input js_show">
    $(function(){
        $("input.weui-input[name=username]").focus();

        $(document).on("keyup",function(event){
            if(event.keyCode ==13){
                $("#showTooltips").trigger("click");
            }
        });

        $("#showTooltips").on('click',function(){
            $.ajax({
                type: "POST",
                url: "/login",
                data: $("#form1").serialize(),
                beforeSend: function(){
                    if($("input.weui-input[name='username']").val() == ""){
                        toolShow("用户名不能为空...");
                        return false;
                    }

                    if($("input.weui-input[name='password']").val() == ""){
                        toolShow("密码不能为空...");
                        return false;
                    }

                    loadingToast();
                },
                success: function(msg){
                    loadingToast_close();
                    if(msg.success){
                        window.location.href = msg.url
                    }else{
                        toolShow(msg.error);
                    }
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
                    loadingToast_close();
                    toolShow(textStatus);
                }
            });
        });
    });
    function toolShow(text){
        $tooltips = $('.js_tooltips');
        $tooltips.html(text);
        $('.page.cell').removeClass('slideIn');

        $tooltips.css('display', 'block');
        setTimeout(function () {
            $tooltips.css('display', 'none');
        }, 2000);
    }

    var $loadingToast = $('#loadingToast');
    function loadingToast(){
        var $loadingToast = $('#loadingToast');
        if ($loadingToast.css('display') != 'none') return;

        $loadingToast.fadeIn(100);
        setTimeout(function () {
            $loadingToast.fadeOut(100);
        }, 6000);
    }

    function loadingToast_close(){
        var $loadingToast = $('#loadingToast');
        if ($loadingToast.css('display') != 'none')
            $loadingToast.css('display','none');
    };
</script>
</html>
