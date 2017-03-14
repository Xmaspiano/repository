<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/3/3
  Time: 下午5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-dialog" role="document" style="float: right;">
    <div class="modal-content">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <form id="pencilMain_form1" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${pencilPage.id}"/>
                    <input type="hidden" name="pencilId" value="${pencilPage.id}">
                    <input type="hidden" name="touser" value="${pencilPage.touser}">
                    <div class="form-group">
                        <label >标题</label>
                        <input type="text" class="form-control double-click-open" name="bt"
                               placeholder="text" readonly="readonly" value="${pencilPage.bt}">
                    </div>
                    <div class="form-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn btn-default <c:if test='${pencilPage.jjcd == 3}'>active</c:if>" >
                                <input type="radio" name="jjcd" value="3">一般
                            </label>
                            <label class="btn btn-default <c:if test='${pencilPage.jjcd == 2}'>active</c:if>" >
                                <input type="radio" name="jjcd" value="2">优先
                            </label>
                            <label class="btn btn-default <c:if test='${pencilPage.jjcd == 1}'>active</c:if>" >
                                <input type="radio" name="jjcd" value="1">紧急
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >问题描述</label>
                        <textarea class="form-control double-click-open" name="wtms" rows="3" readonly="readonly">${pencilPage.wtms}</textarea>
                    </div>
                    <div class="form-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn btn-default <c:if test='${pencilPage.wtlb == 1}'>active</c:if> ">
                                <input type="radio" name="wtlb" value="1">SAP应用故障
                            </label>
                            <label class="btn btn-default <c:if test='${pencilPage.wtlb == 2}'>active</c:if> ">
                                <input type="radio" name="wtlb" value="2">OA应用故障
                            </label>
                            <label class="btn btn-default <c:if test='${pencilPage.wtlb == 3}'>active</c:if> ">
                                <input type="radio" name="wtlb" value="3">硬件网络故障
                            </label>
                            <label class="btn btn-default <c:if test='${pencilPage.wtlb == 4}'>active</c:if> ">
                                <input type="radio" name="wtlb" value="4">SAP业务咨询
                            </label>
                            <label class="btn btn-default <c:if test='${pencilPage.wtlb == 5}'>active</c:if> ">
                                <input type="radio" name="wtlb" value="5">OA业务咨询
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>通知人员</label>
                        <div id="touserItmes">
                            &nbsp;
                            <c:forEach items="${pencilTousers}" var="pencilTouser">
                                <i class='user-item' data-id='${pencilTouser.touser}' >${pencilTouser.lastname}</i>
                            </c:forEach>
                        </div>
                        <%-- 备选人员 --%>
                        <jsp:include page="/btuser.jsp">
                            <jsp:param name="touser" value="${pencilPage.touser}" />
                            <jsp:param name="callPage" value="pencilMain" />
                        </jsp:include>

                    </div>

                    <div class="form-group img-group">
                        <label >图片预览</label><br>
                            <c:forEach items="${pencilImgs}" var="pencilImg">
                                    <img src="${pencilImg.getStrImgdata()}" style="background-size: cover;width: 100% \9;margin-bottom: 10px"
                                         class="img-thumbnail img-responsive " data-url="${pencilImg.getStrImgdata()}" data-rotate="${pencilImg.rotate}">
                            </c:forEach>
                    </div>
                </form>
                <div class="form-group">
                    <%-- 页签 --%>
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#answerTab" data-toggle="tab">
                                处理
                            </a>
                        </li>
                        <li>
                            <a href="#messageTab" data-toggle="tab">
                                留言
                            </a>
                        </li>
                        <li>
                            <a href="#activelistTab" data-toggle="tab">
                                记录
                            </a>
                        </li>
                    </ul>
                </div>
                <div id="myTabContent" class="tab-content">
                    <div class="modal-body tab-pane fade in active" id="answerTab">
                        <jsp:include page="/answer/web?id=${pencilPage.id}"/>
                        <%--<iframe src="/answer/web?id=${pencilPage.id}" style="border: 0px;width: 100%;height: 100%;overflow: hidden"></iframe>--%>
                    </div>
                    <div class="modal-body tab-pane fade" id="messageTab">
                        <jsp:include page="/message/web?id=${pencilPage.id}"/>
                    </div>
                    <div class="modal-body tab-pane fade" id="activelistTab">
                        <p><i class="icon-cog icon-spin"></i>&nbsp;还在开发中...</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="pencilMainSaveChange">Save changes</button>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->
<script>
    $(function(){
        $("div.img-group").find("img.img-thumbnail[data-rotate]").each(function(){
            var rotate = $(this).data("rotate");

            if(rotate != 0) {
                var old_height = $(this).height();
                var old_width = $(this).width();

                $(this).height(old_width);
                $(this).css({
                            transform: "rotate(" + $(this).data("rotate") + "deg"
                });
            }
        });

        $(".double-click-open").on({
            dblclick: function () {
                $(this).removeAttr("readonly");
                $(this).focus();
            },
            blur: function() {
                $(this).attr("readonly","readonly");
            }
        });

        $("#pencilMainSaveChange").on('click',function(){
            applyAjax();
        });

        function applyAjax(){
            var $pencilMain_form1 = $("#pencilMain_form1");
            var $bt = $pencilMain_form1.find("input[name='bt']");
            var $wtms = $pencilMain_form1.find("textarea[name='wtms']");

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

            if($pencilMain_form1.find("input[name='touser']").val() == ""){
                alert("请选择通知人后提交...");
                return false;
            }

            //异步提交表单
            var submitURL = "/pencil/save";

            $pencilMain_form1.ajaxSubmit({
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
    function pencilMain_callUpdateTouser(id, name, flag){
    var $touserInput = $("#pencilMain_form1").find("input[name='touser']");
        var $touserItmes = $("#pencilMain_form1").find("#touserItmes");
        var mainString = $touserInput.val();
        if(flag){
            $touserInput.val(removeStringItems(mainString, id));
            $touserItmes.find("i.user-item[data-id='"+id+"']").remove();
        }else{
            $touserInput.val(addStringItems(mainString, id));
            $touserItmes.append("<i class='user-item' data-id='"+id+"' >"+name+"</i>");
        }
    }
</script>