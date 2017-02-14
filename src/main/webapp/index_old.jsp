<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2016/12/23
  Time: 上午9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Title</title>

    <link rel="stylesheet" href="/static/bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/weui/weui.min.css"/>
</head>
<style>
    .pad-nav1{
        padding: 8px;
    }
    .hz-top{
        vertical-align: top;
        background-color:red;
        margin:-7px -7px 0px -12px;
        position:absolute;
        z-index: 5000;
    }
    .hz-top-header{
        vertical-align: top;
        background-color:red;
        margin:-11px -7px 0px -9px;
        position:absolute;
        z-index: 5000;
    }

    /*div.row:hover{*/
    /*display: block;*/
    /*background: green;*/
    /*padding: 1px;*/
    /*}*/

    .weui-uploader__files li.round-90{
        transform:rotate(90deg);
    }
    .weui-uploader__files li.round-180{
        transform:rotate(180deg);
    }
    .weui-uploader__files li.round-270{
        transform:rotate(270deg);
    }

</style>
<body style="background-color: #DDDDDD">
<nav id="nav1" class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" style="padding: 2px 8px" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <i class="icon-search icon-2x" style="color: #007dbc"></i>
            </button>
            <button type="button" class="navbar-toggle visible-xs-inline-block" style="padding: 2px 8px;z-index: 4999">
                <i class="icon-bell-alt icon-2x" style="color: #007dbc"><span class="badge hz-top">4</span></i>
            </button>
            <button id="pencil" type="button" class="navbar-toggle collapsed" style="padding: 2px 8px">
                <i class="icon-pencil icon-2x" style="color: #007dbc"></i>
            </button>
            <button type="button" class="navbar-toggle visible-xs-inline-block" style="padding: 2px 8px">
                <i class="icon-home icon-2x" style="color: #007dbc"></i>
            </button>

            <a type="button" class="navbar-brand pad-nav1 visible-xs-inline-block" style="z-index: 5000;" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <i class="icon-globe icon-2x icon-spin" style="color: #007dbc"></i>
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" aria-expanded="false">
            <ul class="nav navbar-nav hidden-xs">
                <li class="active">
                    <a href="#" style="padding: 11px">
                        <i class="icon-globe icon-2x icon-spin" style="color: #007dbc"></i>
                    </a>
                </li>
                <li><a href="#">首页</a></li>
                <li><a href="#">添加</a></li>
                <li><a href="#">消息<span class="badge hz-top-header">4</span></a></li>
                <li><a href="#">搜索</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">清单<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-xs">
                <li><a href="#"><i class="icon-cog">&nbsp;</i>设置</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user">&nbsp;</i>用户 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><i class="icon-list-alt">&nbsp;</i>用户资料</a></li>
                        <li><a href="#">to be continued</a></li>
                        <li><a href="#">...</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="icon-signout">&nbsp;</i>退出</a></li>
                    </ul>
                </li>
            </ul>
            <%-- phone toolbar dropdown --%>
            <br>
            <form class="visible-xs-inline-block" role="form" style="width: 100%">
                <div class="form-group">
                    <input type="search" class="form-control" id="title" placeholder="search...">
                </div>
                <button type="submit" class="btn btn-default">search</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse visible-xs-inline-block container-fluid" id="bs-example-navbar-collapse-2" aria-expanded="false"
     style="width:100%;position:fixed;z-index: 5000;background-color: #BBBBBB">
    <ul class="nav navbar-nav">
        <li><a href="#">
            <i class="icon-user">&nbsp;</i>用户</a>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">清单<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
                <li class="divider"></li>
                <li><a href="#">One more separated link</a></li>
            </ul>
        </li>

        <li><a href="#"><i class="icon-cog">&nbsp;</i>设置</a></li>
        <li><a href="#"><i class="icon-signout">&nbsp;</i>退出</a></li>
    </ul>
</div><!-- /.navbar-collapse -->


<div id="div2" class="page" style="z-index: 4999;background-color: #FFFFFF">
    <%for(int i=0; i<10; i++){%>
    <ul class="row show-detal" style="padding: 0px;background-color: #DDDDDD;margin:1px">
        <div class="col-xs-10"><h4>标题</h4></div>
        <div class="col-xs-2" style="background-color: #996666">类</div>
        <div class="col-xs-12">描述信息</div>
        <div class="col-xs-6">发起日期</div>
        <div class="col-xs-6">组</div>
        <div class="col-xs-12">执行人清单</div>
        <div class="col-xs-12">标签</div>
    </ul>
    <%}%>
</div>

<div id="div3" role="main" class="main container-fluid" style="z-index: 4999;display: none">
    <br>
    <form role="form">
        <div class="form-group">
            <label for="bt">标题</label>
            <input type="text" class="form-control" id="bt" placeholder="Enter email">
        </div>
        <div class="form-group">
            <label for="ms">描述</label>
            <textarea id="ms" class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group">

            <div class="" id="container">
                <div class="page uploader js_show">
                    <div class="page__bd">
                        <div class="weui-gallery" id="gallery" style="z-index: 5001;">
                            <span class="weui-gallery__img" id="galleryImg"></span>
                            <div class="weui-gallery__opr">
                                <a href="javascript:" class="weui-gallery__del">
                                    <i class="weui-icon-delete weui-icon_gallery-delete"></i>
                                </a>
                            </div>
                        </div>

                        <div class="weui-cells weui-cells_form">
                            <div class="weui-cell">
                                <div class="weui-cell__bd">
                                    <div class="weui-uploader">
                                        <div class="weui-uploader__hd">
                                            <p class="weui-uploader__title">图片上传</p>
                                            <div class="weui-uploader__info">0/9</div>
                                        </div>
                                        <div class="weui-uploader__bd">
                                            <ul class="weui-uploader__files" id="uploaderFiles" style="margin-bottom: 0px;">
                                                <%--<img src="/static/weui/pic_160.png" class="weui-uploader__file">--%>
                                                <%--<li class="weui-uploader__file" style="background-image:url(/static/weui/pic_160.png)"></li>--%>
                                                <%--<li class="weui-uploader__file" style="background-image:url(/static/weui/pic_160.png)"></li>--%>
                                                <%--<li class="weui-uploader__file" style="background-image:url(/static/weui/pic_160.png)"></li>--%>
                                                <%--<li class="weui-uploader__file weui-uploader__file_status" style="background-image:url(/static/weui/pic_160.png)">--%>
                                                    <%--<div class="weui-uploader__file-content">--%>
                                                        <%--<i class="weui-icon-warn"></i>--%>
                                                    <%--</div>--%>
                                                <%--</li>--%>
                                                <%--<li class="weui-uploader__file weui-uploader__file_status" style="background-image:url(/static/weui/pic_160.png)">--%>
                                                    <%--<div class="weui-uploader__file-content">50%</div>--%>
                                                <%--</li>--%>
                                            </ul>
                                            <div class="weui-uploader__input-box">
                                                <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="lb">类别</label>
            <select id="lb" class="form-control">
                <option>A</option>
                <option>B</option>
                <option>C</option>
            </select>
        </div>
        <div class="form-group">
            <label>执行人</label>
        </div>
        <button id="apply" type="button" class="btn btn-default pull-right">Submit</button>
        <button type="submit" class="btn btn-default pull-right">Cancel</button>
    </form>
</div>

<div id="div4" role="main" class="main container-fluid" style="z-index: 4999;display: none">
    <br>
    <form role="form">
        <div class="form-group">
            <label for="bt_save">标题</label>
            <input type="text" class="form-control" id="bt_save" placeholder="Enter email">
        </div>
        <div class="form-group">
            <label for="ms_save">描述</label>
            <textarea id="ms_save" class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="lb_save">类别</label>
            <select id="lb_save" class="form-control">
                <option>A</option>
                <option>B</option>
                <option>C</option>
            </select>
        </div>
        <div class="form-group">
            <label>执行人</label>
        </div>
        <div class="form-group">
            <label for="yj_save">处理意见</label>
            <textarea id="yj_save" class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="yj_save">标签</label>
            <span class="label label-default">默认标签</span>
            <span class="label label-primary">主要标签</span>
            <span class="label label-success">成功标签</span>
            <span class="label label-info">信息标签</span>
            <span class="label label-warning">警告标签</span>
            <span class="label label-danger">危险标签</span>
        </div>

        <button id="save" type="button" class="btn btn-default pull-right show-detal">Submit</button>
        <button type="submit" class="btn btn-default pull-right show-detal">Cancel</button>

        <br>
        <div class="form-group">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active" data-toggle="collapse"><a href="#ly" >留言</a></li>
                <li><a href="#jl">记录</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="ly">
                    <div class="row">
                        <ul>留言列表</ul>
                    </div>
                    <textarea id="ly_save" class="form-control" rows="3"></textarea>
                    <button id="ly_apply" type="button" class="btn btn-default pull-right show-detal">留言</button>
                </div>
                <div class="tab-pane" id="jl">
                    <p>这里是操作记录</p>
                    <p>这里是操作记录</p>
                    <p>这里是操作记录</p>
                    <p>这里是操作记录</p>
                    <p>这里是操作记录</p>
                    <p>这里是操作记录</p>
                    <p>这里是操作记录</p>
                </div>
            </div>
        </div>
    </form>
</div>

<div id="dialogs">
    <!--BEGIN dialog2-->
    <div class="js_dialog" id="iosDialog" style="opacity: 1; display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd"></div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">了解</a>
            </div>
        </div>
    </div>
    <!--END dialog2-->
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/static/bootstrap3/js/jquery-1.11.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/static/bootstrap3/js/bootstrap.js"></script>
<%-- 图片数据工具 --%>
<script src="/static/weui/exif.js"></script>
</body>
<script type="text/javascript">
    //获取浏览器高度和宽度，用于适应浏览器显示teble的大小
    var winWidth = 0;//浏览器窗体内部宽度初始化
    var winHeight = 0;//浏览器窗体内部高度初始化
    var photoNum = 0;//当前照片上传个数
    function findDimensions() //函数：获取尺寸
    {
        //获取窗口宽度
        if (window.innerWidth)
            winWidth = window.innerWidth;
        else if ((document.body) && (document.body.clientWidth))
            winWidth = document.body.clientWidth;

        //获取窗口高度
        if (window.innerHeight)
            winHeight = window.innerHeight;
        else if ((document.body) && (document.body.clientHeight))
            winHeight = document.body.clientHeight;

        //通过深入Document内部对body进行检测，获取窗口大小
        if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth)
        {
            winHeight = document.documentElement.clientHeight;
            winWidth = document.documentElement.clientWidth;
        }

        if(winWidth<768 && winHeight>=375){
            $("#nav1").removeClass("navbar-fixed-top");
            $("#nav1").addClass("navbar-fixed-bottom");

            $("#div2").css({"margin-top": "0px","margin-bottom": $("#nav1").height()});
            $("#div3").css({"margin-top": "0px","margin-bottom": $("#nav1").height()});
            $("#div4").css({"margin-top": "0px","margin-bottom": $("#nav1").height()});

        }else{
            $("#nav1").removeClass("navbar-fixed-bottom");
            $("#nav1").addClass("navbar-fixed-top");

            $("#div2").css({"margin-top": $("#nav1").height(),"margin-button": "0px"});
            $("#div3").css({"margin-top": $("#nav1").height(),"margin-bottom": "0px"});
            $("#div4").css({"margin-top": $("#nav1").height(),"margin-bottom": "0px"});
        }
    }

    jQuery(document).ready(function($) {
        findDimensions();

        $(window).resize(function(){
//            $("#nav1").toggleClass("navbar-static-top", "navbar-fixed-bottom");
            findDimensions();
        });

//        $('.collapse').on('show.bs.collapse', function () {
//            $(".collapse").removeClass("in");
//        });

        $('#bs-example-navbar-collapse-2').on('show.bs.collapse', function () {
            if($("#bs-example-navbar-collapse-1").attr("aria-expanded") == 'true') {
                $('#bs-example-navbar-collapse-1').collapse('hide');
            }
        });

        $('#bs-example-navbar-collapse-1').on('show.bs.collapse', function () {
            if($("#bs-example-navbar-collapse-2").attr("aria-expanded") == 'true') {
                $('#bs-example-navbar-collapse-2').collapse('hide');
            }
        });

        $('#pencil').click(function(){
            $("#div2").toggle("normal");
            $("#div3").toggle("fast");
        });

        $("#apply").click(function(){
            var bt =$("#bt").val();
            var ms =$("#ms").val();
            var lb =$("#lb").val();
            $("#div2").append(
                    '<div class="row" style="padding: 0px;background-color: #DDDDDD;margin:1px">'+
                    '<div class="col-xs-10"><h4>标题:'+bt+'</h4></div>'+
                    '<div class="col-xs-2" style="background-color: #996666">'+lb+'</div>'+
                    '<div class="col-xs-12">描述信息:'+ms+'</div>'+
                    '<div class="col-xs-6">发起日期</div>'+
                    '<div class="col-xs-6">组</div>'+
                    '<div class="col-xs-12">执行人清单</div>'+
                    '<div class="col-xs-12">标签</div>'+
                    '</div>'
            );
            $("#div2").toggle("normal");
            $("#div3").toggle("fast");
        });

        $('.show-detal').click(function(){
            $("#div2").toggle("normal");
            $("#div4").toggle("fast");
        });

        $('#myTab a').click(function (e) {
            e.preventDefault();//阻止a链接的跳转行为
            $(this).tab('show');//显示当前选中的链接及关联的content
        });

        //微信图片上传插件
            var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#);transform:rotate(#num#)"></li>',
                    $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                    $uploaderInput = $("#uploaderInput"),
                    $uploaderFiles = $("#uploaderFiles")
                    ;

            $uploaderInput.on("click", function(){
                photoNum =  parseInt($("div.weui-uploader__info").html().replace("/9",""));
                if(photoNum >= 9) {
                    alertDialog("只能上传9长照片...");
                    return false;
                }
            });

            $uploaderInput.on("change", function(e){
                var src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
                for (var i = 0, len = files.length; i < len; ++i) {
                    if(i >= 9-photoNum){
                        alertDialog("只能上传9长照片...");
                        break;
                    }
                    var file = files[i];
                    var _rotate = 0;

                    if (url) {
                        src = url.createObjectURL(file);
                    } else {
                        src = e.target.result;
                    }

                    EXIF.getData(file, function() {
                        var _orientation = EXIF.getTag(this, 'Orientation');

                        if (_orientation != "" && _orientation != 1) {
                            if (_orientation == 3) {
                                _rotate = 180;
                            } else if (_orientation == 6) {
                                _rotate = 90;
                            } else if (_orientation == 8) {
                                _rotate = 270;
                            }
                        }
                    });

                    $uploaderFiles.append($(tmpl.replace('#num#', _rotate + "deg").replace('#url#', src)));
                    $("div.weui-uploader__info").html((photoNum+i+1)+"/9");
                }
            });
            $uploaderFiles.on("click", "li", function(){
                $galleryImg.attr("style", this.getAttribute("style"));
                $gallery.fadeIn(100);
            });
            $gallery.on("click", function(){
                $gallery.fadeOut(100);
            });

        $('#dialogs').on('click', '.weui-dialog__btn', function(){
            $(this).parents('.js_dialog').fadeOut(100);
        });
    });

    //照片上传提示
    function alertDialog(msg){
            $('div.weui-dialog__bd').html(msg);
            $('#iosDialog').fadeIn(100);
    }
</script>
</html>
