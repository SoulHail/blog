<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>商户费率套餐管理</title>
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

                                <span class="widget-toolbar"> <a data-action="collapse"
                                                                 href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/newUserAct/list" id="searchForm"
                                              method="post">
                                            <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}" />
                                            <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}">
                                            <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}">
                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户商编</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="inMno" id="inMno">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态</label>
                                                    <select data-placeholder="请选择" name="status" id="status" class="chosen-select form-control " style="width: 150px">
                                                        <option value="" >请选择</option>
                                                        <option value="1" >生效</option>
                                                        <option value="2" >未生效</option>
                                                        <option value="3" >作废</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="phone" id="phone">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-400px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">起始时间</label>
                                                    <div class="col-sm-8  no-padding" style="width: 400px">
                                                        <input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                               value="">&nbsp;&nbsp;-&nbsp;&nbsp;
                                                        <input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                               value="">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    *商编或手机号必填*
                                                </span>
                                            </div>

                                            <%--<button class="btn btn-info btn-sm" type="button" onclick="finalCheck()" >
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>检索
                                            </button>--%>
                                            <button class="btn btn-info btn-sm" type="submit">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>检索
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="reset()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>清空检索条件
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
                                                <i class="ace-icon fa fa-table"></i> 商户当前费率
                                            </h5>
                                        </div>

                                    <table
                                            class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="15%">商户商编</th>
                                            <th width="10%">贷记卡</th>
                                            <th width="10%">借记卡</th>
                                            <th width="10%">二维码</th>
                                            <th width="10%">VIP</th>
                                            <th width="15%">VIP到期日</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td align="center">${listInfo.inMno}</td>
                                                <td align="center">${listInfo.debitRate}</td>
                                                <td align="center">${listInfo.cardRate}</td>
                                                <td align="center">${listInfo.qrRate}</td>
                                                <td align="center">
                                                    <c:if test="${listInfo.vipStatus=='020'}">是</c:if>
                                                    <c:if test="${listInfo.vipStatus=='010'}">否</c:if>
                                                </td>
                                                <td align="center">${listInfo.vipDueDate}</td>
                                            </tr>
                                        </tbody>
                                    </table>


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
                                            <th width="5%">序号</th>
                                            <th width="10%">商户商编</th>
                                            <th width="10%">费率套餐</th>
                                            <th width="7%">编号</th>
                                            <th width="7%">有效时长</th>
                                            <th width="8%">起始时间</th>
                                            <th width="8%">结束时间</th>
                                            <th width="5%">未用最优</th>
                                            <th width="5%">状态</th>
                                            <th width="8%">生成方式</th>
                                            <th width="8%">事件时间</th>
                                            <th width="8%">事件</th>
                                            <th width="8%">事件说明</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td align="center">${status.index+1}</td>
                                                <td align="center">${list.inMno}</td>
                                                <td align="center">${list.feeName}</td>
                                                <td align="center">${list.feeCode}</td>
                                                <td align="center">${list.duration}</td>
                                                <td align="center">${list.startTime}</td>
                                                <td align="center">${list.endTime}</td>
                                                <td align="center">
                                                    <c:if test="${list.unUsedBetter=='1'}">是</c:if>
                                                    <c:if test="${list.unUsedBetter=='0'}">否</c:if>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${list.status=='1'}">生效</c:if>
                                                    <c:if test="${list.status=='2'}">未生效</c:if>
                                                    <c:if test="${list.status=='3'}">作废</c:if>
                                                </td>
                                                <td align="center">${list.buildAction}</td>
                                                <td align="center">${list.eventTime}</td>
                                                <td align="center">${list.event}</td>
                                                <td align="center">${list.eventDesc}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
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
                    <div class="row col-sm-12">
                        <%@include file="../page.jsp"%>
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

</script>
</body>
</html>
