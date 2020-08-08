<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>后台调整费率查询</title>
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
                                    <i class="ace-icon fa fa-table"></i> 检索条件
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/updateUserFeeInfo/list" id="searchForm"
                                              method="post">
                                            <input type="hidden" name="pageNum" id="pageNum" value="${queryItem.pageNum}" />
                                            <input type="hidden" name="pageSize" id="pageSize" value="${queryItem.pageSize}">
                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户商编</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="inMno" id="inMno" value="${queryItem.inMno}">
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建时间</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="${queryItem.startTime}">&nbsp;&nbsp;-&nbsp;&nbsp;
                                                        <input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="${queryItem.endTime}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">费率套餐</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="rateId" id="rateId" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" selected>全部</option>
                                                            <option value="1103" <c:if test="${queryItem.rateId == '1103'}">selected ="selected"</c:if>>三方：0.6+3/90天</option>
                                                            <option value="1104" <c:if test="${queryItem.rateId == '1104'}">selected ="selected"</c:if>>三方：0.55+3/90天</option>
                                                            <option value="1105" <c:if test="${queryItem.rateId == '1105'}">selected ="selected"</c:if>>三方：0.5+3/90天</option>
                                                            <option value="PB03" <c:if test="${queryItem.rateId == 'PB03'}">selected ="selected"</c:if>>二方：0.6+3/长期</option>
                                                            <option value="GOODS-INF-MPSF-CMBD" <c:if test="${queryItem.rateId == 'GOODS-INF-MPSF-CMBD'}">selected ="selected"</c:if>>二方：0.55+3/长期</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">变更来源</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="updateSource" id="updateSource" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" selected>全部</option>
                                                            <option value="1" <c:if test="${queryItem.updateSource == '1'}">selected ="selected"</c:if>>Plus预警活动</option>
                                                            <option value="2" <c:if test="${queryItem.updateSource == '2'}">selected ="selected"</c:if>>Plus沉默活动</option>
                                                            <option value="3" <c:if test="${queryItem.updateSource == '3'}">selected ="selected"</c:if>>商服-费率调整</option>
                                                            <option value="4" <c:if test="${queryItem.updateSource == '4'}">selected ="selected"</c:if>>商服-来电注销</option>
                                                            <option value="5" <c:if test="${queryItem.updateSource == '5'}">selected ="selected"</c:if>>Plus-其他</option>
                                                            <option value="6" <c:if test="${queryItem.updateSource == '6'}">selected ="selected"</c:if>>商服-其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>检索
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="resetInfo()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>重置
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <fieldset style="margin-top: 30px;">
                            <legend></legend>
                        </fieldset>

                        <div class="widget-box widget-color-normal2" style="opacity: 1;">

                            <div class="widget-body">
                                <div class="widget-main no-padding  table-responsive">

                                    <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                        <div class="widget-header">
                                            <h5 class="widget-title bigger lighter">
                                                <i class="ace-icon fa fa-table"></i> 检索结果
                                            </h5>
                                            <P id="statisticsNum" style="float: right;"></P>
                                        </div>

                                        <table
                                                class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="8%">序号</th>
                                                <th width="10%">商户商编</th>
                                                <th width="10%">创建时间</th>
                                                <th width="10%">费率套餐</th>
                                                <th width="10%">费率编号</th>
                                                <th width="10%">变更来源</th>
                                                <th width="10%">操作人</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <input type="hidden" id="dataSize" value="${list.size()}"/>
                                            <c:forEach var="list" items="${list}" varStatus="status">
                                                <tr>
                                                    <td align="center">${status.index+1}</td>
                                                    <td align="center">${list.inMno}</td>
                                                    <td align="center">${list.createTime}</td>
                                                    <td align="center">${list.rateName}</td>
                                                    <td align="center">${list.rateId}</td>
                                                    <td align="center">
                                                        <c:if test="${list.updateSource=='1'}">Plus预警活动</c:if>
                                                        <c:if test="${list.updateSource=='2'}">Plus沉默活动</c:if>
                                                        <c:if test="${list.updateSource=='3'}">商服-费率调整</c:if>
                                                        <c:if test="${list.updateSource=='4'}">商服-来电注销</c:if>
                                                        <c:if test="${list.updateSource=='5'}">Plus-其他</c:if>
                                                        <c:if test="${list.updateSource=='6'}">商服-其他</c:if>
                                                    </td>
                                                    <td align="center">${list.operator}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row col-sm-12    ">
                            <%@include file="../page.jsp" %>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.main-content -->
    </div>


    <!-- /.main-container -->
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">

        function finalCheck(){

            var startDate = new Date($("#startTime").val());
            var endDate = new Date($("#endTime").val());
            if(startDate>=endDate){
                Modal.alert({
                    msg:"结束时间应大于开始时间！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }
            sub();
        }

        function sub() {
            var inMno = $("#inMno").val();
            var rateId = $("#rateId").val();
            var updateSource = $("#updateSource").val();
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            window.location.href='${ctx}/mpos/updateUserFeeInfo/list?inMno='+inMno+'&startTime='+startTime+'&endTime='+endTime+'&rateId='+rateId+'&updateSource='+updateSource;
        }

        // 重置
        function resetInfo() {
            $("#inMno").val("");
            $("#updateSource").val("");
            $("#startTime").val("");
            $("#endTime").val("");
            $("#rateId").val("");
        }

    </script>
</body>
</html>

