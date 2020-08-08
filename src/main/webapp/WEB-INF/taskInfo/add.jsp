<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../layout/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>随行付手刷平台</title>

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
                                    <i class="ace-icon fa fa-table"></i>任务中心添加配置
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse"
                                                                 href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal" id="addForm" method="post"
                                              enctype="multipart/form-data">

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务模块:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <select placeholder="请选择" name="moduleCode" id="moduleCode"
                                                                class="findSpace form-control" style="width: 300px">
                                                            <option value="TC_TYPE_001" selected>每日福利</option>
                                                            <option value="TC_TYPE_002">新手任务</option>
                                                            <option value="TC_TYPE_003">成长任务</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务名称:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input maxlength="20" name="taskName" id="taskName"
                                                               class="findSpace form-control" style="width: 300px"
                                                               placeholder="最多输入20个字"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <select data-placeholder="请选择" disabled name="rewardType" id="rewardType" class="chosen-select form-control " style="width: 98px">
                                                        <option value="01" <c:if test="${n.rewardType=='01'}">selected</c:if>>优惠券ID</option>
                                                        <option value="02" <c:if test="${n.rewardType=='02'}">selected</c:if>>券包ID</option>
                                                    </select>&nbsp;&nbsp;
                                                    <input name="rewardId" id="rewardId" class="findSpace form-control" style="width: 300px"/>
                                                </div>
                                                <div class="form-group" style="width: 450px" id="conditionDivId">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务条件:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <select placeholder="请选择" name="taskConditionId"
                                                                id="taskConditionId" class="findSpace form-control"
                                                                style="width: 170px">
                                                        </select>
                                                        <input type="text" name="taskConditionNum" id="taskConditionNum"
                                                               class="findSpace form-control" style="width: 50px"
                                                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                        > 张/笔/人 </input>
                                                        <input type="text" name="taskConditionMoney"
                                                               id="taskConditionMoney" class="findSpace form-control"
                                                               style="width: 50px"
                                                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                        > K </input>
                                                    </div>
                                                    <input type="hidden" id="taskCondition" name="taskCondition"/>
                                                </div>
                                            </div>
                                            <br>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励内容描述:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <input type="file" style="display:none"
                                                               onchange="rewardUploadFile(false)" id="rewardUpload"
                                                               name="upload" value="上传">
                                                    </div>

                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input type="button"
                                                               class="form-control input-small width-100px"
                                                               onclick="rewardUploadclick();" value="上传小图标"/>
                                                        <input type="text" class="form-control input-small view-control"
                                                               id="rewardFileName" name="rewardFileName" readonly
                                                               style="width: 60%;"
                                                               data-placement="bottom" data-trigger="hover"
                                                               data-rel="popover"/>
                                                    </div>
                                                    <br/>
                                                    <div class="col-sm-8">
                                                        <textarea style="height: 150px;width: 100%;margin-left: 100px"
                                                                  class="form-control" name="rewardDesc"
                                                                  id="rewardDesc"></textarea>
                                                    </div>
                                                    <input type="hidden" name="taskReward" id="taskReward"/>
                                                </div>
                                            </div>
                                            <br/>

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跳转类型:</label>
                                                    <div class="col-sm-10  no-padding" style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <div class="radio">
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="jumpCode" value="NATIVE"
                                                                       checked>本地</input>
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="jumpCode"
                                                                       value="H5">h5页面</input>
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="jumpCode"
                                                                       value="VIDEO">视频</input>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跳转链接:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input name="jumpUrl" id="jumpUrl"
                                                               class="findSpace form-control" style="width: 300px"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">循环类型:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <select placeholder="请选择" name="loopType" id="loopType"
                                                                class="findSpace form-control" style="width: 170px">
                                                            <option value="01" selected>一次性任务</option>
                                                            <option value="02">每日循环任务</option>
                                                            <option value="03">每月循环任务</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">展示进度:</label>
                                                    <div class="col-sm-10  no-padding" style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <div class="radio">
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="progressType" value="01"
                                                                       checked>是</input>
                                                            </label>
                                                        </div>

                                                        <div class="radio">
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="progressType"
                                                                       value="02">否</input>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间:</label>
                                                    <span style="color: red">*</span>
                                                    <div class="radio">
                                                        <label
                                                                class="col-sm-4 control-label  width-100px no-padding-left"
                                                                style="padding-top:1px;">
                                                            <input type="checkbox" name="starTimeRadio"
                                                                   onclick="clickSatrTime()"/> 立即
                                                        </label>
                                                        <input type="text" id="onlineTimeAdd"
                                                               name="onlineTimeAdd"
                                                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                               class="form-control input-small width-200px"
                                                               data-placement="bottom"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下线时间:</label>
                                                    <span style="color: red">*</span>
                                                    <div class="radio">
                                                        <label
                                                                class="col-sm-4 control-label  width-100px no-padding-left"
                                                                style="padding-top:1px;">
                                                            <input type="checkbox" name="endTimeRadio"
                                                                   onclick="clickEndTime()"/> 立即
                                                        </label>
                                                        <input type="text" id="offlineTimeAdd"
                                                               name="offlineTimeAdd"
                                                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                               class="form-control input-small width-200px"
                                                               data-placement="bottom"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">logo上传:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <input type="file" style="display:none"
                                                               onchange="logoUploadFile(false)" id="logoUpload"
                                                               name="upload" value="上传">
                                                    </div>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <input type="button"
                                                               class="form-control input-small width-100px"
                                                               onclick="logoUploadclick();" value="上传文件"/>
                                                        <input type="text" class="form-control input-small view-control"
                                                               id="logoUrl" name="logoUrl" readonly style="width: 60%;"
                                                               data-placement="bottom" data-trigger="hover"
                                                               data-rel="popover"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <br/>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">logo预览:</label>
                                                    <div class="col-sm-8">
                                                        <img alt="logo预览" src="" id="logoPic" height="120" width="120">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务内容描述:</label>
                                                    <div class="col-sm-8">
                                                        <textarea style="height: 150px;width: 30%" class="form-control"
                                                                  name="taskDesc" id="taskDesc"></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励弹窗描述:</label>
                                                    <div class="col-sm-8">
                                                        <textarea style="height: 150px;width: 30%" class="form-control"
                                                                  name="taskRewardDesc" id="taskRewardDesc"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">模块内排序：</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input class="findSpace form-control " style="width: 300px"
                                                               name="taskSortAdd" id="taskSortAdd"
                                                               data-placement="bottom" data-trigger="hover"
                                                               data-rel="popover"
                                                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注：</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input class="findSpace form-control " style="width: 300px"
                                                               name="remark" id="remark"
                                                               data-placement="bottom" data-trigger="hover"
                                                               data-rel="popover"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row center" style="margin-top: 3%;">
                                                <button class="btn btn-grey btn-sm" type="button" onclick="closes()">
                                                    <span class="ace-icon fa fa-backward icon-on-right bigger-110"></span>取消
                                                </button>
                                                <button id="btnSave" class="btn btn-danger btn-sm" type="button"
                                                        onclick="doSave();" style="margin-right: 1%">
                                                    <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>保存
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.main-content -->
</div>


<!-- /.main-container -->
<%@include file="../layout/common.js.jsp" %>
<script type="text/javascript">

    $(function () {
        document.getElementById("conditionDivId").style.visibility = "visible";
        var obj = document.getElementById('taskConditionId');
        obj.options.length = 0;
        obj.options.add(new Option("新增活动", "TC0009"));
    })

    $("#moduleCode").change(function () {
        $("#taskConditionNum").val("");
        $("#taskConditionMoney").val("");
        var modelCodeStr = $('#moduleCode option:selected').val();
        if (modelCodeStr == 'TC_TYPE_001') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('taskConditionId');
            obj.options.length = 0;
            obj.options.add(new Option("新增活动", "TC0009"));
        }

        //新手任务
        if (modelCodeStr == 'TC_TYPE_002') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('taskConditionId');
            obj.options.length = 0;
            obj.options.add(new Option("新增活动", "TC0009"));
            obj.options.add(new Option("完成实名认证", "TC0001"));
            obj.options.add(new Option("完成储蓄卡绑定X张", "TC0003"));
            obj.options.add(new Option("完成信用卡绑定X张", "TC0002"));
            obj.options.add(new Option("完成设备绑定", "TC0004"));
            obj.options.add(new Option("体验一次小额双免", "TC0005"));
            obj.options.add(new Option("首笔交易", "TC0010"));
            obj.options.add(new Option("观看视频", "TC0011"));
        }

        //成长任务
        if (modelCodeStr == 'TC_TYPE_003') {
            document.getElementById("conditionDivId").style.visibility = "visible";
            var obj = document.getElementById('taskConditionId');
            obj.options.length = 0;
            obj.options.add(new Option("新增活动", "TC0009"));
            obj.options.add(new Option("开通VIP", "TC0006"));
            obj.options.add(new Option("完成信用卡绑定X张", "TC0002"));
            obj.options.add(new Option("月云闪付X笔累计交易Y元", "TC0007"));
            obj.options.add(new Option("累计拉新X人", "TC0008"));
            obj.options.add(new Option("银联二维码交易X笔累计交易X元银联二维码交易X笔累计交易X元", "TC0012"));
        }
    })

    $("#taskConditionId").change(function () {
        $("#taskConditionNum").val("");
        $("#taskConditionMoney").val("");
    })

    //触发奖励上传图片按钮
    function rewardUploadclick() {
        $('#rewardUpload').click();
    }

    //奖励上传图片
    function rewardUploadFile(isCover) {
        if ($("#rewardUpload").val() == "") {
            Modal.alert({msg: "请先选择文件！"})
        } else if ($("#rewardUpload")[0].files[0].size > 20480) {
            Modal.alert({msg: "图片大小不能超过20K"})
        } else {
            $.ajaxFileUpload({
                url: '${ctx}/mpos/upload/uploadFile?isCover=' + isCover,
                fileElementId: 'rewardUpload',
                dataType: 'text',
                success: function (data) {
                    data = eval('(' + $(data).text() + ')');
                    if ("0000" == data.code) {
                        $("#rewardFileName").val(data.url);
                    } else if ("1003" == data.code) {
                        if (confirm('要覆盖此图片吗?')) {
                            rewardUploadFile(true);
                        }

                    } else {
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

    //上线时间-立即
    function clickSatrTime() {
        var time = getNowFormatDate();
        var starTimeFlag = $("input[name='starTimeRadio']").is(":checked");
        if (starTimeFlag) {
            $("#onlineTimeAdd").attr("onClick", "");
            $("#onlineTimeAdd").attr("readonly", "readonly");
            $("#onlineTimeAdd").val(time);
        } else {
            $("#onlineTimeAdd").attr("onClick", "WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})");
            $("#onlineTimeAdd").removeAttr("readonly");
            $("#onlineTimeAdd").val("");
        }
    }

    //下线时间-立即
    function clickEndTime() {
        var time = getNowFormatDate();
        var endTimeFlag = $("input[name='endTimeRadio']").is(":checked");
        if (endTimeFlag) {
            $("#offlineTimeAdd").attr("onClick", "");
            $("#offlineTimeAdd").attr("readonly", "readonly");
            $("#offlineTimeAdd").val(time);
        } else {
            $("#offlineTimeAdd").attr("onClick", "WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})");
            $("#offlineTimeAdd").removeAttr("readonly");
            $("#offlineTimeAdd").val("");
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

    $(function () {
        //禁止输入空格
        $(".findSpace").keyup(function () {
            //this.value=this.value.replace(/\s/gi,'');//去除空格
            this.value = this.value.replace(/^\s*|\s*$/g, '');//去除空格
        });

    })


    //取消操作
    function closes() {
        parent.$.fancybox.close();
    }


    //提示框封装
    function commonAlertInfo(msg) {
        Modal.alert({
            msg: msg,
            title: '提示',
            btnok: '确定',
            btncl: '取消'
        });
    }

    //触发上传logo操作按钮
    function logoUploadclick() {
        $('#logoUpload').click();
    }

    //执行上传logo图片
    function logoUploadFile(isCover) {
        if ($("#logoUpload").val() == "") {
            Modal.alert({msg: "请先选择文件！"})
        } else if ($("#logoUpload")[0].files[0].size > 20480) {
            Modal.alert({msg: "图片大小不能超过20K"})
        } else {
            $.ajaxFileUpload({
                url: '${ctx}/mpos/upload/uploadFile?isCover=' + isCover,
                fileElementId: 'logoUpload',
                dataType: 'text',
                success: function (data) {
                    data = eval('(' + $(data).text() + ')');
                    if ("0000" == data.code) {
                        var picUrl = data.url;
                        $("#logoPic").attr('src', picUrl);
                        $("#logoUrl").val(picUrl);
                    } else if ("1003" == data.code) {
                        if (confirm('要覆盖此图片吗?')) {
                            logoUploadFile(true);
                        }

                    } else {
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


    //提交表单前数据校验
    function doSave() {
        var moduleCode = $('#moduleCode').val();
        var taskName = $('#taskName').val();
        var taskConditionStr = document.getElementById('taskConditionId').value;
        var taskConditionNumStr = document.getElementById('taskConditionNum').value;
        var taskConditionMoneyStr = document.getElementById('taskConditionMoney').value;
        var jumpUrl = $('#jumpUrl').val();
        var onlineTimeAdd = $('#onlineTimeAdd').val();
        var offlineTimeAdd = $('#offlineTimeAdd').val();
        var logoUrl = $('#logoUrl').val();
        if (moduleCode == "") {
            commonAlertInfo("请选择任务模块！");
            return false;
        }
        if (taskName == "") {
            commonAlertInfo("请输入任务名称！");
            return false;
        }
        if (taskConditionStr == 'TC0001') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("实名认证 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0002') {
            if (taskConditionNumStr == "") {
                commonAlertInfo("'张/笔/人' 是必填项!");
                return false;
            }
            if (taskConditionMoneyStr != "") {
                commonAlertInfo("'K' 不需要填写该字段!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0003') {
            if (taskConditionNumStr == "") {
                commonAlertInfo("'张/笔/人' 是必填项!");
                return false;
            }
            if (taskConditionMoneyStr != "") {
                commonAlertInfo("'K' 不需要填写该字段!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0004') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("完成设备绑定 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0005') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("体验一次小额双免 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0006') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("开通VIP 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0007') {
            if (taskConditionNumStr == "" || taskConditionMoneyStr == "") {
                commonAlertInfo("'张/笔/人','K' 是必填项!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0008') {
            if (taskConditionNumStr == "") {
                commonAlertInfo("'张/笔/人' 是必填项!");
                return false;
            }
            if (taskConditionMoneyStr != "") {
                commonAlertInfo("'K' 不需要填写!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0009') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("新增活动 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0010') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("首笔交易 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0011') {
            if (taskConditionNumStr != "" || taskConditionMoneyStr != "") {
                commonAlertInfo("观看视频 不需要填写 '张/笔/人','K'!");
                return false;
            }
        }
        if (taskConditionStr == 'TC0012') {
            if (taskConditionNumStr == "" || taskConditionMoneyStr == "") {
                commonAlertInfo("'张/笔/人','K' 是必填项!");
                return false;
            }
        }
        if (jumpUrl == "") {
            commonAlertInfo("请输入跳转链接！");
            return false;
        }
        if (onlineTimeAdd == "") {
            commonAlertInfo("请输入上线时间！");
            return false;
        }
        if (offlineTimeAdd == "") {
            commonAlertInfo("请输入下线时间！");
            return false;
        }
        if (onlineTimeAdd.length > 0 && offlineTimeAdd.length > 0 && (onlineTimeAdd >= offlineTimeAdd)) {
            commonAlertInfo("上线时间不能大于下线时间!");
            return false;
        }
        if (logoUrl == "") {
            commonAlertInfo("请选择logo图片！");
            return false;
        }
        //发起提交请求
        $.ajax({
            type: 'post',
            url: '${ctx}/mpos/task/addSave',
            dataType: "json",
            data: $("#addForm").serialize(),
            success: function (json) {
                if (json.code == '500') {
                    Modal.alert({
                        msg: json.message
                    });
                    return false;
                }

                Modal.alert({
                    msg: "添加成功!"
                }).on(function (e) {
                    if (e == true) {
                        parent.$.fancybox.close();
                    }
                });
            }
        });
    }


</script>
</body>
</html>