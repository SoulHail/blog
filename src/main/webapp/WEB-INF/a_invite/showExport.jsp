<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                                    <i class="ace-icon fa fa-table"></i> 受邀用户信息导出
                                </h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <%--<div class="widget-main ">--%>
                                    <form class="form-inline form-horizontal"
                                          action="${ctx}/mpos/member/exportExcel"
                                          id="createTimeForm" method="post">
                                        <div class="col-xs-12">
                                            <br>
                                            <div class="form-group form-group-sm width-300px">
                                                <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">受邀人手机号</label>
                                                <div class="col-sm-8  no-padding">
                                                    <input class="form-control input-small width-200px view-control" name="beInvitePhone" id="beInvitePhone">
                                                </div>
                                            </div>
                                            <div class="form-group form-group-sm width-300px">
                                                <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">受邀人激活状态</label>
                                                <select data-placeholder="请选择" name="actStatus" id="actStatus" class="chosen-select form-control " style="width: 150px">
                                                    <option value="" >全部</option>
                                                    <option value="1" >已激活</option>
                                                    <option value="0" >未激活</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-xs-12">
                                            <div class="form-group form-group-sm width-300px">
                                                <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邀请人手机号</label>
                                                <div class="col-sm-8  no-padding">
                                                    <input class="form-control input-small width-200px view-control" name="invitePhone" id="invitePhone">
                                                </div>
                                            </div>
                                            <div class="form-group form-group-sm width-400px">
                                                <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">受邀人激活时间</label>
                                                <div class="col-sm-8  no-padding" style="width: 400px">
                                                    <input readonly type="text" id="actStartTime" name="actStartTime" class="form-control input-small width-200px"
                                                           data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                           value="">&nbsp;&nbsp;-&nbsp;&nbsp;
                                                    <input readonly type="text" id="actEndTime" name="actEndTime" class="form-control input-small width-200px"
                                                           data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                           value="">
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-info btn-sm" type="submit">
                                            <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>导出
                                        </button>
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


<!-- /.main-container -->
<%@include file="../layout/common.js.jsp" %>
<script type="text/javascript">





    /*function exportByTime() {

        var createTime = $("#createTime").val();
        // 开始时间
        var timePeriodStart = $("#timePeriodStart").val();
        // 结束时间
        var timePeriodEnd = $("#timePeriodEnd").val();
        var start = new Date(timePeriodStart);
        var end = new Date(timePeriodEnd);
        var date3=end.getTime()-start.getTime();
        var day=Math.floor(date3/(24*3600*1000));

        if ($("input[type='checkbox']").is(':checked')) {

            if (createTime == '') {
                commonAlertInfo("请选择月份");
                return false;
            } else {
                $("#createTimeForm").submit();
                $("#btn").attr("disabled",true);
            }
        }else {
            if (timePeriodStart == '' || timePeriodEnd == '') {
                commonAlertInfo("时间不能为空");
                return false;
            }
            if (timePeriodStart.length > 0 && timePeriodEnd.length > 0 && (timePeriodStart > timePeriodEnd)) {
                commonAlertInfo("会员到期日期，开始时间不能大于结束时间!");
                return false;
            }
            if (day>180){
                commonAlertInfo("导出日期跨度不能超过180天");
                return false;
            }else {
                $("#createTimeForm").submit();
                $("#btn").attr("disabled",true);
            }
        }

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


    function isAvgMoney() {
        var avgMoney = $("avgMoney").val();
        var createTimeDiv = $("createTimeDiv").val();
        if ($("input[type='checkbox']").is(':checked')) {
            $("#createTimeDiv").show()
            $("#memberTimeDiv").attr('style','display:none')
        } else {
            $("#createTimeDiv").hide()
            $("#memberTimeDiv").show()
        }

        // if (avgMoney.prop(checked)){
        //
        // }else {
        //
        // }

    }*/

</script>
</body>
</html>