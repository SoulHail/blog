<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑FAQ</title>
</head>

<body>
<!-- /.main-container -->
<%@include file="../layout/common.js.jsp" %>

<div class="widget-body">
    <div class="widget-main no-padding ">
        <div class="widget-main ">
            <form class="form-inline form-horizontal" id="addForm" method="post">
                <div class="container" style="margin: 0px;width:100%">
                    <div class="row">
                        <div class="col-md-5 col-sm-6 form-group-sm">
                            <label for="title" class="col-md-3 col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">标题:</label>
                            <div class="col-md-8 col-sm-9">
                                <input maxlength="20" type="text" name="title" id="title" class="findWrite form-control" style="width:100%" value="${findInfo.title}"/>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-6 form-group-sm">
                            <label for="indexNo" class="col-md-3 col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">显示序号:</label>
                            <div class="col-md-2 col-sm-3">
                                <input type="text" name="indexNo" id="indexNo" maxlength="3"  class="findNumber form-control" style="width:100%" value="${findInfo.indexNo}"/>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-5 col-sm-6 form-group-sm">
                            <label for="releaseState" class="col-md-3 col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">是否发布:</label>
                            <div class="col-md-8 col-sm-9">
                                <select name="releaseState" id="releaseState" class="chosen-select form-control width-200px">
                                    <option value="01" <c:if test="${findInfo.releaseState=='01'}">selected ="selected"</c:if>>否</option>
                                    <option value="02" <c:if test="${findInfo.releaseState=='02'}">selected ="selected"</c:if>>是</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-6 form-group-sm ">
                            <label for="showGroup" class="col-md-3 col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">显示场景:</label>
                            <div class="col-md-8 col-sm-9" style="width: 200px;">
                                <select name="showGroup" id="showGroup" class="chosen-select form-control width-105px">
                                    <c:forEach var="showScenes" items="${showScenes}" >
                                        <option value="${showScenes.paramKey}" <c:if test="${showScenes.paramKey == findInfo.showGroup}">selected</c:if> >${showScenes.paramValue}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-12 col-sm-12 form-group-sm">
                            <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注:</label>
                            <div class="col-md-8 col-sm-9">
                                <textarea style="height: 60px;width: 39%"  class="findWrite form-control" maxlength="100" name="remark" id="remark" >${findInfo.remark}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-12 col-sm-12 form-group-sm">
                            <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">编辑内容:</label>
                            <label class="col-sm-8 control-label no-padding-left" style="color: red;text-align: left;">（注意，上传的图片名称或URL中不能有中文出现）</label>
                        </div>
                    </div>
                    <div style="width: 100%;margin-top: 10px;">
                        <!-- 加载编辑器的容器 -->
                        <script id="container" name="content" type="text/plain"></script>
                        <!-- 配置文件 -->
                        <script type="text/javascript" src="${ctx}/js/ueditor/ueditor.config.js"></script>
                        <!-- 编辑器源码文件 -->
                        <script type="text/javascript" src="${ctx}/js/ueditor/ueditor.all.js"></script>
                        <!-- 实例化编辑器 -->
                        <script type="text/javascript">
                            /** var ue = UE.getEditor('container'); */
                            var ue = UE.getEditor('container',
                                {initialFrameHeight:270,autoHeightEnabled:false}
                            );

                            //自定义图片上传
                            UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
                            UE.Editor.prototype.getActionUrl = function(action) {
                                if (action == 'uploadimage') {
                                    var uri="${ctx}/mpos/faq/uploadImage";
                                    return uri;
                                } else {
                                    return this._bkGetActionUrl.call(this, action);
                                }
                            };

                            $(document).ready(function(){
                                var noHtmlContent=$('#noHtmlContent').val();
                                ue.ready(function() {//编辑器初始化完成再赋值
                                    ue.setContent(noHtmlContent);  //赋值给UEditor
                                });
                            });

                        </script>
                    </div>
                    <input type="hidden" name="uuid" id="uuid" value="${findInfo.uuid }"/>
                    <input type="hidden" name="htmlContent" id="htmlContent"/> <!-- html文件代码内容 -->
                    <input type="hidden" name="noHtmlContent" id="noHtmlContent" value='${findInfo.content}'/> <!-- 仅编辑内容 -->
                    <div class="row center" style="margin-top: 1.5%;">
                        <button id="btnPreview" class="btn btn-info btn-sm" type="button" style="margin-right: 1%">
                            <span  class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>预览
                        </button>
                        <button id="btnSave" class="btn btn-danger btn-sm" type="button" style="margin-right: 1%">
                            <span  class="ace-icon fa fa-save icon-on-right bigger-110"></span>提交
                        </button>
                        <button id="btnClose" class="btn btn-grey btn-sm" type="button">
                            <span class="ace-icon fa fa-backward icon-on-right bigger-110"></span>关闭
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script>
    $(function(){
        //模拟手机预览
        $('#btnPreview').click(function () {
            var htmlContent = UE.getEditor('container').getAllHtml(); //获取整个html代码内容
            previewHtml(htmlContent);
        });

        //禁止输入空格
        $(".findWrite").keyup(function(){
            //this.value=this.value.replace(/\s/gi,'');//去除空格
            this.value=this.value.replace(/^\s*|\s*$/g,'');//去除空格
        })

        //只能输入数字
        $(".findNumber").keyup(function(){
            $(this).val($(this).val().replace(/\D|^0/g,''));
        }).bind("paste",function(){  //CTR+V事件处理
            $(this).val($(this).val().replace(/\D|^0/g,''));
        }).css("ime-mode", "disabled");  //CSS设置输入法不可用

        //绑定"提交"按钮事件
        $('#btnSave').click(function(){
            var title=$('#title').val();
            if(title==''){
                Modal.alert({
                    msg:"请填写标题！",
                    title: '提示'
                });
                return false;
            }
            var indexNo=$('#indexNo').val();
            if(indexNo==''){
                Modal.alert({
                    msg:"请填写显示序号！",
                    title: '提示'
                });
                return false;
            }
            var ueContent=UE.getEditor('container').hasContents();
            if(ueContent==false){
                Modal.alert({
                    msg:"请填写详情信息！",
                    title: '提示'
                });
                return false;
            }

            Modal.confirm({msg: '是否确认进行提交？'}).on(function(e){
                if(e){
                    $(this).attr("disabled",true); //禁止提交按钮
                    var htmlContent = UE.getEditor('container').getAllHtml(); //获取整个html代码内容
                    var noHtmlContent = UE.getEditor('container').getContent(); //仅获取内容，没有html
                    $('#htmlContent').val(htmlContent);
                    $('#noHtmlContent').val(noHtmlContent);

                    //发送请求，生成html文件
                    $.ajax({
                        type:"POST",
                        dataType:"json",
                        data:$('#addForm').serialize(),
                        url: '${ctx}/mpos/faq/editSave',
                        success:function(returnJsonMsg){
                            if("200" == returnJsonMsg.code){
                                Modal.alert({
                                    msg:"提交成功！",
                                    title: '提示'
                                });

                                //跳转到列表页面
                                window.location.href="${ctx}/mpos/faq/list";
                            }
                        },
                        error:function(){
                            $(this).attr("disabled",false); //启用提交按钮
                            Modal.alert({
                                msg:"调用失败！",
                                title: '错误'
                            });
                        }
                    });//end ajax
                }
            });
        }); // end click

        //关闭页面，跳转到列表页
        $('#btnClose').click(function(){
            window.location.href="${ctx}/mpos/faq/list";
        }); // end click
    }); //end jquery init function

    //模拟手机预览
    function previewHtml(htmlContent){
        var htmlHead = "<!DOCTYPE HTML><html><head><title>预览</title>";
        htmlContent = htmlContent.substring(12, htmlContent.length);
        htmlContent = htmlHead + htmlContent;
        console.log(htmlContent);

        //获得窗口的垂直位置
        var iTop = (window.screen.availHeight - 30 - 500) / 2;
        //获得窗口的水平位置
        var iLeft = (window.screen.availWidth - 10 - 400) / 2;

        testwin= open("", "showWin","location =no,status=no,menubar=yes,toolbar=no,width=400,height=500,top="+iTop+",left="+iLeft+"");
        testwin.document.open();
        testwin.document.write(htmlContent);
        testwin.document.close();
    }
</script>
</html>