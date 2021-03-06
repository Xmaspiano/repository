<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = request.getParameter("id") == null?"":request.getParameter("id");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3, user-scalable=yes">

    <link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/weui/weui.min.css"/>
    <link rel="stylesheet" href="/static/weui/example.css"/>

    <script src="/static/js/jquery-1.11.1.min.js"></script>
    <script src="/static/js/jquery.form-3.51.0.js"></script>
    <script src="/static/weui/exif.js"></script>
</head>
<style>
</style>
<body>
<div class="weui-toptips weui-toptips_warn js_tooltips">错误提示</div>
<div class="page tabbar js_show">
    <input type="hidden" id="pencilid" value="<%=id%>"/>
    <div class="page__bd" style="height: 100%;">
        <div class="weui-tab">
            <div class="tabpage">
                <div class="page weui-tab__panel js_show slideIn" id="tab01" data-src="/pencil/up?id=<%=id%>">
                    <jsp:include page="/pencil/up">
                        <jsp:param name="id" value="<%=id%>" />
                    </jsp:include>
                </div>
                <div class="page weui-tab__panel js_show slideIn" id="tab02" data-src="/answer?id=<%=id%>">

                </div>
                <div class="page weui-tab__panel js_show slideIn" id="tab03" data-src="/message?id=<%=id%>">

                </div>
                <div class="page weui-tab__panel js_show slideIn" id="tab04" data-src="/search">

                </div>
            </div>
            <div class="weui-tabbar">
                <a id="show_main" href="javascript:" class="weui-tabbar__item weui-bar__item_on" data-target="#tab01">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-pencil icon-2x" style="width: 32px;"></i>
                    </div>
                    <p class="weui-tabbar__label">描述</p>
                </a>
                <a href="javascript:" class="weui-tabbar__item" data-target="#tab02">
                    <span style="display: inline-block;position: relative;">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-edit icon-2x" style="width: 32px;"></i>
                        <span class="weui-badge" id="tab02-badge" style="position: absolute;top: -2px;right: -8px;display:none"></span>
                    </div>
                        </span>
                    <p class="weui-tabbar__label">处理</p>
                </a>
                <a href="javascript:" class="weui-tabbar__item" data-target="#tab03">
                    <span style="display: inline-block;position: relative;">
                        <div class="weui-tabbar__icon" style="width: 32px;">
                            <i class="icon-comments-alt icon-2x" style="width: 32px;"></i>
                        </div>
                        <span class="weui-badge" id="tab03-badge" style="position: absolute;top: -2px;right: -8px;display:none"></span>
                    </span>
                    <p class="weui-tabbar__label">留言</p>
                </a>
                <a href="javascript:" class="weui-tabbar__item" data-target="#tab04">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-file-alt icon-2x" style="width: 32px;"></i>
                    </div>
                    <p class="weui-tabbar__label">记录</p>
                </a>
                <a href="javascript:" class="weui-tabbar__item" data-target="_back">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-reply icon-2x" style="width: 32px;"></i>
                    </div>
                    <p class="weui-tabbar__label">返回</p>
                </a>
            </div>
        </div>
    </div>
</div>
<div id="dialogs">
    <div class="js_dialog" id="iosDialog" style="opacity: 1; display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd"></div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">了解</a>
            </div>
        </div>
    </div>
</div>
<div class="weui-gallery" id="gallery">
    <span class="weui-gallery__img" id="galleryImg"></span>
    <div class="weui-gallery__opr">
        <a href="javascript:" class="weui-gallery__del">
            <i class="weui-icon-delete weui-icon_gallery-delete"></i>
        </a>
    </div>
</div>
<form id="postImg" action="imgShow.jsp" method="post">
    <input type="hidden" name="img" value=""/>
</form>
<div id="toast" style="display: none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-icon-success-no-circle weui-icon_toast"></i>
        <p class="weui-toast__content">已完成</p>
    </div>
</div>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">数据加载中</p>
    </div>
</div>

</body>
<script src="static/js/common.js"></script>
<script type="text/javascript" class="tabbar js_show">
    $(window).load(function() {
        var $tooltips = $('.js_tooltips');

        //根据URL切换首次显示页面
        changePage();

        $(window).on('hashchange', function () {
            var state = history.state || {};
            changePage();
        });

        $('.weui-tabbar').on('click','.weui-tabbar__item[data-target]', function () {
            if($($(this)).data("target") == "_back"){
                window.location.href = "/";
                return false;
            }

            window.location.href = window.location.href.split("#")[0]+$(this).data('target');
        });

//        badget();
    });

    function targetShow(target){
        //主页面内主页面切换
        $(target).children(target+"-showpage").children("div").each(function(){
            $(this).hide();
        });
        $(target).children(target+"-showpage").children("div"+target.replace("#",".")).show();

        //主页面切换
        $(target).parent().children("div").each(function(){
            $(this).hide();
        });

        $(target).show();
    }

    function toast(){
        var $toast = $('#toast');
        if ($toast.css('display') != 'none') return;

        $toast.fadeIn(100);
        setTimeout(function () {
            $toast.fadeOut(100);
        }, 2000);
    };

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

    function toolShow(text){
        $tooltips = $('.js_tooltips');
        $tooltips.html(text);
        $('.page.cell').removeClass('slideIn');

        $tooltips.css('display', 'block');
        setTimeout(function () {
            $tooltips.css('display', 'none');
        }, 2000);
    }

    function showTab(firstshow){
        $(".weui-tabbar__item[data-target='#"+firstshow+"']").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        getPage($("#" + firstshow).data('src'), "#" + firstshow);
        targetShow("#"+firstshow);
        badget();
    }

    function badget(){
        $.ajax({
            type: "POST",
            url: "/message/size",
            data: {
                id:$("#pencilid").val()
            },
            beforeSend: function(){

            },
            success: function(msg){
                var $tab02_badge = $("#tab02-badge");
                var $tab03_badge = $("#tab03-badge");
                if(msg.sizeMsg == 0){
                    $tab03_badge.hide();
                }else {
                    $tab03_badge.html(msg.sizeMsg);
                }

                if(msg.sizeAse == 0){
                    $tab02_badge.hide();
                }else {
                    $tab02_badge.html(msg.sizeAse);
                }

            },
            error:function(XmlHttpRequest,textStatus,errorThrown){

            }
        });
    }

    function changePage(){
        var name = location.hash.indexOf('#') === 0 ? location.hash : '#';
        if(name == '#tab01' || name=='#tab02' ||name == '#tab03' || name == '#tab04'){
            $("a.weui-tabbar__item[data-target="+name+"]").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            if($(name).html().trim() == "" || name =='#tab02' || name == '#tab03' ) {
                $(name).html("");
                getPage($(name).data('src'), $(name));
            }
            targetShow(name);
        }else if(name == '#hrm'){
//            targetShow("#tab01");
        }else{
//            targetShow("#bell");
            window.location.href = window.location.href.split("#")[0]+"#tab01";
        }
    }

    function callPageShow(item){
        var name = "";
        switch (item){
            case "main":
                name = "#tab01";
                break;
        }
        if(name == '#tab01' || name=='#tab02' ||name == '#tab03' || name == '#tab04'){
            $("a.weui-tabbar__item[data-target="+name+"]").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            targetShow(name);
        }else{
            window.location.href = window.location.href.split("#")[0]+"#bell";
        }
    }

    //照片上传提示
    function alertDialog(msg){
        $('div.weui-dialog__bd').html(msg);
        $('#iosDialog').fadeIn(200);
    }

    $('#dialogs').on('click', '.weui-dialog__btn', function(){
        $(this).parents('.js_dialog').fadeOut(200);
    });
</script>
</html>