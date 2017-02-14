<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/2/8
  Time: 下午3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .fix-scroll {
        height: calc(100vh - 200px);
        /*margin-top: 44px;*/
    }
</style>
<div id="message-showpage">
    <div class="message container"><!-- 菜单主显示页面 class必须与页面id一致-->
        <%--<div class="weui-cells__title">处理意见</div>--%>

        <%--<div class="weui-search-bar" id="searchBar" style="overflow-y: hidden;">--%>
        <form id="message-form" role="form">
            <input type="hidden" name="pencilid" value="${pencilid}">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <textarea class="weui-textarea" name="message" placeholder="留言" rows="1"></textarea>
                    </div>
                </div>
                <div class="weui-cell">
                    <button id="message_submit" type="button" class="weui-form-preview__btn weui-form-preview__btn_primary" >留言</button>
                </div>
            </div>
        </form>
        <%--</div>--%>

        <article class="weui-article">
            <%--<h2 class="page__title" style="text-align:center;">留言板</h2>--%>
            <div id="cell_detial" class="weui-cells_radio fix-scroll" style="overflow-y: scroll">
                <c:forEach items="${messagesList}" var="message">
                    <section>
                        <i class="page__desc">${message.createdate}</i>
                        <p><i>${message.name}:&nbsp;</i>${message.message}</p>
                    </section>
                </c:forEach>
            </div>
        </article>
    </div>
</div>
<br>
<script>
    $(function(){
        $("#message_submit").on('click',function(){
            $.ajax({
                type: "POST",
                url: "/message/save",
                data: $("#message-form").serialize(),
                beforeSend: function(){
                    loadingToast();
                },
                success: function(msg){
                    loadingToast_close();
//                    toolShow(msg);
                    showTab("tab03");
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
                    loadingToast_close();
                    toolShow(textStatus);
                }
            });
        });

        $("#message_delete").on('click',function(){
            $.ajax({
                type: "POST",
                url: "/message/delete",
                data: {
                    id:$("#message_id").val()
                },
                beforeSend: function(){
                    loadingToast();
                },
                success: function(msg){
                    loadingToast_close();
//                    toolShow(msg);
                    showTab("tab03");
                },
                error:function(XmlHttpRequest,textStatus,errorThrown){
                    loadingToast_close();
                    toolShow(textStatus);
                }
            });
        });
    });
</script>
