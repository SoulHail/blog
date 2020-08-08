<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>受邀用户管理</title>
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
                                            <th width="5%">序号</th>
                                            <th width="10%">受邀人手机号</th>
                                            <th width="7%">受邀人激活状态</th>
                                            <th width="7%">激活日期</th>
                                            <th width="7%">受邀人归属状态</th>
                                            <th width="10%">邀请人手机号</th>
                                            <th width="7%">累计激活人数</th>
                                            <th width="7%">邀请人VIP状态</th>
                                            <th width="7%">邀请人盟友状态</th>
                                            <th width="7%">达成关卡</th>
                                            <th width="7%">套餐计时日期</th>
                                            <th width="7%">套餐生效日期</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td align="center">${status.index+1}</td>
                                                <td align="center">${list.beInvitePhone}</td>
                                                <td align="center">
                                                    <c:if test="${list.actStatus=='1'}">已激活</c:if>
                                                    <c:if test="${list.actStatus=='0'}">未激活</c:if>
                                                </td>
                                                <td align="center">${list.actDate}</td>
                                                <td align="center">
                                                    <c:if test="${list.beInviteBelong=='1'}">一致</c:if>
                                                    <c:if test="${list.beInviteBelong=='0'}">不一致</c:if>
                                                </td>
                                                <td align="center">${list.invitePhone}</td>
                                                <td align="center">${list.actNum}</td>
                                                <td align="center">
                                                    <c:if test="${list.inviteVipStatus=='1'}">激活时已生效</c:if>
                                                    <c:if test="${list.inviteVipStatus=='0'}">激活时未生效</c:if>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${list.allyStatus=='1'}">活跃</c:if>
                                                    <c:if test="${list.allyStatus=='0'}">非活跃</c:if>
                                                </td>
                                                <td align="center">${list.currentPoint}</td>
                                                <td align="center">${list.startTime}</td>
                                                <td align="center">${list.effectTime}</td>
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
