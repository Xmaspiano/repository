<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/4
  Time: 上午11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">--%>
<link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">
<link rel="stylesheet" href="/static/weui/weui.min.css"/>
<link rel="stylesheet" href="/static/weui/example.css"/>

<script src="/static/bootstrap3/js/jquery-1.11.1.min.js"></script>
<script src="/static/bootstrap3/js/jquery.form-3.51.0.js"></script>
<%-- 图片数据工具 --%>
<script src="/static/weui/exif.js"></script>
<style>
    /* 表单行颜色 */
    .color-01{
        background-color: #ffcacf;
    }
    .color-02{
        background-color: #ffe399;
    }
    .color-03{
        background-color: #caedc5;
    }
</style>
</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on">
            故障描述
        </div>
        <div class="weui-navbar__item">
            故障处理
        </div>
        <div class="weui-navbar__item">
            留言板
        </div>
        <div class="weui-navbar__item">
            操作记录
        </div>
        <div class="weui-navbar__item">
            返回
        </div>
    </div>
    <div class="weui-tab__panel">
        <%--<div class="page panel js_show">--%>
            <form id="form1" role="form">
                <input type="hidden" name="id" value="${pencilPage.id}"/>
                <div class="weui-cells__title">标题</div>
                <div class="weui-cells">
                    <div class="weui-cell weui-cell_select weui-cell_select-before">
                        <div class="weui-cell__hd color-0${pencilPage.jjcd}">
                            <select class="weui-select" id="jjcd" name="jjcd">
                                <option value="1" <c:if test='${pencilPage.jjcd == 1}'>selected</c:if> >紧急</option>
                                <option value="2" <c:if test='${pencilPage.jjcd == 2}'>selected</c:if> >优先</option>
                                <option value="3" <c:if test='${pencilPage.jjcd == 3}'>selected</c:if> >一般</option>
                            </select>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" id="bt" name="bt" type="text" placeholder="请输标题" value="${pencilPage.bt}">
                        </div>
                    </div>
                    <div class="weui-cell weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd">
                            <label for="wtlb" class="weui-label">问题类别:</label>
                        </div>
                        <div class="weui-cell__bd">
                            <select class="weui-select" id="wtlb" name="wtlb">
                                <option value="1" <c:if test='${pencilPage.wtlb == 1}'>selected</c:if> >类别1</option>
                                <option value="2" <c:if test='${pencilPage.wtlb == 2}'>selected</c:if> >类别2</option>
                                <option value="3" <c:if test='${pencilPage.wtlb == 3}'>selected</c:if> >类别3</option>
                            </select>
                        </div>
                    </div>
                </div>

                <%--<div class="weui-cells__title">问题描述</div>--%>
                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" id="wtms" name="wtms" placeholder="请输入问题描述" rows="3" >${pencilPage.wtms}</textarea>
                            <div class="weui-textarea-counter"><span>${pencilPage.wtms.length()}</span>/200</div>
                        </div>
                    </div>

                    <div class="weui-cell">
                        <%--<div class="weui-cell__bd">--%>
                            <%--<label for="wtlb" class="weui-label">通知人员:</label>--%>
                            <%--<div class="weui-textarea-counter"><i class="icon-group" style="color: #007dbc"></i></div>--%>
                        <%--</div>--%>
                            <div class="weui-cell__bd">
                                <label for="wtlb" class="weui-label">通知人员:</label>
                                <div id="showUser">
                                </div>
                                <div class="weui-textarea-counter"><a class="icon-group" href="javascript:test_loadPageTemp('/hrmr.jsp')" style="color: #007dbc"></a></div>
                                <input type="hidden" id="touser" name="touser" value=""/>
                            </div>
                    </div>
                </div>

                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title">图片上传</p>
                                    <div class="weui-uploader__info"></div>
                                </div>
                                <div class="weui-uploader__bd">
                                    <ul class="weui-uploader__files" id="uploaderFiles" style="margin-bottom: 0px;">
                                        <c:forEach items="${pencilImgs}" var="pencilImg">
                                            <%--<li class="weui-uploader__file" style="background-image:url('/pencilimg/getImg?id=${pencilImg.id}');transform:rotate(${pencilImg.rotate}deg)"></li>--%>
                                            <li class="weui-uploader__file" style="background-image:url('${pencilImg.getStrImgdata()}');transform:rotate(${pencilImg.rotate}deg)"
                                                data-url="${pencilImg.getStrImgdata()}" data-rotate="${pencilImg.rotate}"
                                            ></li>
                                        </c:forEach>
                                    </ul>
                                    <%--<div class="weui-uploader__input-box">--%>
                                        <%--<input id="uploaderInput" name="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">--%>
                                    <%--</div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="weui-btn-area">
                <a class="weui-btn weui-btn_primary" href="javascript:" id="apply">确定</a>
            </div>
        </div>
    <%--</div>--%>

</div>
<div class="weui-gallery" id="gallery">
    <span class="weui-gallery__img" id="galleryImg"></span>
    <div class="weui-gallery__opr">
        <a href="javascript:" class="weui-gallery__del">
            <i class="icon-reply icon-large" style="color: white"></i>
        </a>
    </div>
</div>
</body>
<script type="text/javascript" class="input js_show">
    var photoNum = ${pencilImgs.size()};//当前照片上传个数
    var totalPhotoNum = 2;

    $(function(){
        $("div.weui-uploader__info").html((photoNum)+"/"+totalPhotoNum);
        var $tooltips = $('.js_tooltips');

        $('#showTooltips').on('click', function(){
            if ($tooltips.css('display') != 'none') return;

            // toptips的fixed, 如果有`animation`, `position: fixed`不生效
            $('.page.cell').removeClass('slideIn');

            $tooltips.css('display', 'block');
            setTimeout(function () {
                $tooltips.css('display', 'none');
            }, 2000);
        });

        //微信图片上传插件
        var tmpl = '&lt;li class="weui-uploader__file" style="background-image:url(#url#);transform:rotate(#num#)">&lt;/li>',
                $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                $uploaderInput = $("#uploaderInput"),
                $uploaderFiles = $("#uploaderFiles")
                ;

        $uploaderInput.on("click", function(){
            photoNum =  parseInt($("div.weui-uploader__info").html().replace("/"+totalPhotoNum,""));
            if(photoNum >= totalPhotoNum) {
                alertDialog("只能上传"+totalPhotoNum+"长照片...");
                return false;
            }
        });

        $uploaderInput.on("change", function(e){
            var src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
            for (var i = 0, len = files.length; i < len; ++i) {
                if(i >= totalPhotoNum-photoNum){
                    alertDialog("只能上传"+totalPhotoNum+"长照片...");
                    break;
                }
                var file = files[i];

                var _rotate = 0;
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

                    if (url) {
                        src = url.createObjectURL(this);
                    } else {
                        src = e.target.result;
                    }

                    $uploaderFiles.append($(tmpl.replace('#num#', _rotate + "deg").replace('#url#', src)));
                    $("div.weui-uploader__info").html((++photoNum) + "/"+totalPhotoNum);
                });
            }
        });

        $("#jjcd").on("change",function(){
            var clsColor = function () {
                switch ($("#jjcd").val()) {
                    case "1":
                        return "color-01";
                    case "2":
                        return "color-02";
                    case "3":
                        return "color-03";
                    default:
                        return "color-03";
                }
            }

            $("#jjcd").parent(".weui-cell__hd").removeClass("color-01");
            $("#jjcd").parent(".weui-cell__hd").removeClass("color-02");
            $("#jjcd").parent(".weui-cell__hd").removeClass("color-03");
            $("#jjcd").parent(".weui-cell__hd").addClass(clsColor);
        });

        $uploaderFiles.on("click", "li", function(){
            $galleryImg.attr("style", this.getAttribute("style"));
//            $("#galleryIfm").attr("style", $("#galleryIfm").attr("style")+this.getAttribute("style"));
//            $("#galleryIfm").append("&lt;img src='"+$(this).data("url")+"' />");
//            $("#galleryIfm").attr("src", $(this).data("url"));
            $gallery.fadeIn(200);
//            alert($(this).data("url"));
//            window.location.href = $(this).data("url");
//            window.open($(this).data("url"));
//            window.location.assign($(this).data("url"));
        });

        $gallery.on("click", function(){
            $gallery.fadeOut(200);
        });

        $('#dialogs').on('click', '.weui-dialog__btn', function(){
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $("#apply").on('click',function(){
            //异步提交表单
                console.log($(this));
                $("#form1").ajaxSubmit({
                    type:'post',
                    url:'/pencil/save',
                    success:function(data){
                        alertDialog("Connection success");
                    },
                    error:function(XmlHttpRequest,textStatus,errorThrown){
                        alertDialog("Connection error");
                    }
                });

        });

    });

    //照片上传提示
    function alertDialog(msg){
        $('div.weui-dialog__bd').html(msg);
        $('#iosDialog').fadeIn(200);
    }
</script>
</html>