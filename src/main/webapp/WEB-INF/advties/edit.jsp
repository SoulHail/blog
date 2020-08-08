<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>广告管理</title>
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
                                    <i class="ace-icon fa fa-table"></i> 修改
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">

                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/advties/edit" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">页面类别</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String pagee = (String) session.getAttribute("page"); %>
                                                        <select data-placeholder="请选择" name="page" id="page" class="chosen-select form-control " style="width: 150px">
                                                            <option value="page_h5_0001" <%="page_h5_0001".equals(pagee)?"selected":"" %> >签购单</option>
                                                            <option value="page_app_0001" <%="page_app_0001".equals(pagee)?"selected":"" %>>启屏页</option>
                                                            <option value="page_app_0002" <%="page_app_0002".equals(pagee)?"selected":"" %>>首页</option>
                                                            <option value="page_app_0003" <%="page_app_0003".equals(pagee)?"selected":"" %>>交易成功页面</option>
                                                            <option value="page_app_0004" <%="page_app_0004".equals(pagee)?"selected":"" %>>交易失败页面</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">页面类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String pageType = (String) session.getAttribute("pageType"); %>
                                                        <select data-placeholder="请选择" name="pageType" id="pageType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" <%="".equals(pageType)?"selected":"" %> >请选择</option>
                                                            <option value="0" <%="0".equals(pageType)?"selected":"" %> >H5</option>
                                                            <option value="1" <%="1".equals(pageType)?"selected":"" %> >Native</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告编码</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="code" id="code" value="${result.code}">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="name" id="name" value="${result.name}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告图标地址</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="iconUrl" id="iconUrl" value="${result.iconUrl}">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告链接地址</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="adUrl" id="adUrl" value="${result.adUrl}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px" id="conditionDivId">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">展示位置</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String location = (String) session.getAttribute("location"); %>
                                                        <select data-placeholder="请选择" name="location" id="location" class="chosen-select form-control " style="width: 150px">
                                                            <input type="hidden" name="conOptId" id="conOptId" value="${result.location}" />
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">链接Native页</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="nativePageName" id="nativePageName" value="${result.nativePageName}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">IOS审核</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String iosAudit = (String) session.getAttribute("iosAudit"); %>
                                                        <select data-placeholder="请选择" name="iosAudit" id="iosAudit" class="chosen-select form-control " style="width: 150px">
                                                            <option value="0" <%="0".equals(iosAudit)?"selected":"" %> >否</option>
                                                            <option value="1" <%="1".equals(iosAudit)?"selected":"" %> >是</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">登录验证</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String isLogin = (String) session.getAttribute("isLogin"); %>
                                                        <select data-placeholder="请选择" name="isLogin" id="isLogin" class="chosen-select form-control " style="width: 150px">
                                                            <option value="1" <%="1".equals(isLogin)?"selected":"" %> >需要</option>
                                                            <option value="0" <%="0".equals(isLogin)?"selected":"" %> >不需要</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">业务验证</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String businessVerify = (String) session.getAttribute("businessVerify"); %>
                                                        <select data-placeholder="请选择" name="businessVerify" id="businessVerify" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" <%="".equals(businessVerify)?"selected":"" %> >请选择</option>
                                                            <option value="01" <%="01".equals(businessVerify)?"selected":"" %> >绑卡</option>
                                                            <option value="02" <%="02".equals(businessVerify)?"selected":"" %> >绑设备</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否有效</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String valid = (String) session.getAttribute("valid"); %>
                                                        <select data-placeholder="请选择" name="valid" id="valid" class="chosen-select form-control " style="width: 150px">
                                                            <option value="1" <%="1".equals(valid)?"selected":"" %> >有效</option>
                                                            <option value="0" <%="0".equals(valid)?"selected":"" %> >无效</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">排序</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="sort" id="sort" value="${result.sort}">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="remark" id="remark" value="${result.remark}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间:</label>
                                                    <span style="color: red">*</span>
                                                    <div class="radio">
                                                        <label class="col-sm-4 control-label  width-100px no-padding-left" style="padding-top:1px;">
                                                            <input type="checkbox" name="starTimeRadio" onclick="clickSatrTime()"/> 立即
                                                        </label>
                                                        <input type="text" id="startTime"
                                                               name="startTime" readonly value="<fmt:formatDate value="${result.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />"
                                                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                               class="form-control input-small width-200px"
                                                               data-placement="bottom"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下线时间:</label>
                                                    <span style="color: red">*</span>
                                                    <div class="radio">
                                                        <label class="col-sm-4 control-label  width-100px no-padding-left" style="padding-top:1px;">
                                                            <input type="checkbox" name="endTimeRadio" onclick="clickEndTime()"/> 立即
                                                        </label>
                                                        <input type="text" id="endTime"
                                                               name="endTime" readonly value="<fmt:formatDate value="${result.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />"
                                                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                               class="form-control input-small width-200px"
                                                               data-placement="bottom"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck('${result.uuid}')" >
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

    $(function(){
        var modelCodeStr = $('#page option:selected') .val();
        //签购单
        if(modelCodeStr=='page_h5_0001'){
            document.getElementById("conditionDivId").style.visibility="visible";
            var obj=document.getElementById('location');
            obj.options.length=0;
            obj.options.add(new Option("顶部","loc_top_0001"));
            var conOptIdContent = document.getElementById("conOptId").value;
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].value == conOptIdContent) {
                    obj[i].selected = true;  //相等则选中
                }
            }
        }
        //启屏页
        if(modelCodeStr=='page_app_0001'){
            document.getElementById("conditionDivId").style.visibility="visible";
            var obj=document.getElementById('location');
            obj.options.length=0;
            obj.options.add(new Option("启屏页广告","loc_launch"));
            var conOptIdContent = document.getElementById("conOptId").value;
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].value == conOptIdContent) {
                    obj[i].selected = true;  //相等则选中
                }
            }
        }

        //首页
        if(modelCodeStr=='page_app_0002'){
            document.getElementById("conditionDivId").style.visibility="visible";
            var obj=document.getElementById('location');
            obj.options.length=0;
            obj.options.add(new Option("功能-左广告","loc_fun_left"));
            obj.options.add(new Option("功能-右广告","loc_fun_right"));
            obj.options.add(new Option("BANNER广告","loc_banner"));
            obj.options.add(new Option("精选广告","loc_choiceness"));
            obj.options.add(new Option("悬浮广告","loc_float"));
            obj.options.add(new Option("弹窗广告", "loc_pop"));
            var conOptIdContent = document.getElementById("conOptId").value;
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].value == conOptIdContent) {
                    obj[i].selected = true;  //相等则选中
                }
            }
        }

        //交易成功页
        if(modelCodeStr=='page_app_0003'){
            document.getElementById("conditionDivId").style.visibility="visible";
            var obj=document.getElementById('location');
            obj.options.length=0;
            obj.options.add(new Option("左广告","loc_suc_left"));
            obj.options.add(new Option("右广告","loc_suc_right"));
            obj.options.add(new Option("中广告","loc_suc_middle"));
            obj.options.add(new Option("下1广告","loc_suc_buttom_001"));
            obj.options.add(new Option("下2广告","loc_suc_buttom_002"));
            var conOptIdContent = document.getElementById("conOptId").value;
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].value == conOptIdContent) {
                    obj[i].selected = true;  //相等则选中
                }
            }
        }

        //交易失败页
        if(modelCodeStr=='page_app_0004'){
            document.getElementById("conditionDivId").style.visibility="visible";
            var obj=document.getElementById('location');
            obj.options.length=0;
            obj.options.add(new Option("左广告","loc_fail_left"));
            obj.options.add(new Option("右广告","loc_fail_right"));
            obj.options.add(new Option("中广告","loc_fail_middle"));
            obj.options.add(new Option("下1广告","loc_fail_buttom_001"));
            obj.options.add(new Option("下2广告","loc_fail_buttom_002"));
            var conOptIdContent = document.getElementById("conOptId").value;
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].value == conOptIdContent) {
                    obj[i].selected = true;  //相等则选中
                }
            }
        }
    })

    $("#page").change(function(){
        var modelCodeStr = $('#page option:selected') .val();
        if(modelCodeStr=='page_h5_0001'){
            document.getElementById("conditionDivId").style.visibility="visible";
            var obj=document.getElementById('location');
            obj.options.length=0;
            obj.options.add(new Option("顶部","loc_top_0001"));
        }

        //启屏页
        if (modelCodeStr == 'page_app_0001') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('location');
            obj.options.length = 0;
            obj.options.add(new Option("启屏页广告", "loc_launch"));
        }

        //首页
        if (modelCodeStr == 'page_app_0002') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('location');
            obj.options.length = 0;
            obj.options.add(new Option("功能-左广告", "loc_fun_left"));
            obj.options.add(new Option("功能-右广告", "loc_fun_right"));
            obj.options.add(new Option("BANNER广告", "loc_banner"));
            obj.options.add(new Option("精选广告", "loc_choiceness"));
            obj.options.add(new Option("悬浮广告", "loc_float"));
            obj.options.add(new Option("弹窗广告", "loc_pop"));
        }

        //交易成功页
        if (modelCodeStr == 'page_app_0003') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('location');
            obj.options.length = 0;
            obj.options.add(new Option("左广告", "loc_suc_left"));
            obj.options.add(new Option("右广告", "loc_suc_right"));
            obj.options.add(new Option("中广告", "loc_suc_middle"));
            obj.options.add(new Option("下1广告", "loc_suc_buttom_001"));
            obj.options.add(new Option("下2广告", "loc_suc_buttom_002"));
        }

        //交易失败页
        if (modelCodeStr == 'page_app_0004') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('location');
            obj.options.length = 0;
            obj.options.add(new Option("左广告", "loc_fail_left"));
            obj.options.add(new Option("右广告", "loc_fail_right"));
            obj.options.add(new Option("中广告", "loc_fail_middle"));
            obj.options.add(new Option("下1广告", "loc_fail_buttom_001"));
            obj.options.add(new Option("下2广告", "loc_fail_buttom_002"));
        }
    })

    function finalCheck(uuid){

        if($("#page").val()==""){
            Modal.alert({
                msg:"请选择页面类别！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#code").val().trim()==""){
            alert("请填写广告编码")
            Modal.alert({
                msg:"请填写广告编码！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#name").val().trim()==""){
            Modal.alert({
                msg:"请填写广告名称！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#pageType").val()==""){
            Modal.alert({
                msg:"请选择页面类型！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#iconUrl").val().trim()==""){
            Modal.alert({
                msg:"请填写广告图标地址！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#adUrl").val().trim()==""){
            Modal.alert({
                msg:"请填写广告链接地址！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#location").val()==""){
            Modal.alert({
                msg:"请选择展示位置！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#iosAudit").val()==""){
            Modal.alert({
                msg:"请选择是否进行IOS审核！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#businessVerify").val()==""){
            Modal.alert({
                msg:"请选择是否进行业务验证！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }


        f="true";

        if(f=="true"){
            sub(uuid);
        }
    }

    function sub(uuid){
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/advties/editSave?uuid=' + uuid,
            cache:false,
            async:false,
            data : {
                page : $("#page").val(),
                pageType : $("#pageType").val(),
                code : $("#code").val(),
                name : $("#name").val().trim(),
                iconUrl : $("#iconUrl").val(),
                adUrl : $("#adUrl").val(),
                location : $("#location").val(),
                nativePageName : $("#nativePageName").val(),
                iosAudit : $("#iosAudit").val(),
                isLogin : $("#isLogin").val(),
                businessVerify : $("#businessVerify").val(),
                valid : $("#valid").val(),
                sort : $("#sort").val().trim(),
                remark : $("#remark").val().trim(),
                startTime : $("#startTime").val(),
                endTime : $("#endTime").val()
            },
            success:function(result){
                if(result === "success"){
                    Modal.alert({
                        msg:"修改成功。"
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

    //上线时间-立即
    function clickSatrTime() {
        var time = getNowFormatDate();
        var starTimeFlag = $("input[name='starTimeRadio']").is(":checked");
        if (starTimeFlag) {
            $("#startTime").attr("onClick", "");
            $("#startTime").attr("readonly", "readonly");
            $("#startTime").val(time);
        } else {
            $("#startTime").attr("onClick", "WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})");
            $("#startTime").removeAttr("readonly");
            $("#startTime").val("");
        }
    }

    //下线时间-立即
    function clickEndTime() {
        var time = getNowFormatDate();
        var endTimeFlag = $("input[name='endTimeRadio']").is(":checked");
        if (endTimeFlag) {
            $("#endTime").attr("onClick", "");
            $("#endTime").attr("readonly", "readonly");
            $("#endTime").val(time);
        } else {
            $("#endTime").attr("onClick", "WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})");
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
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var millis = date.getSeconds();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 1 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        if (hours >= 0 && hours <= 9) {
            hours = "0" + hours;
        }
        if (minutes >= 0 && minutes <= 9) {
            minutes = "0" + minutes;
        }
        if (millis >= 0 && millis <= 9) {
            millis = "0" + millis;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate + " " + hours + ":" + minutes + ":" + millis;
        return currentdate;
    }

</script>
</body>
</html>