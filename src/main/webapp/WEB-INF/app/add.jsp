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
    <title>App优化</title>

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
                                    <i class="ace-icon fa fa-table"></i> 添加弹窗广告配置
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
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">功能名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="functionName" id="functionName">
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">页面类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="viewType" id="viewType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >H5</option>
                                                            <option value="2" >原生</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">页面地址</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="viewUrl" id="viewUrl">
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">IOS审核</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="iosCheck" id="iosCheck" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >是</option>
                                                            <option value="2" >否</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">Native类别</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="nativeType" id="nativeType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >H5</option>
                                                            <option value="2" >原生</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">ENV类别</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="envType" id="envType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >H5</option>
                                                            <option value="2" >原生</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <div class="col-sm-8  no-padding">
                                                            <input class="form-control input-small width-200px view-control" name="remark" id="remark">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">活动显示位置</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="taskAdress" id="taskAdress" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="" >交易成功广告左</option>
                                                            <option value="" >交易成功广告中</option>
                                                            <option value="" >交易成功广告右</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">功能类别</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="functionType" id="functionType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >活动广告</option>
                                                            <option value="2" >xxx广告</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="row" style="margin-top: 10px;">
                                                    <div class="col-md-12 col-sm-12 form-group-sm">
                                                        <label for="remark" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间</label>
                                                        <div class="radio" >
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left" style="padding-top:1px;">
                                                                <input type="checkbox" name="startTimeRadio" onclick="clickStartTime()"/> 立即
                                                            </label>
                                                            <input type="text" id="startTime"
                                                                   name="startTime"
                                                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                                   class="form-control input-small width-200px"
                                                                   data-placement="bottom"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" style="margin-top: 10px;">
                                                    <div class="col-md-12 col-sm-12 form-group-sm">
                                                        <label for="remark" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下线时间</label>
                                                        <div class="radio" >
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left" style="padding-top:1px;">
                                                                <input type="checkbox" name="endTimeRadio" onclick="clickEndTime()"/> 立即
                                                            </label>
                                                            <input type="text" id="endTime"
                                                                   name="endTime"
                                                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                                   class="form-control input-small width-200px"
                                                                   data-placement="bottom"/>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">图片上传</label>
                                                    <div class="col-sm-4">
                                                        <input type="file" style="display:none" onchange="uploadFile(false)" id="upload" name=upload value="上传">
                                                    </div>
                                                    <div class="col-sm-8">
                                                        <input type="hidden" name="icon" id="icon" value=""/>
                                                        <input type="button" class="form-control input-small width-100px" onclick="uploadclick();" value="上传图片"/>
                                                        <input type="text" class="form-control input-small view-control" id="appFileName" name="appFileName" readonly="readonly" style="width: 70%;"
                                                               data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                        <img alt="图片预览" src="" id="pic" height="32" width="150">
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

    //上线时间
    function clickStartTime(){
        var time = getNowFormatDate();
        var isTrue = $("input[name='startTimeRadio']").is(":checked");
        if(isTrue){
            $("#startTime").attr("onClick","");
            $("#startTime").attr("readonly","readonly");
            $("#startTime").val(time);
        }else{
            $("#startTime").attr("onClick","WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})");
            $("#startTime").removeAttr("readonly");
            $("#startTime").val("");
        }
    }
    //下线时间
    function clickEndTime(){
        var time = getNowFormatDate();
        var isTrue = $("input[name='endTimeRadio']").is(":checked");
        if(isTrue){
            $("#endTime").attr("onClick","");
            $("#endTime").attr("readonly","readonly");
            $("#endTime").val(time);
        }else{
            $("#endTime").attr("onClick","WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})");
            $("#endTime").removeAttr("readonly");
            $("#endTime").val("");
        }
    }

    //获取当前时间，格式YYYY-MM-DD
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate+" 00:00:00" ;
        return currentdate;
    }


    function finalCheck(){

        if($("#functionName ").val()==""){
            Modal.alert({
                msg:"请输入功能名称！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#viewType").val()==""){
            Modal.alert({
                msg:"请选择页面类型！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#viewUrl").val()==""){
            Modal.alert({
                msg:"请输入页面地址！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#iosCheck").val()==""){
            Modal.alert({
                msg:"请选择IOS审核！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#nativeType").val()==""){
            Modal.alert({
                msg:"请选择Native类别！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#envType").val()==""){
            Modal.alert({
                msg:"请选择ENV类别！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#remark").val()==""){
            Modal.alert({
                msg:"请填写备注！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#taskAdress").val()==""){
            Modal.alert({
                msg:"请选择活动显示位置！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#functionType").val()==""){
            Modal.alert({
                msg:"请选择功能类别！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#viewType").val()==""){
            Modal.alert({
                msg:"请选择页面类型！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#startTime").val()==""){
            Modal.alert({
                msg:"请选择上线时间！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#icon").val()==""){
            Modal.alert({
                msg:"请上传图片！",
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
    function uploadclick() {
        $('#upload').click();
    }
    //执行上传图片
    function  uploadFile(isCover) {
        if($("#upload").val()==""){
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
                        $("#pic").attr('src',picUrl);
                        $("#icon").val(picUrl);
                        $("#appFileName").val(picUrl);
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
