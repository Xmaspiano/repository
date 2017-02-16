<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/7
  Time: 下午3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="answer-showpage">
    <div class="answer"><!-- 菜单主显示页面 class必须与页面id一致-->
        <div class="weui-cells__title">处理意见</div>

        <c:if test="${canEdit}">
            <form id="answer-form" role="form">
                <input type="hidden" id="answer_id" name="id" value="${AnswerPage.id}">
                <input type="hidden" name="pencilid" value="${pencilid}">
                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" name="answer" placeholder="请输入问题描述" rows="3">${AnswerPage.answer}</textarea>
                        </div>
                    </div>

                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <div id="showUser" style="float: right;width: auto">
                                <i>${AnswerPage.name}</i>
                            </div>
                        </div>
                    </div>

                    <div class="weui-cell">
                        <button id="answer_delete" type="button" class="weui-form-preview__btn weui-form-preview__btn_defaut" style="color: red" >删除</button>
                        <button id="answer_submit" type="button" class="weui-form-preview__btn weui-form-preview__btn_primary" >提交</button>
                    </div>
                </div>
            </form>
        </c:if>

        <c:if test="${answersList.size()==0}">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p class="page__desc">还没有处理意见</p>
                    </div>
                </div>
            </div>
        </c:if>
        <c:forEach items="${answersList}" var="answer">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>${answer.answer}</p>
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <div class="showUser" style="float: right;width: auto">
                            <i>${answer.name}&nbsp;&nbsp;</i><i class="page__desc">${answer.createdate}</i>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<br>
<script>
    $(function(){
        var $answer_submit=$("#answer_submit"),
                $answer_delete=$("#answer_delete"),
                $answer_form=$("#answer-form"),
                $answer_id=$("#answer_id");

        $answer_submit.on('click',function(){
            $.ajax({
                type: "POST",
                url: "/answer/save",
                data: $answer_form.serialize(),
                beforeSend: function(){
                    loadingToast();
                },
                success: function(msg){
                    loadingToast_close();
                    showTab("tab02");
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
                    loadingToast_close();
                    toolShow(textStatus);
                }
            });
        });

        $answer_delete.on('click',function(){
            $.ajax({
                type: "POST",
                url: "/answer/delete",
                data: {
                    id:$answer_id.val()
                },
                beforeSend: function(){
                    loadingToast();
                },
                success: function(msg){
                    loadingToast_close();
                    showTab("tab02");
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
                    loadingToast_close();
                    toolShow(textStatus);
                }
            });
        });
    });
</script>