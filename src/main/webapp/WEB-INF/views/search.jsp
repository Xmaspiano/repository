<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/4
  Time: 上午11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link rel="stylesheet" href="/static/weui/example.css"/>--%>
<div id="search-showpage">
    <div class="bell"><!-- 菜单主显示页面 class必须与页面id一致-->
        页面还在施工中!<i class="icon-cog icon-large icon-spin"></i>
    </div>
    <%--<div class="search"><!-- 菜单主显示页面 class必须与页面id一致-->--%>
        <%--<div class="page__bd">--%>
            <%--<!--<a href="javascript:;" class="weui-btn weui-btn_primary">点击展现searchBar</a>-->--%>
            <%--<div class="weui-search-bar" id="searchBar">--%>
                <%--<form class="weui-search-bar__form">--%>
                    <%--<div class="weui-search-bar__box">--%>
                        <%--<i class="weui-icon-search"></i>--%>
                        <%--<input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required="">--%>
                        <%--<a href="javascript:" class="weui-icon-clear" id="searchClear"></a>--%>
                    <%--</div>--%>
                    <%--<label class="weui-search-bar__label" id="searchText">--%>
                        <%--<i class="weui-icon-search"></i>--%>
                        <%--<span>搜索</span>--%>
                    <%--</label>--%>
                <%--</form>--%>
                <%--<a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>--%>
            <%--</div>--%>
            <%--<div class="weui-cells searchbar-result" id="searchResult">--%>
                <%--<div class="weui-cell weui-cell_access">--%>
                    <%--<div class="weui-cell__bd weui-cell_primary">--%>
                        <%--<p>实时搜索文本</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="weui-cell weui-cell_access">--%>
                    <%--<div class="weui-cell__bd weui-cell_primary">--%>
                        <%--<p>实时搜索文本</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="weui-cell weui-cell_access">--%>
                    <%--<div class="weui-cell__bd weui-cell_primary">--%>
                        <%--<p>实时搜索文本</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="weui-cell weui-cell_access">--%>
                    <%--<div class="weui-cell__bd weui-cell_primary">--%>
                        <%--<p>实时搜索文本</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
<%--<script type="text/javascript">--%>
    <%--$(function() {--%>
        <%--var $searchBar = $('#searchBar'),--%>
                <%--$searchResult = $('#searchResult'),--%>
                <%--$searchText = $('#searchText'),--%>
                <%--$searchInput = $('#searchInput'),--%>
                <%--$searchClear = $('#searchClear'),--%>
                <%--$searchCancel = $('#searchCancel');--%>

        <%--function hideSearchResult(){--%>
            <%--$searchResult.hide();--%>
            <%--$searchInput.val('');--%>
        <%--}--%>
        <%--function cancelSearch(){--%>
            <%--hideSearchResult();--%>
            <%--$searchBar.removeClass('weui-search-bar_focusing');--%>
            <%--$searchText.show();--%>
        <%--}--%>

        <%--$searchText.on('click', function(){--%>
            <%--alert(11);--%>
            <%--$searchBar.addClass('weui-search-bar_focusing');--%>
            <%--$searchInput.focus();--%>
        <%--});--%>
        <%--$searchInput--%>
                <%--.on('blur', function () {--%>
                    <%--if(!this.value.length) cancelSearch();--%>
                <%--})--%>
                <%--.on('input', function(){--%>
                    <%--if(this.value.length) {--%>
                        <%--$searchResult.show();--%>
                    <%--} else {--%>
                        <%--$searchResult.hide();--%>
                    <%--}--%>
                <%--})--%>
        <%--;--%>
        <%--$searchClear.on('click', function(){--%>
            <%--hideSearchResult();--%>
            <%--$searchInput.focus();--%>
        <%--});--%>
        <%--$searchCancel.on('click', function(){--%>
            <%--cancelSearch();--%>
            <%--$searchInput.blur();--%>
        <%--});--%>
    <%--});</script>--%>