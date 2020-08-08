<%--
  Created by IntelliJ IDEA.
  User: code_bear
  Date: 2019/8/6
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>新人活动管理</title>
    <style>
        .hrefoff{
            color: grey;
            font-size: 18px;
        }
        .hrefon{
            color: blue;
            font-size: 18px;
        }
        .td{
            vertical-align: middle;
        }
        .switch {
            position: relative;
            float: left;
            width: 90px;
            margin: 0;
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select: none;
        }

        .switch-checkbox {
            display: none;
        }

        .switch-label {
            display: block;
            overflow: hidden;
            cursor: pointer;
            border: 1px solid #999999;
            border-radius: 20px;
        }

        .switch-inner {
            display: block;
            width: 200%;
            margin-left: -100%;
            transition: margin 0.3s ease-in 0s;
        }

        .switch-inner::before, .switch-inner::after {
            display: block;
            float: right;
            width: 50%;
            height: 30px;
            padding: 0;
            line-height: 30px;
            font-size: 14px;
            color: white;
            font-family:
                    Trebuchet, Arial, sans-serif;
            font-weight: bold;
            box-sizing: border-box;
        }

        .switch-inner::after {
            content: attr(data-on);
            padding-left: 10px;
            background-color: #019FE8;
            color: #FFFFFF;
        }

        .switch-inner::before {
            content: attr(data-off);
            padding-right: 10px;
            background-color: #EEEEEE;
            color: #999999;
            text-align: right;
        }

        .switch-switch {
            position: absolute;
            display: block;
            width: 22px;
            height: 22px;
            margin: 4px;
            background: #FFFFFF;
            top: 0;
            bottom: 0;
            right: 56px;
            border: 1px solid #999999;
            border-radius: 20px;
            transition: all 0.3s ease-in 0s;
        }

        .switch-checkbox:checked + .switch-label .switch-inner {
            margin-left: 0;
        }

        .switch-checkbox:checked + .switch-label .switch-switch {
            right: 0px;
        }
    </style>

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
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">活动名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="title" id="title">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="status" id="status" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >未开始</option>
                                                            <option value="2" >进行中</option>
                                                            <option value="3" >已结束</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info btn-sm" type="button" onclick="addInfo()">
                                            <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>新增
                                        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                            <th width="10%">活动ID</th>
                                            <th width="10%">标题</th>
                                            <th width="8%">状态</th>
                                            <th width="15%">活动期限</th>
                                            <th width="10%">创建时间</th>
                                            <th width="7%">操作</th>

                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${list}">
                                            <tr>
                                                <td align="center" class="td">${list.id}</td>
                                                <td align="center" class="td">${list.title}</td>
                                                <td align="center" class="td">
                                                    <c:if test="${list.status==1}">
                                                        <span style="color: grey">未开始</span>
                                                    </c:if>
                                                    <c:if test="${list.status==2}">
                                                        <span style="color: green">进行中</span>
                                                    </c:if>
                                                    <c:if test="${list.status==3}">
                                                        <span style="color: red">已结束</span>
                                                    </c:if>
                                                </td>
                                                <td align="center" class="td">
                                                    <fmt:formatDate value="${list.promotionStartTime}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;~&nbsp;
                                                    <fmt:formatDate value="${list.promotionEndTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                                <td align="center" class="td">
                                                    <fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                                <td align="center" class="td">
                                                    <c:if test="${list.status==1}">
                                                        <c:if test="${list.enableStatus==1}">
                                                            <div class="switch">
                                                                <input class="switch-checkbox" id="enableStatus${list.no}" type="checkbox" checked onclick="changeStatus('${list.id}','${list.no}')">
                                                                <label class="switch-label" for="enableStatus${list.no}">
                                                                    <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                    <span class="switch-switch"></span>
                                                                </label>
                                                            </div>
                                                            <a id="edit${list.no}" name="edit${list.no}" class="hrefon" onclick="editInfo('${list.id}')">编辑</a>
                                                            <a id="cge${list.no}" name="cge${list.no}" class="hrefon" onclick="cge('${list.no}')">变</a>
                                                            <input hidden type="text" id="text${list.no}" name="text${list.no}" value="${list.enableStatus}">
                                                            <input hidden type="text" id="status${list.no}" name="status${list.no}" value="${list.status}">
                                                        </c:if>
                                                        <c:if test="${list.enableStatus==2}">
                                                            <div class="switch">
                                                                <input class="switch-checkbox" id="enableStatus" type="checkbox" disabled="disabled">
                                                                <label class="switch-label" for="enableStatus${list.no}">
                                                                    <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                    <span class="switch-switch"></span>
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${list.status==2}">
                                                        <c:if test="${list.enableStatus==1}">
                                                            <div class="switch">
                                                                <input class="switch-checkbox" id="enableStatus${list.no}" type="checkbox" checked onclick="changeStatus('${list.id}','${list.no}')">
                                                                <label class="switch-label" for="enableStatus${list.no}">
                                                                    <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                    <span class="switch-switch"></span>
                                                                </label>
                                                            </div>
                                                            <a id="edit${list.no}" name="edit${list.no}" class="hrefon" onclick="editInfo('${list.id}')">编辑</a>
                                                            <a id="cge${list.no}" name="cge${list.no}" class="hrefon" onclick="cge('${list.no}')">变</a>
                                                            <input hidden type="text" id="text${list.no}" name="text${list.no}" value="${list.enableStatus}">
                                                            <input hidden type="text" id="status${list.no}" name="status${list.no}" value="${list.status}">
                                                        </c:if>
                                                        <c:if test="${list.enableStatus==2}">
                                                            <div class="switch">
                                                                <input class="switch-checkbox" id="enableStatus${list.no}" type="checkbox" disabled="disabled">
                                                                <label class="switch-label" for="enableStatus${list.no}">
                                                                    <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                    <span class="switch-switch"></span>
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${list.status==3}">
                                                        <div class="switch">
                                                            <input class="switch-checkbox" id="enableStatus${list.no}" type="checkbox" disabled="disabled">
                                                            <label class="switch-label" for="enableStatus${list.no}">
                                                                <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                <span class="switch-switch"></span>
                                                            </label>
                                                        </div>
                                                    </c:if>
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

    function changeStatus(id,no) {
        Modal.confirm({
            msg: "关闭之后将无法再启用该活动，是否继续？",
            title: '提示',
            btnok: '确定',
            btncl: '取消'
        }).on(function (e) {
            if (e == true) {
                $("#edit"+no).hide();
                $("#text" + no).val(2);
                $("#enableStatus" + no).attr("disabled", true);
                statusC(id, no)
            }
        });
    }

    function cge(no) {
        $("#enableStatus" + no).prop("checked", true);
    }

    function statusC(id,no) {
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/newUserAct/changeStatus?id=' + id,
            cache:false,
            async:false,
            data : {
                enableStatus : $("#text"+no).val(),
                status : $("#status"+no).val(),
            }
        });

    }

    // 新增
    function addInfo() {
        $("#enableStatus").removeAttr("disabled");
        $("#enableStatus").attr("checked", "checked");
        $.fancybox.open({
            href: '${ctx}/mpos/newUserAct/add?',
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
