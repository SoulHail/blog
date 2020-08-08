<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>沉默商户拓展记录</title>
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
                                              action="${ctx}/mpos/silence/list" id="searchForm"
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
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">拓展时间</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">&nbsp;&nbsp;至&nbsp;&nbsp;
                                                        <input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">
                                                    </div>
                                                </div>

                                            </div>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" type="submit">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>查询
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="reset()">
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
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 检索结果
                                </h5>
                                <P id="statisticsNum" style="float: right;"></P>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding  table-responsive">
                                    <table
                                            class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="7%">序号</th>
                                            <th width="12%">商编</th>
                                            <th width="12%">归属一代机构</th>
                                            <th width="12%">直属机构</th>
                                            <th width="10%">拓展时间</th>
                                            <th width="10%">拓展结果</th>
                                            <th width="15%">失败原因</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td align="center">${status.index+1}</td>
                                                <td align="center" class="td">${list.inMno}</td>
                                                <td align="center" class="td">${list.topOrgNo}</td>
                                                <td align="center" class="td">${list.orgId}</td>
                                                <td align="center" class="td">${list.expandTime}</td>
                                                <td align="center" class="td">
                                                    <c:if test="${list.expandResult==1}">
                                                        <span style="color: green">成功</span>
                                                    </c:if>
                                                    <c:if test="${list.expandResult==2}">
                                                        <span style="color: red">失败</span>
                                                    </c:if>
                                                </td>
                                                <td align="center" class="td">${list.failReason}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
<script type="text/javascript">

</script>
</body>
</html>
