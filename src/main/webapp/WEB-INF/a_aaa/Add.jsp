<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>商户费率套餐信息</title>
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
                                              action="${ctx}/mpos/userRatePackage/list" id="searchForm"
                                              method="post">
                                            <input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户商编</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="inMno" id="inMno" value="${queryItem.inMno}">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态</label>
                                                    <select data-placeholder="请选择" name="sts" id="sts" class="chosen-select form-control " style="width: 150px">
                                                        <option value="" selected>请选择</option>
                                                        <option value="0" <c:if test="${queryItem.sts == '0'}">selected ="selected"</c:if>>作废</option>
                                                        <option value="1" <c:if test="${queryItem.sts == '1'}">selected ="selected"</c:if>>未生效</option>
                                                        <option value="2" <c:if test="${queryItem.sts == '2'}">selected ="selected"</c:if>>生效</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="phone" id="phone" value="${queryItem.phone}">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-400px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">起始时间</label>
                                                    <div class="col-sm-8  no-padding" style="width: 400px">
                                                        <input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                               value="${queryItem.startTime}">&nbsp;&nbsp;-&nbsp;&nbsp;
                                                        <input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                               value="${queryItem.endTime}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    *商编或手机号必填*
                                                </span>
                                            </div>

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
                                            <c:forEach var="listInfo" items="${listInfo}">
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
                                            </c:forEach>
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
                                                <th width="4%">序号</th>
                                                <th width="10%">商户商编</th>
                                                <th width="6%">费率套餐</th>
                                                <th width="5%">编号</th>
                                                <th width="7%">借记卡费率</th>
                                                <th width="7%">贷记卡费率</th>
                                                <th width="5%">有效时长</th>
                                                <th width="6%">起始时间</th>
                                                <th width="6%">结束时间</th>
                                                <th width="5%">未用最优</th>
                                                <th width="5%">状态</th>
                                                <th width="8%">生成方式</th>
                                                <th width="8%">事件时间</th>
                                                <th width="5%">事件</th>
                                                <th width="7%">事件说明</th>
                                                <th width="7%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach var="list" items="${list}" varStatus="status">
                                                <tr>
                                                    <td align="center">${status.index+1}</td>
                                                    <td align="center">${list.inMno}</td>
                                                    <td align="center">${list.ratePackageName}</td>
                                                    <td align="center">${list.ratePackageId}</td>
                                                    <td align="center">${list.debitRate}</td>
                                                    <td align="center">${list.cardRate}</td>
                                                    <td align="center">
                                                        <c:if test="${list.duration=='9999'}">长期</c:if>
                                                        <c:if test="${list.duration!='9999'}">${list.duration}</c:if>
                                                    </td>
                                                    <td align="center">${list.startTime}</td>
                                                    <td align="center">${list.endTime}</td>
                                                    <td align="center">
                                                        <c:if test="${list.secondFlag=='1'}">是</c:if>
                                                        <c:if test="${list.secondFlag=='0'}">否</c:if>
                                                    </td>
                                                    <td align="center">
                                                        <c:if test="${list.sts=='0'}">作废</c:if>
                                                        <c:if test="${list.sts=='1'}">未生效</c:if>
                                                        <c:if test="${list.sts=='2'}">生效</c:if>
                                                    </td>
                                                    <td align="center">
                                                        <c:if test="${list.source=='0'}">系统触发</c:if>
                                                        <c:if test="${list.source=='1'}">用户选择</c:if>
                                                        <c:if test="${list.source=='2'}">盟友设定</c:if>
                                                        <c:if test="${list.source=='3'}">后台设定</c:if>
                                                    </td>
                                                    <td align="center">${list.updateTime}</td>
                                                    <td align="center">
                                                        <c:if test="${list.eventType=='0'}">后台调价</c:if>
                                                        <c:if test="${list.eventType=='1'}">后台作废</c:if>
                                                        <c:if test="${list.eventType=='2'}">系统补偿</c:if>
                                                        <c:if test="${list.eventType=='3'}">系统定时作废</c:if>
                                                        <c:if test="${list.eventType=='4'}">用户装机</c:if>
                                                        <c:if test="${list.eventType=='5'}">购买会员</c:if>
                                                        <c:if test="${list.eventType=='6'}">商户拉新</c:if>
                                                        <c:if test="${list.eventType=='7'}">xlm调价</c:if>
                                                    </td>
                                                    <td align="center">${list.eventDesc}</td>
                                                    <td align="center">
                                                        <%String userName = (String) session.getAttribute("userName"); %>
                                                        <% if("T268280".equals(userName) || "T266954".equals(userName) || "T266624".equals(userName)
                                                                || "T264346".equals(userName) || "T266670".equals(userName) || "T266920".equals(userName)
                                                                || "T265441".equals(userName) || "T266893".equals(userName)) { %>
                                                        <c:if test="${list.sts=='0'}">--</c:if>
                                                        <c:if test="${list.sts!='0'}"><a onclick="deleteInfo('${list.uuid}')">作废</a></c:if>
                                                        <% } %>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row col-sm-12    ">
                            <div class="col-sm-4 hidden-480 left">
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
    <script type="text/javascript">

        // 作废
        function deleteInfo(uuid) {
            Modal.confirm({
                msg: "您正在作废商户费率套餐信息，是否继续？",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            }).on(function (e) {
                if (e == true) {
                    $.ajax({
                        type: 'post',
                        url: '${ctx}/mpos/userRatePackage/delete?uuid=' + uuid,
                        cache: false,
                        dataType: 'text',
                        success: function (result) {
                            if (result==="success") {
                                Modal.alert({
                                    msg: "作废成功。"
                                }).on(function (e) {
                                    if (e == true) {
                                        location.reload();
                                    }
                                });
                            } else {
                                Modal.alert({
                                    msg:""+ result
                                });
                            }
                        },
                        error: function () {
                            Modal.alert({
                                msg: "系统错误，请重试。"
                            })
                        }

                    });
                }
            });


        }

    </script>
</body>
</html>

