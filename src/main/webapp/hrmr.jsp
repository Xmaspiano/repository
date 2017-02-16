<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/11
  Time: 上午11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .fix-scroll {
        height: calc(100vh - 100px);
        margin-top: 44px;
    }
</style>
<div class="page__bd container" >
    <div class="weui-search-bar" id="searchBar" style="width:100%;position: absolute; top:0; left: 0; z-index: 500">
        <form id="form-hrmr" class="weui-search-bar__form">
            <div class="weui-search-bar__box">
                <i class="weui-icon-search"></i>
                <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required="">
                <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
            </div>
            <label class="weui-search-bar__label" id="searchText">
                <i class="weui-icon-search"></i>
                <span>搜索</span>
            </label>
        </form>
        <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchApply">确认</a>
        <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
    </div>
    <form id="hrmrform">
        <%--<div class="weui-search-bar">--%>
        <%--&nbsp;--%>
        <%--</div>--%>
        <div id="cell_detial" class="weui-cells_radio fix-scroll" style="overflow-y: scroll;">
            <div class="weui-loadmore">
                <i class="weui-loading"></i>
                <span class="weui-loadmore__tips">正在加载</span>
            </div>
        </div>
    </form>
</div>
<div id="addEmelent" style="display: none">
    <label class="weui-cell weui-check__label" for="">

        <div class="weui-cell__bd">
            <p>cell standard</p>
        </div>
        <div class="weui-cell__ft">
            <input type="checkbox" name="radio1" class="weui-check" id="" data-name="" data-lastname="" value="" >
            <span class="weui-icon-checked"></span>
        </div>
    </label>
</div>
<script type="text/javascript">
    $(function() {
        if($("#cell_detial").children("div").size() == 1) {
            $('#searchApply').show();
            $.getJSON("/hrmr", function (result) {
                var $addEmelent = $("#addEmelent");
                $.each(result, function (i, obj) {
                    $addEmelent.find("label.weui-check__label").attr("for", obj.id);
                    $addEmelent.find("div.weui-cell__bd").find("p").html(obj.lastname);
                    $addEmelent.find("input.weui-check").attr("id", obj.id);
                    $addEmelent.find("input.weui-check").attr("data-name", obj.pinyinlastname);
                    $addEmelent.find("input.weui-check").attr("data-lastname", obj.lastname);
                    $addEmelent.find("input.weui-check").val(obj.id);
                    $("#cell_detial").append($addEmelent.html());
                });

                $("#showUser").children("i.user-group").each(function () {
                    $("#" + $(this).data("id")).attr("checked", "checked");
                });

                $("div.weui-loadmore").remove();
            });
        }

        var $searchBar = $('#searchBar'),
                $searchText = $('#searchText'),
                $searchInput = $('#searchInput'),
                $searchClear = $('#searchClear'),
                $searchCancel = $('#searchCancel'),
                $searchApply = $('#searchApply');

        $searchText.on('click', function(){
            $searchBar.addClass('weui-search-bar_focusing');
            $searchInput.focus();
        });

        $searchInput.keyup(function(){
            $searchInput.val();
            $("#cell_detial").find("input.weui-check").each(function(){
                if( $(this).data('name').indexOf($searchInput.val()) ==0 || $(this).data('lastname').indexOf($searchInput.val()) ==0 ){
                    $(this).parent().parent("label.weui-check__label").show();
                }else{
                    $(this).parent().parent("label.weui-check__label").hide();
                }
            });
        });

        $searchClear.on('click', function(){
            $searchInput.val("");
            $searchInput.focus();
            showAllDetail();
        });

        $searchCancel.on('click', function(){
            cancelSearch();
        });

        $searchApply.on('click', function(){
            var checks = ReplaceAll($('#hrmrform').serialize(),"radio1=","").split("&");
            if(checks != "") {
                var objArray = new Array(checks.length);

                for (var i = 0; i < objArray.length; i++) {
                    var checkVO = new Object();
                    checkVO.id = checks[i];
                    checkVO.lastname = $("#" + checks[i]).data("lastname");
                    objArray[i] = checkVO;
                }
                pencil_addToUser(objArray);
//                applyAjax();
            }
//            test_checkTempPage();
            history.go(-1);
        });

        function hideSearchResult(){
            $searchInput.val('');
        }
        function cancelSearch(){
            $searchBar.removeClass('weui-search-bar_focusing');
            $searchText.show();
            showAllDetail();
        }

        function showAllDetail(){
            $("#cell_detial").find("input.weui-check").each(function(){
                $(this).parent().parent("label.weui-check__label").show();
            });
        }
    });

    function ReplaceAll(str, sptr, sptr1){
        while (str.indexOf(sptr) >= 0){
            str = str.replace(sptr, sptr1);
        }
        return str;
    }
</script>