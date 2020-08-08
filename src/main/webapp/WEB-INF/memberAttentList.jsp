<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="layout/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>MPOS手刷管理平台</title>

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
                                        <form class="form-inline form-horizontal" action="/mpos" id="searchForm" method="post">
                                            <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}" />
                                            <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}">
                                            <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC类别</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="code" id="code" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >全部</option>
                                                            <c:forEach var="list" items="${list}">
                                                                <option value="${list.code}" >${list.codeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="mcc" id="mcc">
                                                    </div>
                                                </div>

                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="addInfo()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>添加MCC类别
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="reset()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>清空
                                            </button>
                                            <button class="btn btn-info btn-sm" type="submit">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>检索
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="widget-box widget-color-normal2" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 检索结果
                                </h5>
                                <P id="statisticsNum" style="float: right;"></P>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding  table-responsive">
                                    <table class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="8%">展示顺序</th>
                                            <th width="8%">MCC类别</th>
                                            <th width="15%">MCC</th>
                                            <th width="15%">图标地址</th>
                                            <th width="10%">图标</th>
                                            <th width="10%">创建时间</th>
                                            <th width="8%">操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <%--<c:forEach var="MemberMccList" items="${MemberMccList}">--%>
                                            <tr>
                                                <td align="center">啊${MemberMccList.sort}</td>
                                                <td align="center">啊${MemberMccList.code}</td>
                                                <td align="center">啊${MemberMccList.mcc}</td>
                                                <td align="center">${sessionScope.url}</td>
                                                <td align="center"><img alt="图片预览" src="${sessionScope.url}" id="pic" height="32" width="150">${MemberMccList.icon}</td>
                                                <td align="center">啊${MemberMccList.createDate}</td>
                                                <td align="center"><a onclick="updateInfo('${MemberMccList.uuid}')">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="deleteInfo('${MemberMccList.code}')">删除</a>
                                                </td>
                                            </tr>
                                        <%--</c:forEach>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row col-sm-12    ">
                        <%@include file="page.jsp" %>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.main-content -->
</div>


<!-- /.main-container -->
<%@include file="layout/common.js.jsp" %>
<script type="text/javascript">

    function addInfo() {
        $.fancybox.open({
            href: '${ctx}/mpos/memberAttent/add?',
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

    function updateInfo(uuid) {
        $.fancybox.open({
            href: '${ctx}/mpos/memberAttent/update?' + uuid,
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

    function deleteInfo(code) {
        Modal.confirm({
            msg: "你正在删除MCC类别，是否继续？",
            title: '提示',
            btnok: '确定',
            btncl: '取消'
        }).on(function (e) {
            if (e == true) {
                $.ajax({
                    type: 'post',
                    url: '${ctx}/mpos/memberAttent/delete?code=' + code,
                    cache: false,
                    dataType: 'text',
                    success: function (result) {
                        if (result==true) {
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

</script>
</body>
</html>
