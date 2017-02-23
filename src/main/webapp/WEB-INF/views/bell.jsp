<%--
  Created by IntelliJ IDEA.
  User: AlbertXmas
  Date: 2017/1/4
  Time: 上午11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .fix-scroll {
        height: calc(100vh - 93px);
        margin-top: 34px;
    }
</style>
<div id="bell-showpage">
    <div class="bell"><!-- 菜单主显示页面 class必须与页面id一致-->
        <div class="page__bd container">
            <div class="weui-search-bar" id="searchBar-bell" style="width:100%;position: absolute; top:0; left: 0; z-index: 500">
                <form id="form-hrmr" class="weui-search-bar__form">
                    <div class="weui-search-bar__box">
                        <i class="weui-icon-search"></i>
                        <input type="search" class="weui-search-bar__input" id="searchInput-bell" placeholder="搜索" required="">
                        <a href="javascript:" class="weui-icon-clear" id="searchClear-bell"></a>
                    </div>
                    <label class="weui-search-bar__label" id="searchText-bell">
                        <i class="weui-icon-search"></i>
                        <span>搜索</span>
                    </label>
                </form>
                <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchApply-bell">查询</a>
            </div>

            <div class="weui-panel weui-panel_access">
                <div id="bell-detail" class="weui-panel__bd fix-scroll" style="overflow-y: scroll;">

                </div>
            </div>
        </div>
        <div id="showDetail-bell" style="display: none">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg" data-url="/pencilPageMain.jsp" data-id="0">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title"></h4>
                    <p class="weui-media-box__desc"></p>
                </div>
                <div class="weui-media-box__ft">
                </div>
            </a>
        </div>
    </div>
</div>
<script>
    var page_bell = 0;
    var totalPage_bell = 0;
    var clock_bell = true;


    $(function() {
        var $searchBar = $('#searchBar-bell'),
                $searchText = $('#searchText-bell'),
                $searchInput = $('#searchInput-bell'),
                $searchClear = $('#searchClear-bell'),
                $searchApply = $('#searchApply-bell'),
                $showDetail = $("#showDetail-bell"),
                $bellDetail = $("#bell-detail");

        bell_init();

        $bellDetail.on('click', '.weui-media-box[data-url]', function () {
            window.location.href = $(this).data('url') + "?id=" + $(this).data('id');
        });

        $bellDetail.on("scroll",function () {
            var $this =$(this),
                    viewH =$(this).height(),//可见高度
                    contentH =$(this).get(0).scrollHeight,//内容高度
                    scrollTop =$(this).scrollTop();//滚动高度
            //if(contentH - viewH - scrollTop <= 100) { //到达底部100px时,加载新内容
            if(clock_bell){
                if(scrollTop/(contentH -viewH)>=0.95 && totalPage_bell > page_bell+1){ //到达底部95%时,加载新内容
                    clock_bell = false;
                    loadingToast();
                    // 这里加载数据..
                    $.getJSON("/bell/queryall?page="+(page_bell+1), function (result) {
                        addrows(result);
                        loadingToast_close();
                        toast();
                        clock_bell = true;
                    });
                }
            }
        });

        $searchText.on('click', function(){
            //功能还未开放
//            $searchBar.addClass('weui-search-bar_focusing');
//            $searchInput.focus();
        });

        $searchInput.on("keyup",function(){

        });

        $searchClear.on('click', function(){
            $searchInput.val("");
            $searchInput.focus();
        });

        $searchApply.on('click', function(){
            alertDialog("还未开放...");
        });

        function bell_init(){
            $searchApply.show();
            enptyBellDetial();
            $bellDetail.html($("#loadmore").html());

            $.ajax({
                url: "/bell/queryall",
                cache:false,
                dataType: "json",
                success: function (result) {
                    addrows(result);
                },
            });
        }

        function enptyBellDetial(){
            $bellDetail.empty();
            $bellDetail.html($("#loadmore").html());
        }

        function addrows(result){
            changeBellBadge(result.bellSize);

            $.each(result.detail.content, function (i, obj) {//bellSize
                $showDetail.find("h4.weui-media-box__title").html(obj.bt);
                $showDetail.find("p.weui-media-box__desc").html(obj.wtms);
                $showDetail.find("a.weui-media-box_appmsg").attr("data-id", obj.id);
                if (obj.answer == false) {
                    $showDetail.find("div.weui-media-box__ft").html("<i class=\"icon-hand-right\" style=\"color: #007dbc\"></i>");
                } else {
                    $showDetail.find("div.weui-media-box__ft").empty();
                }
                $bellDetail.find("div.weui-loadmore").before($showDetail.html());
            });
            $bellDetail.find("div.weui-loadmore").children("i.weui-loading").remove();
            $bellDetail.find("div.weui-loadmore").children("span.weui-loadmore__tips").html("");

            page_bell = result.detail.number;
            totalPage_bell = result.detail.totalPages;
        }
    });
</script>