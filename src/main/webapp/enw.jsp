<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/23
  Time: 下午3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container" id="container"><div class="page actionsheet js_show">
    <div class="page__hd">
        <h1 class="page__title">ActionSheet</h1>
        <p class="page__desc">弹出式菜单</p>
    </div>
    <div class="page__bd page__bd_spacing">
        <a href="javascript:;" class="weui-btn weui-btn_default" id="showIOSActionSheet">iOS ActionSheet</a>
        <a href="javascript:;" class="weui-btn weui-btn_default" id="showAndroidActionSheet">Android ActionSheet</a>
    </div>
    <!--BEGIN actionSheet-->
    <div>
        <div class="weui-mask" id="iosMask" style="opacity: 0; display: none;"></div>
        <div class="weui-actionsheet" id="iosActionsheet">
            <div class="weui-actionsheet__menu" style="overflow-y: scroll;height:300px;">
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
            </div>
            <div class="weui-actionsheet__action">
                <div class="weui-actionsheet__cell" id="iosActionsheetCancel">取消</div>
            </div>
        </div>
    </div>

    <div class="weui-skin_android" id="androidActionsheet" style="display: none">
        <div class="weui-mask"></div>
        <div class="weui-actionsheet">
            <div class="weui-actionsheet__menu" style="overflow-y: scroll;height:300px;">
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
                <div class="weui-actionsheet__cell">示例菜单</div>
            </div>
        </div>
    </div>
    <!--END actionSheet-->
    <div class="page__ft j_bottom">
        <a href="javascript:home()"><img src="./images/icon_footer_link.png"></a>
    </div>
</div>
    <script type="text/javascript" class="actionsheet js_show">
        // ios
        $(function(){
            var $iosActionsheet = $('#iosActionsheet');
            var $iosMask = $('#iosMask');

            function hideActionSheet() {
                $iosActionsheet.removeClass('weui-actionsheet_toggle');
                $iosMask.fadeOut(200);
            }

            $iosMask.on('click', hideActionSheet);
            $('#iosActionsheetCancel').on('click', hideActionSheet);
            $("#showIOSActionSheet").on("click", function(){
                $iosActionsheet.addClass('weui-actionsheet_toggle');
                $iosMask.fadeIn(200);
            });
        });

        // android
        $(function(){
            var $androidActionSheet = $('#androidActionsheet');
            var $androidMask = $androidActionSheet.find('.weui-mask');

            $("#showAndroidActionSheet").on('click', function(){
                $androidActionSheet.fadeIn(200);
                $androidMask.on('click',function () {
                    $androidActionSheet.fadeOut(200);
                });
            });
        });</script></div>
</body>
</html>
