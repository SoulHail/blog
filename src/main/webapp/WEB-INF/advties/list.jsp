<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">页面类别</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="page" id="page" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="010" >启动页</option>
                                                            <option value="020" >弹框</option>
                                                            <option value="030" >活动广告</option>
                                                            <option value="040" >新手指引</option>
                                                            <option value="050" >BANNER</option>
                                                            <option value="060" >精选专区</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="name" id="name">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">IOS审核</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="iosAudit" id="iosAudit" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" selected>请选择</option>
                                                            <option value="0" >否</option>
                                                            <option value="1" >是</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <%--<div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">&nbsp;&nbsp;至&nbsp;&nbsp;
                                                        <input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">
                                                    </div>
                                                </div>--%>
                                                <div class="form-group form-group-sm width-400px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间</label>
                                                    <div class="col-sm-8  no-padding" style="width: 400px">
                                                        <input readonly type="text" id="startTime" name="startTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                               value="">&nbsp;&nbsp;至&nbsp;&nbsp;
                                                        <input readonly type="text" id="endTime" name="endTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                               value="">
                                                    </div>
                                                </div>

                                            </div>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info btn-sm" type="button" onclick="addInfo()">
                                            <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>新增
                                        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                            <th width="10%">页面类别</th>
                                            <th width="10%">广告名称</th>
                                            <th width="5%">页面类型</th>
                                            <th width="10%">链接地址</th>
                                            <th width="5%">IOS审核</th>
                                            <th width="8%">备注</th>
                                            <th width="8%">上线时间</th>
                                            <th width="8%">下线时间</th>
                                            <th width="8%">创建时间</th>
                                            <th width="6%">创建人</th>
                                            <th width="8%">修改时间</th>
                                            <th width="6%">修改人</th>
                                            <th width="7%">操作</th>

                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${list}">
                                            <tr>
                                                <td align="center" class="td">
                                                    <c:if test="${list.page=='010'}">
                                                        启动页
                                                    </c:if>
                                                    <c:if test="${list.page=='020'}">
                                                        弹框
                                                    </c:if>
                                                    <c:if test="${list.page=='030'}">
                                                        活动广告
                                                    </c:if>
                                                    <c:if test="${list.page=='040'}">
                                                        新手指引
                                                    </c:if>
                                                    <c:if test="${list.page=='050'}">
                                                        BANNER
                                                    </c:if>
                                                    <c:if test="${list.page=='060'}">
                                                        精选专区
                                                    </c:if>
                                                </td>
                                                <td align="center" class="td">${list.name}</td>
                                                <td align="center" class="td">
                                                    <c:if test="${list.pageType=='0'}">
                                                        H5
                                                    </c:if>
                                                    <c:if test="${list.pageType=='1'}">
                                                        Native
                                                    </c:if>
                                                </td>
                                                <td align="center" class="td">${list.adUrl}</td>
                                                <td align="center" class="td">
                                                    <c:if test="${list.iosAudit=='0'}">
                                                        否
                                                    </c:if>
                                                    <c:if test="${list.iosAudit=='1'}">
                                                        是
                                                    </c:if>
                                                </td>
                                                <td align="center" class="td">${list.remark}</td>
                                                <td align="center" class="td">
                                                    <fmt:formatDate value="${list.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                                <td align="center" class="td">
                                                    <fmt:formatDate value="${list.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                                <td align="center" class="td">
                                                    <fmt:formatDate value="${list.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                                <td align="center" class="td">${list.creater}</td>
                                                <td align="center" class="td">
                                                    <fmt:formatDate value="${list.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                                <td align="center" class="td">${list.updater}</td>
                                                <td align="center" class="td"><a onclick="deleteInfo('${list.uuid}')">删除</a></td>
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
            msg: "你正在删除广告信息，是否继续？",
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
