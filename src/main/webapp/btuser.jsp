<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String touser = request.getParameter("touser") == null?"":request.getParameter("touser");
    String callPage = request.getParameter("callPage") == null?"":request.getParameter("callPage");
    String randomId = UUID.randomUUID().toString();
%>
<div id="<%= randomId%>">
    <div class="dropdown text-right">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="icon-group"></i></a>
        <ul class="dropdown-menu" style="padding: 0px;border-width: 0px;">
            <div class="input-group file-caption-main">
                <input type="text" class="form-control" placeholder="查询人员..." transparent autofocus x-webkit-speech>
                                        <span class="input-group-addon btn btn-primary">
                                             <span class="icon-search"></span>
                                        </span>
            </div>
            <div class="list-group userDetail" style="overflow-y: scroll;height: 300px;margin-bottom: 0px;">
                <%-- 备选人员 --%>
            </div>
        </ul>
    </div>
    <div style="display: none">
        <div class="userDetail_temp">
            <a href="#" class="list-group-item">
                <p class="list-group-item-text">
                    <%--人员姓名--%>
                </p>
            </a>
        </div>
    </div>
</div>
<script>
    $(function(){
        var $userDetail_temp = $("#<%= randomId%>").find("div.userDetail_temp");
        var $userDetail = $("#<%= randomId%>").find("div.userDetail");

        $.getJSON("/hrmr", function (result) {
            $.each(result, function (i, obj) {
                $userDetail_temp.find("p.list-group-item-text").html(obj.lastname+
                        "<i class=\"item-text icon-ok pull-right\" style='color: #337ab7;display: none;' data-id='"+obj.id+"'></i>");
                $userDetail_temp.find("a.list-group-item").attr("data-id", obj.id);
                $userDetail_temp.find("a.list-group-item").attr("data-name", obj.pinyinlastname);
                $userDetail_temp.find("a.list-group-item").attr("data-lastname", obj.lastname);
                $userDetail.append($userDetail_temp.html());
            });

            $userDetail.on("click", "a.list-group-item", function(){
                var lastname = $(this).data("lastname");
                var id = $(this).data("id");

                $(this).find("i.item-text").toggle(100,function(){
                    <%= callPage%>_callUpdateTouser(id, lastname, $(this).is(":hidden"));
                });
                return false;
            });

            var aryUsers = "<%= touser%>".split(",");
            if(aryUsers.length >0) {
                for (var i = 0; i < aryUsers.length; i++) {
                    $userDetail.find("i.item-text[data-id='"+aryUsers[i]+"']").toggle();
                }
            }

        });

        $userDetail.scrollUnique();
    });
</script>