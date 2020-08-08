<%--
  Created by IntelliJ IDEA.
  User: code_bear
  Date: 2019/8/6
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>任务中心</title>

</head>
<body class="no-skin ">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-content ">
        <div class="main-content-inner ">

            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable  ">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 任务中心添加配置
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/optionalWhite/add" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务模块</label>
                                                    <select data-placeholder="请选择" name="task" id="task" class="chosen-select form-control " style="width: 150px">
                                                        <option value="" >请选择</option>
                                                        <option value="1" >每日福利</option>
                                                        <option value="2" >自选有礼</option>
                                                    </select>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="taskName" id="taskName">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <select data-placeholder="请选择" name="couponType" id="couponType" class="chosen-select form-control " style="width: 150px">
                                                        <option value="1" >优惠券ID</option>
                                                        <option value="2" >券包ID</option>
                                                    </select>
                                                    <input width="60px" name="couponId" id="couponId">
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务条件</label>
                                                    <select data-placeholder="请选择" name="taskCondition" id="taskCondition" class="chosen-select form-control " style="width: 150px">
                                                        <option value="" >请选择</option>
                                                        <option value="1" >首笔交易</option>
                                                        <option value="2" >观看视频</option>
                                                        <option value="3" >银联二维码交易X笔累计交易X元</option>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">图标</label>
                                                    <div class="col-sm-4">
                                                        <input type="file" style="display:none" onchange="uploadPic(false)" id="tupload" name="tupload" value="上传">
                                                    </div>
                                                    <div class="col-sm-8">
                                                        <input type="hidden" name="taskPic" id="taskPic" value=""/>
                                                        <input type="button" class="form-control input-small width-100px" onclick="uploadPicclick();" value="上传小图标"/>
                                                        <input type="text" class="form-control input-small view-control" id="tAppFileName" name="taskAppFileName" readonly="readonly" style="width: 70%;"
                                                               data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                        <img alt="图片预览" src="" id="tpic" height="32" width="150">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励内容描述</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <textarea class="form-control input-small width-200px view-control" name="awrdDescribe" id="awrdDescribe"></textarea>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跳转类型</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input name="jumpType" type="radio" checked="checked" value="1"/>本地
                                                        <input name="jumpType" type="radio" value="2"/>h5
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跳转链接</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="jumpUrl" id="jumpUrl">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">循环类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="loopType" id="loopType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="" >一次性任务</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">展示进度</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input name="progress" type="radio" checked="checked" value="1"/>是
                                                        <input name="progress" type="radio" value="2"/>否
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input name="startTime" type="checkbox"/>立即<input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下线时间</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input name="endTime" type="checkbox"/>立即<input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">
                                                    </div>
                                                </div>

                                            </div>

                                            <%-- id 和 name 需要更换 --%>
                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">logo上传</label>
                                                    <div class="col-sm-4">
                                                        <input type="file" style="display:none" onchange="uploadLogo(false)" id="lupload" name="lupload" value="上传">
                                                    </div>
                                                    <div class="col-sm-8">
                                                        <input type="hidden" name="logoPic" id="logoPic" value=""/>
                                                        <input type="button" class="form-control input-small width-100px" onclick="uploadLogoclick();" value="上传文件"/>
                                                        <input type="text" class="form-control input-small view-control" id="lAppFileName" name="lAppFileName" readonly="readonly" style="width: 70%;"
                                                               data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                        <img alt="图片预览" src="" id="lpic" height="32" width="150">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务描述</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <textarea class="form-control input-small width-200px view-control" name="taskDescribe" id="taskDescribe"></textarea>
                                                    </div>
                                                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励弹窗描述</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <textarea class="form-control input-small width-200px view-control" name="taskPopupDescribe" id="taskPopupDescribe"></textarea>
                                                    </div>
                                                </div>

                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck()" >
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>确定
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="closes()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>取消
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row col-sm-12">
                        <div class="col-sm-4 hidden-480 left">
                            <label class="dataTables_info " id="dynamic-table_info"
                                   role="status" aria-live="polite"></label>
                        </div>
                        <div class="col-sm-8 right">
                            <%@include file="../layout/pagination.jsp"%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.main-content -->
</div>


<!-- /.main-container -->
<%@include file="../layout/common.js.jsp"%>
<script src="../../jquery.min.js"></script>
<script type="text/javascript">

    function closes(){
        parent.$.fancybox.close();
    }


    function finalCheck(){
        var a = $('input[name="jumpType"]:checked').val();
        var b = $('input[name="progress"]:checked').val();
        alert(a);
        alert(b);
        if($("#task").val()==""){
            alert("请选择任务模块");
            Modal.alert({
                msg:"请选择任务模块！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#taskName").val()==""){
            alert("请填写任务名称");
            Modal.alert({
                msg:"请填写任务名称！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#couponType").val()==""){
            alert("请选择券类型");
            Modal.alert({
                msg:"请选择券类型！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#couponId").val()==""){
            alert("请填写券ID");
            Modal.alert({
                msg:"请填写券ID！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#taskCondition").val()==""){
            alert("请选择任务条件");
            Modal.alert({
                msg:"请选择任务条件！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#taskPic").val()==""){
            alert("请上传任务图标");
            Modal.alert({
                msg:"请填写任务名称！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#awrdDescribe").val()==""){
            alert("请填写奖励内容描述");
            Modal.alert({
                msg:"请填写奖励内容描述！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#jumpUrl").val()==""){
            alert("请填写跳转链接");
            Modal.alert({
                msg:"请填写跳转链接！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#loopType").val()==""){
            alert("请选择循环类型");
            Modal.alert({
                msg:"请选择循环类型！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#logoPic").val()==""){
            alert("请上传logo图标");
            Modal.alert({
                msg:"请上传logo图标！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#taskDescribe").val()==""){
            alert("请填写任务描述");
            Modal.alert({
                msg:"请填写任务描述！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#taskPopupDescribe").val()==""){
            alert("请填写奖励弹框描述");
            Modal.alert({
                msg:"请填写奖励弹框描述！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        f="true";

        if(f=="true"){
            sub();
        }
    }

    function sub(){
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/optionalWhite/addSave',
            cache:false,
            async:false,
            data : {
                value : $("#value").val(),
                type : $("#type").val(),
            },
            success:function(result){
                if(result === "success"){
                    Modal.alert({
                        msg:"添加成功。"
                    }).on(function(e){
                        if(e===true){
                            parent.$.fancybox.close();
                            location.reload();
                        }
                    });
                }else {
                    Modal.alert({
                        msg:""+ result
                    });
                }
            }
        });
    }

    //触发上传操作按钮
    function uploadPicclick() {
        $('#tupload').click();
    }
    //执行上传图片
    function  uploadPic(isCover) {
        if($("#tupload").val()==""){
            Modal.alert({msg: "请先选择文件！"})
        }else if($("#upload")[0].files[0].size > 52428800){
            Modal.alert({msg: "文件大小不能超过50M"})
        }else{
            $.ajaxFileUpload({
                url: '${ctx}/mpos/upload/uploadFile?isCover='+isCover,
                fileElementId:'upload',
                dataType: 'text',
                success: function (data)
                {
                    data=eval('('+$(data).text()+')');
                    if("0000"==data.code){
                        var fileName = $("#upload")[0].files[0].name;
                        var picUrl = data.url;
                        $("#tpic").attr('src',picUrl);
                        $("#taskPic").val(picUrl);
                        $("#tAppFileName").val(picUrl);
                    }else if("1003"==data.code){
                        if(confirm('要覆盖此图片吗?')){
                            uploadFile(true);
                        }

                    }else{
                        Modal.alert({msg: data.message})
                    }

                    //Modal.alert({msg: fileName+" 上传成功！"})
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            });
        }
    }

    //触发上传操作按钮
    function uploadLogoclick() {
        $('#lupload').click();
    }
    //执行上传图片
    function  uploadLogo(isCover) {
        if($("#lupload").val()==""){
            Modal.alert({msg: "请先选择文件！"})
        }else if($("#lupload")[0].files[0].size > 52428800){
            Modal.alert({msg: "文件大小不能超过50M"})
        }else{
            $.ajaxFileUpload({
                url: '${ctx}/mpos/upload/uploadFile?isCover='+isCover,
                fileElementId:'upload',
                dataType: 'text',
                success: function (data)
                {
                    data=eval('('+$(data).text()+')');
                    if("0000"==data.code){
                        var fileName = $("#upload")[0].files[0].name;
                        var picUrl = data.url;
                        $("#lpic").attr('src',picUrl);
                        $("#logoPic").val(picUrl);
                        $("#lAppFileName").val(picUrl);
                    }else if("1003"==data.code){
                        if(confirm('要覆盖此图片吗?')){
                            uploadFile(true);
                        }

                    }else{
                        Modal.alert({msg: data.message})
                    }

                    //Modal.alert({msg: fileName+" 上传成功！"})
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            });
        }
    }

</script>
</body>
</html>
