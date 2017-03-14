<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/3/5
  Time: 上午11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="answer-form" enctype="multipart/form-data">
    <input type="hidden" id="answer_id" name="id" value="${AnswerPage.id}">
    <input type="hidden" name="pencilid" value="${pencilid}">
    <div class="form-group">
        <label>意见描述</label>
        <textarea class="form-control click-open" name="answer" rows="3" readonly="readonly">${AnswerPage.answer}</textarea>
    </div>
        <button type="button" class="btn btn-primary pull-right" id="answer_submit" style="margin-left: 10px">Submit</button>
        <button type="button" class="btn btn-danger pull-right" id="answer_delete" style="margin-left: 10px">Delete</button>
</form>

<div class="form-group">
    <h3 for="wtms">处理描述</h3>

    <c:forEach items="${answersList}" var="answer">
        <blockquote class="bg-blockquote-info">
            <p>${answer.answer}</p>
            <footer>填写人:<cite title="Source Title">${answer.name}&nbsp;&nbsp;</cite><p class="text-right">${answer.createdate}</p></footer>
        </blockquote>
    </c:forEach>
</div>
<script>
    $(function(){
        $(".click-open").on({
            click: function () {
                $(this).removeAttr("readonly");
                $(this).focus();
            },
            blur: function() {
                $(this).attr("readonly","readonly");
            }
        });

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
//                    loadingToast();
                },
                success: function(msg){
                    reloadThis();
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
//                    loadingToast_close();
//                    toolShow(textStatus);
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
//                    loadingToast();
                },
                success: function(msg){
                    reloadThis();
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
//                    loadingToast_close();
//                    toolShow(textStatus);
                }
            });
        });

    });

    function reloadThis(){
        $.ajax({
            type: "GET",
            url: "/answer/web?id=${pencilid}",
            success: function(dataHtml){
                $("#answer-form").parent().html(dataHtml)
            }
        });
    }
</script>