<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/4
  Time: 上午11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<link rel="stylesheet" href="/static/weui/example.css"/>--%>
<%-- 图片数据工具 --%>
<%--<script src="/static/weui/exif.js"></script>--%>
<meta name="viewport" content="width=device-width">
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
    .user-group{
        color: #007dbc;
    }
</style>
<div id="pencil-showpage">
    <div class="pencil"><!-- 菜单主显示页面 class必须与页面id一致-->
        <form id="pencil-form" role="form">
            <input type="hidden" name="id" value="${pencilPage.id}"/>

            <div class="weui-cells__title">标题</div>
            <div class="weui-cells">
                <div class="weui-cell weui-cell_select weui-cell_select-before">
                    <div class="weui-cell__hd <c:choose><c:when  test="${pencilPage != null}">color-0${pencilPage.jjcd}</c:when><c:otherwise>color-03</c:otherwise></c:choose>">
                        <select class="weui-select" id="jjcd" name="jjcd">
                            <option value="3" <c:if test='${pencilPage.jjcd == 3}'>selected</c:if> >一般</option>
                            <option value="2" <c:if test='${pencilPage.jjcd == 2}'>selected</c:if> >优先</option>
                            <option value="1" <c:if test='${pencilPage.jjcd == 1}'>selected</c:if> >紧急</option>
                        </select>
                    </div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" id="bt" name="bt" type="text" placeholder="请输标题" value="${pencilPage.bt}">
                    </div>
                </div>
                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label for="wtlb" class="weui-label" for="wtlb">问题类别:</label>
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
                        <textarea class="weui-textarea" id="wtms" name="wtms" placeholder="请输入问题描述" rows="3">${pencilPage.wtms}</textarea>
                        <div class="weui-textarea-counter"><span>
                            <c:choose><c:when  test="${pencilPage != null}">${pencilPage.wtms.length()}</c:when><c:otherwise>0</c:otherwise></c:choose>
                        </span>/200</div>
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <label for="touser" class="weui-label">通知人员:</label>
                        <div id="showUser">
                            <c:forEach items="${pencilTousers}" var="pencilTouser">
                                <i class='user-group' data-id='${pencilTouser.touser}' >${pencilTouser.lastname}</i>&nbsp;
                            </c:forEach>
                        </div>
                        <div class="weui-textarea-counter"><a class="icon-group" href="javascript:test_loadPageTemp('/hrmr.jsp');" style="color: #007dbc"></a></div>
                        <input type="hidden" id="touser" name="touser" value="${pencilPage.touser}"/>
                    </div>
                </div>
            </div>

            <c:if test="${pencilImgs == null || pencilImgs.size() > 0}">
                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title">
                                        <c:choose><c:when  test="${pencilPage != null}">图片</c:when><c:otherwise>图片上传</c:otherwise></c:choose>
                                    </p>
                                    <div class="weui-uploader__info"></div>
                                </div>
                                <div class="weui-uploader__bd">
                                    <ul class="weui-uploader__files" id="uploaderFiles" name="uploaderInputs" style="margin-bottom: 0px;">
                                        <c:forEach items="${pencilImgs}" var="pencilImg">
                                            <%--<li class="weui-uploader__file" style="background-image:url('/pencilimg/getImg?id=${pencilImg.id}');transform:rotate(${pencilImg.rotate}deg)"></li>--%>
                                            <li class="weui-uploader__file" style="background-image:url('${pencilImg.getStrImgdata()}');transform:rotate(${pencilImg.rotate}deg)"
                                                data-url="${pencilImg.getStrImgdata()}" data-rotate="${pencilImg.rotate}"
                                            ></li>
                                        </c:forEach>
                                    </ul>
                                    <c:if test='${pencilPage == null}'>
                                        <div class="weui-uploader__input-box">
                                            <input id="uploaderInput" name="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="weui-btn-area">
                <a class="weui-btn weui-btn_primary" href="javascript:" id="apply">确定</a>
            </div>
            <div id="imgfileid" style="display: none;">

            </div>
        </form>
    </div>
    <div class="page weui-tab__panel js_show" id="pencil-temp_pg" data-src="" style="display: none;">

    </div>
</div>
<%--<div id="pencil-TempPage" style="display: none;height: inherit">--%>
<%--</div>--%>
<script type="text/javascript" class="input js_show">
    var photoNum = <c:choose><c:when  test="${pencilPage != null}">${pencilImgs.size()}</c:when><c:otherwise>0</c:otherwise></c:choose>;//当前照片上传个数
    var totalPhotoNum = 2;
    var isOne = true;

    //        $(function(){
    $(function() {
        $("div.weui-uploader__info").html((photoNum)+"/"+totalPhotoNum);

//        targetShow("#pencil-showpage","div.pencil");//主菜单面切换后默认到菜单主页面

        alert(1122);
        $(window).on('hashchange', function () {
            var state = history.state || {};
            var name = location.hash.indexOf('#') === 0 ? location.hash : '#';
            alert(name);
            if(name == '#hrm'){
                alert(1);
                test_loadPageTemp('/hrmr.jsp');
            }else{

            }
        });

        //微信图片上传插件
        var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#);transform:rotate(#num#)" id="temp"></li>',
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
//                        src = url.createObjectURL(this);
                        var reader = new FileReader();
                        reader.readAsDataURL(this);
                        reader.onload = function() {
                            fnCompressImg(this.result, 800, 800, function (data) {
                                $uploaderFiles.append($(tmpl.replace('#num#', _rotate + "deg").replace('#url#', data)));

//                                var imagedata = encodeURIComponent(data);
                                var dataId;
                                $.post("/pencilimg/uploadImgDate",
                                        {
                                            imgdata:data,
                                            rotate:_rotate
                                        },
                                        function(data,status){
//                                            alert("Data: " + data.ImageId + "\nStatus: " + status);
                                            $("#imgfileid").append('<input id="'+data.ImageId+'" type="checkbox" name="ImageDataId" checked value="'+data.ImageId+'">');
                                            $("#temp").attr("id", data.ImageId);
                                        });
                            });
                        }
                    } else {
                        src = e.target.result;
                        $uploaderFiles.append($(tmpl.replace('#num#', _rotate + "deg").replace('#url#', src)));
                    }

//                    $uploaderFiles.append($(tmpl.replace('#num#', _rotate + "deg").replace('#url#', src)));
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
//            alert($("#gallery").find("a.weui-gallery__del").html());
            $("#gallery").find("a.weui-gallery__del").html(
                    <c:choose><c:when  test="${pencilPage == null}">
                        "<i class=\"weui-icon-delete weui-icon_gallery-delete\"></i>"
                    </c:when><c:otherwise>
                        "<i class=\"icon-reply icon-2x\" style=\"color: white\"></i>"
                    </c:otherwise></c:choose>
            );
            $gallery.fadeIn(200);
        });

        $gallery.on("click", function(){
            $gallery.fadeOut(200);
        });

        $gallery.on("click","a.weui-gallery__del", function(){
            var showImg = $("#galleryImg").css("background-image");
            $("li.weui-uploader__file").each(function(){
                if($(this).css("background-image") == showImg){
                    $(this).remove();
                    $("#"+$(this).attr("id")).remove();
                }
            });
            $gallery.fadeOut(200);
        });

        $("#apply").on('click',function(){
            applyAjax();
        });

    });

    function pencil_addToUser(inval){
        if(inval.length >0) {
            var tousers = "";
            $("#showUser").empty();
            for (var i = 0; i < inval.length; i++) {
                $("#showUser").append("<i class='user-group' data-id='" + inval[i].id + "' >" + inval[i].lastname + "</i>&nbsp;");
                tousers += inval[i].id + ",";
            }
            $("#touser").val(tousers.substring(0, tousers.length - 1));
        }
    }

    function loadHrm(){
//        window.location.href = window.location.href.split("#")[0]+"#hrm";
//        test_loadPageTemp('/hrmr.jsp');
    }

    //加载tempPage1页面
    function test_loadPageTemp(url){
        if($("#pencil-temp_pg").data("src") != url) {//后续 需更新,问题, 主页面切换后,勾选项失效
            $("#pencil-temp_pg").empty();
            getPage(url, "#pencil-temp_pg");
            $("#pencil-temp_pg").data("src", url);
            $("#pencil-temp_pg").attr("data-src", url);

            //引入后替换显示
            var $changePage = $("#tempPage").children("div").addClass('slideIn').hide();
            $("div.tabpage").append($changePage);
        }
        test_checkTempPage("#pencil-showpage");
//        window.location.href = window.location.href.split("#")[0]+"#hrm";
    }

    //切换tempPage1页面
    function test_checkTempPage(){
        main_checkTempPage("#pencil-showpage");
    }

    function applyAjax(){
        //异步提交表单
//                console.log($(this));
        loadingToast();//loading...

        var submitURL = "/pencil/save";
//            if($("ul.weui-uploader__files").children().length > 0){
//                submitURL = "/pencil/saveandfile";
//            }

        $("#pencil-form").ajaxSubmit({
            type:'post',
            url:submitURL,
            success:function(data){
//                    alertDialog("Connection success");
                loadingToast_close();
                toast();
            },
            error:function(XmlHttpRequest,textStatus,errorThrown){
                loadingToast_close();
                alertDialog("Connection error");
            }
        });

//            $.ajax({
//                type: "POST",
//                url: "/pencil/save",
//                data: $("#pencil-form").serialize(),
//                beforeSend: function(){
//                    loadingToast();
//                },
//                success: function(msg){
////                    if(msg=="success"){
//                        loadingToast_close();
//                        toast();
////                    }
////                    else {
////                        loadingToast_close();
////                        alertDialog("Connection error");
////                    }
//                },
//                error:function(XmlHttpRequest,textStatus,errorThrown){
//                    loadingToast_close();
//                    alertDialog("Connection error");
//                }
//            });
    }
</script>
<script>
    /**
     * 图片压缩
     * @param imgData base64格式
     * @param maxWidth
     * @param maxHeight
     * @param onCompress 回调
     */
    function fnCompressImg(imgData , maxWidth , maxHeight, callback) {

        if (!imgData) return;

        callback = callback || function() {};

        maxHeight = maxHeight || 200; //默认最大高度200px

        maxWidth = maxWidth || 266; //默认最大宽度266px

        var canvas = document.createElement('canvas');

        var img = new Image();

        img.onload = function() {

            if (img.height > maxHeight) { //按最大高度等比缩放
                img.width *= maxHeight / img.height;
                img.height = maxHeight;
            }
            if (img.width > maxWidth) { //按最大宽度等比缩放
                img.height *= maxWidth / img.width;
                img.width = maxWidth;
            }
            var ctx = canvas.getContext("2d");
            canvas.width = img.width ;
            canvas.height = img.height;
            ctx.clearRect(0, 0, canvas.width, canvas.height); // canvas清屏
            //重置canvans宽高 canvas.width = img.width; canvas.height = img.height;
            ctx.drawImage(img, 0, 0, img.width, img.height); // 将图像绘制到canvas上

            callback(canvas.toDataURL("image/jpeg")); //必须等压缩完才读取canvas值，否则canvas内容是黑帆布
        };

        // 记住必须先绑定事件，才能设置src属性，否则img没内容可以画到canvas
        img.src = imgData;

    }
</script>