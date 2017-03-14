<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/23
  Time: 下午4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Asia@Group - © XmasPiano</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="static/bootstrap3/fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="/static/js/jquery.form-3.51.0.js"></script>
<%--<script src="/static/bootstrap3/jquery.infinitescroll.dev.js"></script>--%>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<%--<script src="js/bootstrap.min.js"></script>--%>

<!-- the main fileinput plugin file -->
<script src="static/bootstrap3/fileinput/js/fileinput.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="static/bootstrap3/fileinput/js/locales/zh.js"></script>

<style>
    body { padding-top: 70px; }

    /*去除选择框的outline*/
    .bootstrap-select, .dropdown-toggle:focus{outline:none !important;}
    /*去除选项的outline*/
    a:focus {outline:none !important;}

    .active {outline:none !important;}

    .btn-default.active, .btn-default:active {
        color: #fff !important;
        background-color: #337ab7 !important;
    }

    .btn-default.active.focus {
        color: #fff !important;
    }

    .bg-blockquote-info {
        padding: 20px;
        margin: 20px 0;
        border: 1px solid #eee;
        border-left-width: 5px;
        border-radius: 3px;
        border-left-color: #1b809e;
        border-right: 0px;
    }

    .user-item{
        color: #959595;
        font-size: smaller;
        margin-right: 5px;
    }
</style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#" data-toggle="tab" data-target="#home">Home <span class="sr-only">(current)</span></a></li>
                <li><a href="#" data-toggle="modal" data-target="#myModal">Pencil</a></li>
                <li><a href="#" data-toggle="tab" data-target="#bell">Bell</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div id="homeTabContent" class="container-fluid tab-content">
    <div class="tab-pane fade in active" id="home">
        <div class="list-group">
            <%-- 全部数据 --%>
        </div>
        <ul class="pagination">
            <li><a href="#">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>
    <div class="tab-pane fade" id="bell">
        <div class="list-group">
            <%-- 我的全部数据 --%>
        </div>
        <ul class="pagination">
            <li><a href="#">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <form id="btpencil_form1" >
                    <input type="hidden" name="touser" value="">
                    <div class="form-group">
                        <label>标题</label>
                        <input type="text" class="form-control" name="bt" placeholder="text">
                    </div>
                    <div class="form-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn btn-default active">
                                <input type="radio" name="jjcd" value="3" checked>一般
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="jjcd" value="2">优先
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="jjcd" value="1">优先
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>问题描述</label>
                        <textarea class="form-control" name="wtms" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn btn-default active">
                                <input type="radio" name="wtlb" value="1" checked>SAP应用故障
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="wtlb" value="2">OA应用故障
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="wtlb" value="3">硬件网络故障
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="wtlb" value="4">SAP业务咨询
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="wtlb" value="5">OA业务咨询
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>通知人员</label>
                        <div id="touserItmes">
                            &nbsp;
                        </div>
                        <%-- 备选人员 --%>
                        <jsp:include page="/btuser.jsp" >
                            <jsp:param name="callPage" value="btpencil"/>
                        </jsp:include>
                    </div>
                    <div class="form-group">
                        <label >图片预览</label>
                        <input id="file-1" name="uploaderInput" class="file" type="file" multiple="" data-upload-url="/pencilimg/uploadImgDateWeb" data-preview-file-type="text">
                        <%--</div>--%>
                    </div>
                    <div id="imgfileid" style="display: none"></div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="SaveChangePencil">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="pencilInfo" tabindex="-2" role="dialog"
     aria-labelledby="pencil" aria-hidden="true">

</div>
<div style="display:none">
    <div id="allDetail_temp">
        <a href="#" class="list-group-item " data-toggle="modal" data-target="#pencilInfo" data-pencilid="">
            <h4 class="list-group-item-heading"></h4>
            <p class="list-group-item-text"></p>
        </a>
    </div>
</div>
<script>
    var page_home = 0;
    var totalPage_home = 0;
    var clock_home = true;

    var page_bell = 0;
    var totalPage_bell = 0;
    var clock_bell = true;

    $(function(){
        $.getJSON("/bell/queryall",function(result){
            addrows(result,"#bell");
        });

        $.getJSON("/home/queryall",function(result){
            addrows(result,"#home");
        });

        $("#home").children("ul.pagination").on("click", "a", function(){
            $("#home").find("li.active").removeClass("active");
            $(this).parent("li").addClass("active");
            var pageNo = $(this).html();
            if(pageNo == "«"){
                pageNo = 1;
            }else if(pageNo =="»"){
                pageNo = totalPage_home;
            }

            $.getJSON("/home/queryall?page="+(parseInt(pageNo)-1),function(result){
                $("#home").children("div.list-group").empty();
                addrows(result,"#home");
            });
            return false;
        });

        $("#bell").children("ul.pagination").on("click", "a", function(){
            $("#bell").find("li.active").removeClass("active");
            $(this).parent("li").addClass("active");
            var pageNo = $(this).html();
            if(pageNo == "«"){
                pageNo = 1;
            }else if(pageNo =="»"){
                pageNo = totalPage_bell;
            }

            $.getJSON("/bell/queryall?page="+(parseInt(pageNo)-1),function(result){
                $("#bell").children("div.list-group").empty();
                addrows(result,"#bell");
            });
            return false;
        });

        var $file_1 = $("#file-1").fileinput({
            language: 'zh',
            allowedFileExtensions : ['jpg', 'png','gif','jpeg'],
//            overwriteInitial: false,
            maxFileSize: 1000,
            maxFilesNum: 10,
            showUploadedThumbs: false,
//            initPreviewActions:true,
//            initialPreviewConfig: [{
//                caption: 'desert.jpg',// 展示的图片名称
//                width: '120px',// 图片高度
//                url: '/pencilimg/uploadImgDate',// 预展示图片的删除调取路径
//                key: 100,// 可修改 场景2中会用的
//                extra: {id: 100} //调用删除路径所传参数
//            }],
//            validateInitialCount:true,
            //allowedFileTypes: ['image', 'video', 'flash'],
            slugCallback: function(filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });

        $file_1.on("filebatchselected", function(event, files) {
//            选择文件
        });

        $file_1.on("filepreajax", function(){
//            alert(11);
        });

        $file_1.on("fileuploaded", function (event, data, previewId, index) {
            var obj = data.response;

            $("#imgfileid").append('<input id="'+obj.ImageId+'" type="checkbox" name="ImageDataId" checked value="'+obj.ImageId+'">');
//            alert(JSON.stringify(obj.ImageId));
//            alert(index);
            $("#"+previewId).attr("data-imageid",obj.ImageId);
            $("#"+previewId).attr("data-previewId",previewId);

//            alert($("button.kv-file-remove").attr("title"));
        });

        $file_1.on('filepreremove', function(event, previewId, id) {
            var imgId = $("div.file-preview-thumbnails").children("div.file-preview-frame[data-previewId='"+previewId+"']").data("imageid");
            $("#imgfileid").find("#"+imgId).remove();
        });

        $file_1.on('fileclear', function(event, data, previewId, index) {
            $("#imgfileid").empty();
        });

        $("#SaveChangePencil").on('click',function(){
            applyAjax();
        });

        $("#pencilInfo").on("hidden.bs.modal", function() {
//            $(this).find("div.modal-content").html("")\\;
            $(this).removeData("bs.modal");
        });

        $('#pencilInfo').on('show.bs.modal', function (event) {
            var $button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = $button.data('pencilid') // Extract info from data-* attributes

            var title = $button.find("h4.list-group-item-heading").html();
            var $modal = $(this);

            $modal.empty();
            $modal.load("/pencil/web/up?id="+recipient,function(){
                $modal.find('.modal-title').text(title);
                $modal.find('.modal-body input[name="pencilId"]').val(recipient);
            });
        });

        function addrows(result, selector, caseStr){
            var $allDetail_temp = $("#allDetail_temp");
            var $allDetail = $(selector).children("div.list-group");

            switch (selector){
                case "#home":
                    page_home = result.number;
                    totalPage_home = result.totalPages;
                    var data = result.content;

                    if(clock_home) {
                        clock_home = false;////初始化执行
                        var $pageindex = $("#home").children("ul.pagination").children("li.active");
                        for (var i = totalPage_home; i > 1; i--) {
                            $pageindex.after("<li><a href=\"#\">" + i + "</a></li>");
                        }
                    }

                    break;
                case "#bell":
                    page_bell = result.detail.number;
                    totalPage_bell = result.detail.totalPages;
                    var data = result.detail.content;

                    if(clock_bell) {
                        clock_bell = false;//初始化执行
                        var $pageindex = $("#bell").children("ul.pagination").children("li.active");
                        for (var i = totalPage_bell; i > 1; i--) {
                            $pageindex.after("<li><a href=\"#\">" + i + "</a></li>");
                        }
                    }

                    break;
            }
            $.each(data, function (i, obj) {
                $allDetail_temp.find("a.list-group-item").attr("data-pencilid",obj.id);
                $allDetail_temp.find("h4.list-group-item-heading").html(obj.bt);
                $allDetail_temp.find("p.list-group-item-text").html(obj.wtms);
                switch(caseStr){
                    case "call":
                        $allDetail.children(":first").before($allDetail_temp.html());
                        break;
                    default:
                        $allDetail.append($allDetail_temp.html());
                }
            });
//            $allDetail_temp.empty();
//            $homeDetail.find("div.weui-loadmore").children("i.weui-loading").remove();
//            $homeDetail.find("div.weui-loadmore").children("span.weui-loadmore__tips").html("");
        }

        function applyAjax(){
            var $btpencil_form1 = $("#btpencil_form1");
            var $bt = $btpencil_form1.find("input[name='bt']");
            var $wtms = $btpencil_form1.find("textarea[name='wtms']");

            if($bt.val() == ""){
                $bt.parent("div.form-group").addClass("has-error");
                $bt.focus();
                return false;
            }else{
                $bt.parent("div.form-group").removeClass("has-error");
            }

            if($wtms.val() == ""){
                $wtms.parent("div.form-group").addClass("has-error");
                $wtms.focus();
                return false;
            }else{
                $wtms.parent("div.form-group").removeClass("has-error");
            }

            if($btpencil_form1.find("input[name='touser']").val() == ""){
                alert("请选择通知人后提交...");
                return false;
            }

            //异步提交表单

            var submitURL = "/pencil/save";

            $btpencil_form1.ajaxSubmit({
                type:'post',
                url:submitURL,
                success:function(data){
                    $('#myModal').modal('hide');
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
                    alert("Connection error");
                }
            });
        }
    });

    //btuser.jsp 回调函数,回写勾选用户的信息
    function btpencil_callUpdateTouser(id, name, flag){
        var $touserInput = $("#btpencil_form1").find("input[name='touser']");
        var mainString = $touserInput.val();
        var $touserItmes = $("#btpencil_form1").find("#touserItmes");
        if(flag){
            $touserInput.val(removeStringItems(mainString, id));
            $touserItmes.find("i.user-item[data-id='"+id+"']").remove();
        }else{
            $touserInput.val(addStringItems(mainString, id));
            $touserItmes.append("<i class='user-item' data-id='"+id+"' >"+name+"</i>");
        }
    }

    function removeStringItems(main, items){
        if(main.indexOf(items) == 0){
            return main.replace(items+",","");
        }else if(main.indexOf(items) > 0){
            return main.replace(","+items,"");
        }
    }

    function addStringItems(main, items){
        if(main.indexOf(items) < 0 && main.length == 0){
            return main += items;
        }else if(main.indexOf(items) < 0 && main.length > 0){
            return main += ","+items;
        }
    }

    $.fn.scrollUnique = function() {
        return $(this).each(function() {
            var eventType = 'mousewheel';
            // 火狐是DOMMouseScroll事件
            if (document.mozHidden !== undefined) {
                eventType = 'DOMMouseScroll';
            }
            $(this).on(eventType, function(event) {
                // 一些数据
                var scrollTop = this.scrollTop,
                        scrollHeight = this.scrollHeight,
                        height = this.clientHeight;

                var delta = (event.originalEvent.wheelDelta) ? event.originalEvent.wheelDelta : -(event.originalEvent.detail || 0);

                if ((delta > 0 && scrollTop <= delta) || (delta < 0 && scrollHeight - height - scrollTop <= -1 * delta)) {
                    // IE浏览器下滚动会跨越边界直接影响父级滚动，因此，临界时候手动边界滚动定位
                    this.scrollTop = delta > 0? 0: scrollHeight;
                    // 向上滚 || 向下滚
                    event.preventDefault();
                }
            });
        });
    };
</script>
</body></html>
