<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>费率套餐管理</title>
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
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">套餐编号</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="uuid" id="uuid">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">套餐名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="name" id="name">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">套餐类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="packageType" id="packageType" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >全部</option>
                                                            <option value="01" >默认</option>
                                                            <option value="02" >普通</option>
                                                            <option value="03" >VIP</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="status" id="status" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >全部</option>
                                                            <option value="1" >可用</option>
                                                            <option value="0" >不可用</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" type="submit">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>查询
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="reset()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>重置
                                            </button>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" id="add" type="button" onclick="addInfo()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>新增
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
                                            <th width="7%">套餐名称</th>
                                            <th width="10%">套餐描述</th>
                                            <th width="10%">套餐产品ID</th>
                                            <th width="7%">套餐产品名称</th>
                                            <th width="5%">借记卡交易手续费</th>
                                            <th width="5%">贷记卡交易手续费</th>
                                            <th width="5%">结算手续费</th>
                                            <th width="5%">有效时长</th>
                                            <th width="5%">套餐类型</th>
                                            <th width="5%">状态</th>
                                            <th width="5%">操作</th>

                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td align="center">${status.index+1}</td>
                                                <td align="center">${list.name}</td>
                                                <td align="center">${list.desc}</td>
                                                <td align="center">${list.goodsId}</td>
                                                <td align="center">${list.goodsNm}</td>
                                                <td align="center">${list.debitRate}</td>
                                                <td align="center">${list.creditRate}</td>
                                                <td align="center">${list.settleFee}</td>
                                                <td align="center">${list.duration}</td>
                                                <td align="center">
                                                    <c:if test="${list.packageType==''}">空字符串</c:if>
                                                    <c:if test="${list.packageType==null}">null</c:if>
                                                    <c:if test="${list.packageType=='01'}">默认</c:if>
                                                    <c:if test="${list.packageType=='02'}">普通</c:if>
                                                    <c:if test="${list.packageType=='03'}">VIP</c:if>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${list.status=='1'}">可用</c:if>
                                                    <c:if test="${list.status=='0'}">不可用</c:if>
                                                </td>
                                                <td align="center">
                                                    <%String userName = (String) session.getAttribute("userName"); %>
                                                    <% if("1001".equals(userName) || "1002".equals(userName) || "1003".equals(userName)) { %>
                                                    <c:if test="${list.status=='0'}">--</c:if>
                                                    <c:if test="${list.status!='0'}"><a onclick="deleteInfo('${list.uuid}')">作废</a></c:if>
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

    $(function () {
        <%String userName = (String) session.getAttribute("userName"); %>
        if (<%=!"1001".equals(userName)%> && <%=!"1002".equals(userName)%>
        && <%=!"1003".equals(userName)%> && <%=!"1004".equals(userName)%>) {
            $("#add").hide();
            $("#edit").hide();
            $("#delete").hide();
        }
    });

    // 新增
    function addInfo() {
        $.fancybox.open({
            href: '${ctx}/mpos/optionalBlack/add?',
            type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 800,
            height: 600,
            autoSize: true,
            closeClick: false,
            helpers: {
                overlay: {closeClick: false} // prevents closing when clicking OUTSIDE fancybox
            },
            afterClose: function () {
                location.reload();
            }
        });
    }

    // 删除
    function deleteInfo(uuid) {
        Modal.confirm({
            msg: "你正在删除费率套餐信息，是否继续？",
            title: '提示',
            btnok: '确定',
            btncl: '取消'
        }).on(function (e) {
            if (e == true) {
                $.ajax({
                    type: 'post',
                    url: '${ctx}/mpos/optionalBlack/delete?uuid=' + uuid,
                    cache: false,
                    dataType: 'text',
                    success: function (result) {
                        if (result==="success") {
                            Modal.alert({
                                msg: "删除成功。"
                            }).on(function (e) {
                                if (e == true) {
                                    location.reload();
                                }
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

    // 编辑
    function editInfo(id) {
        $.fancybox.open({
            href: '${ctx}/mpos/newUserAct/edit?id=' + id,
            type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 800,
            height: 600,
            autoSize: true,
            closeClick: false,
            helpers: {
                overlay: {closeClick: false} // prevents closing when clicking OUTSIDE fancybox
            },
            afterClose: function () {
                location.reload();
            }
        });
    }

</script>
</body>
</html>
