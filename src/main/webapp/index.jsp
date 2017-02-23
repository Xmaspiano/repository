<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=3, user-scalable=yes">

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
    <div class="page__bd" style="height: 100%;">
        <div class="weui-tab">
            <div class="tabpage">
                <div class="page weui-tab__panel js_show slideIn" id="bell" data-src="/bell">
                    <jsp:include page="/bell" />
                </div>
                <div class="page weui-tab__panel js_show slideIn" id="pencil" data-src="/pencil">
                    <jsp:include page="/pencil" />
                </div>
                <div class="page weui-tab__panel js_show slideIn" id="home" data-src="/home">
                    <jsp:include page="/home" />
                </div>
                <div class="page weui-tab__panel js_show slideIn" id="search" data-src="/search">

                </div>
            </div>
            <div class="weui-tabbar">
                <a href="javascript:" class="weui-tabbar__item weui-bar__item_on" data-target="#bell">
                    <span style="display: inline-block;position: relative;">
                        <div class="weui-tabbar__icon" style="width: 32px;">
                            <i class="icon-bell icon-2x" style="width: 32px;"></i>
                        </div>
                        <span class="weui-badge" id="bell-badge" style="position: absolute;top: -2px;right: -8px;display:none"></span>
                    </span>
                    <p class="weui-tabbar__label">消息</p>
                </a>
                <a href="javascript:" class="weui-tabbar__item" data-target="#pencil">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-pencil icon-2x" style="width: 32px;"></i>
                    </div>
                    <p class="weui-tabbar__label">添加</p>
                </a>
                <a id="show_main" href="javascript:" class="weui-tabbar__item" data-target="#home">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-globe icon-2x" style="width: 32px;"></i>
                    </div>
                    <p class="weui-tabbar__label">主页</p>
                </a>
                <a href="javascript:" class="weui-tabbar__item" data-target="#search">
                    <div class="weui-tabbar__icon" style="width: 32px;">
                        <i class="icon-search icon-2x" style="width: 32px;"></i>
                    </div>
                    <p class="weui-tabbar__label">搜索</p>
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
<div id="loadmore" style="display: none">
    <div class="weui-loadmore" style="margin-top: 50px;">
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
    </div>
</div>
</body>
<script src="static/js/common.js"></script>
<script type="text/javascript" class="tabbar js_show">
    $(window).load(function() {
        var $tooltips = $('.js_tooltips');

        changePage();
        $(window).on('hashchange', function () {
            changePage();
        });

        $('.weui-tabbar').on('click','.weui-tabbar__item[data-target]', function () {
            if(!$(this).is('.weui-bar__item_on')) {
                $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
                window.location.href = window.location.href.split("#")[0]+$(this).data('target');
            }
        });

        $('#showTooltips').on('click', function(){
            if ($tooltips.css('display') != 'none') return;

            $('.page.cell').removeClass('slideIn');

            $tooltips.css('display', 'block');
            setTimeout(function () {
                $tooltips.css('display', 'none');
            }, 2000);
        });

        if(!!window.EventSource){
            var $globe_spin = $("i.icon-globe");
//            $globe_spin.addClass("icon-spin");

            console.log("连接初始化...");
            $globe_spin.addClass("icon-spin");
            var source = new EventSource('/bell/msg');

            source.addEventListener('update', function(e) {
                console.log("收到消息[update]...");
                var data = JSON.parse(e.data);
                changeBellBadge(data.bellSize);
                createHomeDetial(data.pencil);
                createBellDetial(data.bell);
                $globe_spin.addClass("icon-spin");
            });

            source.addEventListener('change', function(e) {
                console.log("收到消息[change]...");
                var data = JSON.parse(e.data);
                changeBellBadge(data.bellSize);
//                createHomeDetial(data.pencil);
                createBellDetial(data.bell);
                $globe_spin.addClass("icon-spin");
            });

            source.addEventListener('delete', function(e) {
                console.log("收到消息[delete]...");
                var data = JSON.parse(e.data);
                console.log(data);
                changeBellBadge(data.bellSize);
//                createHomeDetial(data.pencil);
                deleteBellDetial(data.bell);
                $globe_spin.addClass("icon-spin");
            });

            source.addEventListener('open', function(e) {
                $globe_spin.addClass("icon-spin");
                console.log("连接打开...");
            }, false);

            source.addEventListener('error', function(e) {
                if (e.target.readyState == EventSource.CLOSED) {
                    $globe_spin.removeClass("icon-spin");
                    console.log(e);
                    console.log("连接关闭...");
                } else {
                    console.log(e.target.readyState );
                }
            }, false);
        } else {
            console.log("没有sse");
        }

    });

    function changePage(){
        var name = location.hash.indexOf('#') === 0 ? location.hash : '#';
        if(name == '#home' || name=='#pencil' ||name == '#bell' || name == '#search'){
            $("a.weui-tabbar__item[data-target="+name+"]").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            if($(name).html().trim() == ""){
                getPage($(name).data('src'),$(name));
            }
            targetShow(name);
        }else if(name == '#hrm'){
//            $("a.weui-tabbar__item[data-target=#pencil]").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
//            targetShow("#pencil");
        }else{
//            targetShow("#bell");
            window.location.href = window.location.href.split("#")[0]+"#bell";
        }
    }

    function callPageShow(item){
        var name = "";
        switch (item){
            case "main":
                name = "#pencil";
                break;
        }
        if(name == '#home' || name=='#pencil' ||name == '#bell' || name == '#search') {
            $("a.weui-tabbar__item[data-target="+name+"]").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            targetShow(name);
        }else{
            window.location.href = window.location.href.split("#")[0]+"#bell";
        }
    }

    function createHomeDetial(obj){
        createNameDetial(obj, "#showDetail-home", "#home-detail");
    }

    function createBellDetial(obj){
        createNameDetial(obj, "#showDetail-bell", "#bell-detail");
    }

    function deleteBellDetial(obj){
        deleteNameDetial(obj, "#bell-detail");
    }

    function createNameDetial(obj, tempDetail, showDetail){
        var $tempDetail = $(tempDetail);
        var $showDetail = $(showDetail);

        $tempDetail.find("h4.weui-media-box__title").html(obj.bt);
        $tempDetail.find("p.weui-media-box__desc").html(obj.wtms);
        $tempDetail.find("a.weui-media-box_appmsg").attr("data-id", obj.id);

        if (obj.answer == false) {
            $tempDetail.find("div.weui-media-box__ft").html("&lt;i class=\"icon-hand-right\" style=\"color: #007dbc\">&lt;/i>");
        } else {
            $tempDetail.find("div.weui-media-box__ft").empty();
        }

        if($showDetail.children().length > 0){
            $showDetail.children("a:first").before($tempDetail.html());
        }else{
            $showDetail.append($tempDetail.html());
        }

    }

    function deleteNameDetial(obj, showDetail){
        var $showDetail = $(showDetail);

        $showDetail.find("a.weui-media-box[data-id='"+obj.id+"']").remove();
    }

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
        }, 1000);
    };

    var $loadingToast = $('#loadingToast');
    function loadingToast(time){
        time = time == null?1000:time;
        var $loadingToast = $('#loadingToast');
        if ($loadingToast.css('display') != 'none') return;

        $loadingToast.fadeIn(100);
        setTimeout(function () {
            $loadingToast.fadeOut(100);
        }, time);
    }

    function loadingToast_close(){
        var $loadingToast = $('#loadingToast');
        if ($loadingToast.css('display') != 'none')
            $loadingToast.css('display','none');
    };

    function changeBellBadge(size){
        changeBadge(size, "#bell-badge");
    }

    function changeBadge(size, name){
        var $bell_badge = $(name);

        if(size == 0){
            $bell_badge.hide();
        }else {
            $bell_badge.html(size);
            $bell_badge.show();
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