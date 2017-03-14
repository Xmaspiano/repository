<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog" role="document" style="float: right;">
    <div class="modal-content">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <form enctype="multipart/form-data">
                    <input type="hidden" name="pencilId" value="">
                    <div class="form-group">
                        <label for="bt">标题</label>
                        <input type="text" class="form-control double-click-open" id="bt" placeholder="text" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn btn-default active">
                                <input type="radio" name="jjcd" value="1">一般
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="jjcd" value="2">优先
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="jjcd" value="3">优先
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="wtms">问题描述</label>
                        <textarea class="form-control double-click-open" id="wtms" rows="3" readonly="readonly"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn btn-default active">
                                <input type="radio" name="wtlb" value="1">SAP应用故障
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
                        <div>
                            <i class='user-item' data-id='user' >用户名</i>&nbsp;
                            <i class='user-item' data-id='user' >用户名</i>&nbsp;
                            <i class='user-item' data-id='user' >用户名</i>&nbsp;
                            <i class='user-item' data-id='user' >用户名</i>&nbsp;
                        </div>
                        <div class="dropdown text-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="icon-group"></i></a>
                            <ul class="dropdown-menu" style="padding: 0px;border-width: 0px;">
                                <div class="input-group file-caption-main">
                                    <input type="text" class="form-control" placeholder="查询人员..." transparent autofocus x-webkit-speech>
                                        <span class="input-group-addon btn btn-primary">
                                             <span class="icon-search"></span>
                                        </span>
                                </div>
                                <div class="list-group" style="overflow-y: scroll;height: 300px;margin-bottom: 0px;">
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                    <a href="#" class="list-group-item ">
                                        <p class="list-group-item-text">
                                            人员姓名
                                        </p>
                                    </a>
                                </div>
                            </ul>
                        </div>
                    </div>

                    <div class="form-group">
                        <label >图片预览</label>
                        <%--<div class="btn btn-default btn-file">--%>
                        <input id="file-1" type="file" multiple="" class="file" data-overwrite-initial="false" data-min-file-count="2">
                        <%--</div>--%>
                    </div>
                </form>
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
                <div id="myTabContent" class="tab-content">
                    <div class="modal-body tab-pane fade in active" id="answerTab">
                        <form enctype="multipart/form-data">
                            <input type="hidden" name="answerId" value="">
                            <div class="form-group">
                                <label for="wtms">意见描述</label>
                                <textarea class="form-control click-open" id="answer" rows="3" readonly="readonly"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary pull-right">Submit</button>
                        </form>

                        <div class="form-group">
                            <h3 for="wtms">处理描述</h3>

                            <blockquote class="bg-blockquote-info">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                <footer>填写人:<cite title="Source Title">Source Title</cite><p class="text-right">2017-03-02 15:02</p></footer>
                            </blockquote>

                            <blockquote class="bg-blockquote-info">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                <footer>填写人:<cite title="Source Title">Source Title</cite><p class="text-right">2017-03-02 15:02</p></footer>
                            </blockquote>
                            <blockquote class="bg-blockquote-info">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                <footer>填写人:<cite title="Source Title">Source Title</cite><p class="text-right">2017-03-02 15:02</p></footer>
                            </blockquote>
                            <blockquote class="bg-blockquote-info">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                <footer>填写人:<cite title="Source Title">Source Title</cite><p class="text-right">2017-03-02 15:02</p></footer>
                            </blockquote>
                            <blockquote class="bg-blockquote-info">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                <footer>填写人:<cite title="Source Title">Source Title</cite><p class="text-right">2017-03-02 15:02</p></footer>
                            </blockquote>
                        </div>
                    </div>
                    <div class="modal-body tab-pane fade" id="messageTab">
                        <form enctype="multipart/form-data">
                            <input type="hidden" name="answerId" value="">
                            <div class="form-group">
                                <div class="input-group file-caption-main">
                                    <div class="input-group-addon">留言</div>
                                    <input type="text" class="form-control" placeholder="请输入留言..." transparent autofocus x-webkit-speech>
                                        <span class="input-group-addon btn btn-primary">
                                             <span class="icon-comments-alt"></span>
                                        </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="wtms">留言板</label>

                                <section>
                                    <i class="page__desc icon-comment-alt">&nbsp;2017-03-03 16:30</i>
                                    <p><i>胡哲阳:&nbsp;</i>阿萨德股份噶SD卡经历过哈利脚后跟</p>
                                </section>
                                <section>
                                    <i class="page__desc icon-comment-alt">&nbsp;2017-03-03 16:30</i>
                                    <p><i>胡哲阳:&nbsp;</i>阿萨德股份噶SD卡经历过哈利脚后跟</p>
                                </section>
                            </div>
                        </form>
                    </div>
                    <div class="modal-body tab-pane fade" id="activelistTab">
                        <p><i class="icon-cog icon-spin"></i>&nbsp;还在开发中...</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->