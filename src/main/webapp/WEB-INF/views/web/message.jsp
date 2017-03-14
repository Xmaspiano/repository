<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/3/5
  Time: 上午11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="message-form" enctype="multipart/form-data">
    <input type="hidden" name="pencilid" value="${pencilid}">
    <input type="hidden" name="message_id" value="">
    <div class="form-group">
        <div class="input-group file-caption-main">
            <div class="input-group-addon">留言</div>
            <input name="message" type="text" class="form-control" placeholder="请输入留言..." transparent autofocus x-webkit-speech>
                                        <span class="input-group-addon btn btn-primary" id="message_submit">
                                             <span class="icon-comments-alt"></span>
                                        </span>
        </div>
    </div>

    <div class="form-group">
        <label>留言板</label>

        <c:forEach items="${messagesList}" var="message">
            <section>
                <i class='user-item' data-id='${pencilTouser.touser}' >${message.name}&nbsp;${message.createdate}</i>&nbsp;
                <p><i class="page__desc icon-comment-alt">&nbsp;</i>${message.message}</p>

                <%--<i class="page__desc icon-comment-alt">&nbsp;${message.createdate}</i>--%>
                <%--<p><i>${message.name}:&nbsp;</i>${message.message}</p>--%>
            </section>
        </c:forEach>
    </div>
</form>
<script>
    $(function(){
        var $message_submit=$("#message_submit"),
//                $message_delete=$("#message_delete"),
                $message_form=$("#message-form"),
                $message_id=$("#message_id");

        $message_submit.on('click',function(){
            $.ajax({
                type: "POST",
                url: "/message/save",
                data: $message_form.serialize(),
                beforeSend: function(){
//                    loadingToast();
                },
                success: function(msg){
//                    loadingToast_close();
//                    showTab("tab03");
                    reloadThis();
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
//                    loadingToast_close();
//                    toolShow(textStatus);
                }
            });
        });

//        $message_delete.on('click',function(){
//            $.ajax({
//                type: "POST",
//                url: "/message/delete",
//                data: {
//                    id:$message_id.val()
//                },
//                beforeSend: function(){
//                    loadingToast();
//                },
//                success: function(msg){
//                    loadingToast_close();
//                    showTab("tab03");
//                },
//                error:function(XmlHttpRequest,textStatus,errorThrown){
//                    loadingToast_close();
//                    toolShow(textStatus);
//                }
//            });
//        });
    });

    function reloadThis(){
        $.ajax({
            type: "GET",
            url: "/message/web?id=${pencilid}",
            success: function(dataHtml){
                $("#message-form").parent().html(dataHtml)
            }
        });
    }
</script>
