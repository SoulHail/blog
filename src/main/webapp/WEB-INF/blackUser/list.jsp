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
    <title>白名单</title>
    <style>
        .checke{
            position: relative;
            -webkit-appearance: none;
            width:30px;
            height: 20px;
            line-height: 20px;
            background: #eee;
            border-radius: 10px;
            outline: none;
        }
        .checke:before{
            position: absolute;
            left: 0;
            content: '';
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: #eee;
            box-shadow: 0px 0px 5px #ddd;
            transition: all 0.2s linear;
        }

        .checke:checked{
            background: #0c91e5;
        }
        .checke:checked:before{
            left: 10px;
            transition: all 0.2s linear;
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
                                              action="${ctx}/mpos/optionalWhite/list" id="searchForm"
                                              method="post">
                                            <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}" />
                                            <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}">
                                            <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}">
                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户商编</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="value" id="value">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">功能</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="type" id="type" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >全部</option>
                                                            <option value="" >自选功能</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">申请时间:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input readonly type="text" id="createTimeStart" name="createTimeStart" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">&nbsp;&nbsp;至&nbsp;&nbsp;
                                                        <input readonly type="text" id="createTimeEnd" name="createTimeEnd" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="">
                                                    </div>
                                                </div>

                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="addInfo()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>新增
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="doImport()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>批量导入
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="doDelete()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>批量删除
                                            </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" type="submit">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>检索
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="reset()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>重置
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
                                    <table
                                            class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="12%">商户商编</th>
                                            <th width="12%">创建时间</th>
                                            <th width="8%">功能</th>
                                            <th width="5%">操作人</th>
                                            <th width="5%">操作</th>

                                        </tr>
                                        </thead>

                                        <tbody>
                                        <%--<c:forEach var="list" items="${list}"  varStatus="userIndex">--%>
                                            <tr>
                                                <td align="center">啊${list.value}</td>
                                                <td align="center">啊${list.createTime}</td>
                                                <td align="center">啊${list.type}</td>
                                                <td align="center">啊${list.operator}</td>
                                                <td align="center">
                                                    <input type="checkbox" class="checke">
                                                    <a href ="javascript:return false;" style="opacity: 0.2">手动</a>
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
                        <div class="col-sm-4 hidden-480 left">
                            <label class="dataTables_info " id="dynamic-table_info"
                                   role="status" aria-live="polite"></label>
                        </div>

                        <div class="col-sm-8 right">
                            <%@include file="../layout/pagination.jsp"%>
                        </div>
                    </div>
                    <div class="row col-sm-12    ">
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

    // 新增
    function addInfo() {
        $.fancybox.open({
            href: '${ctx}/mpos/optionalWhite/add?',
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

    function deleteInfo(uuid) {
        Modal.confirm({
            msg: "你正在删除白名单信息，是否继续？",
            title: '提示',
            btnok: '确定',
            btncl: '取消'
        }).on(function (e) {
            if (e == true) {
                $.ajax({
                    type: 'post',
                    url: '${ctx}/mpos/optionalWhite/delete?uuid=' + uuid,
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

    //批量导入
    function doImport() {
        $.fancybox.open({
            href: '${ctx}/mpos/optionalWhite/addList',
            type: 'iframe',
            scrolling: 'no',
            scrollOutside: false,
            model: true,
            minWidth: 400,
            height: 200,
            width: 800,
            autoHeight: true,
            autoWidth: true,
            closeBtn: true,
            padding: 5,
            afterClose: function () {
                location.reload();
            }
        });
    }

    //批量删除
    function doDelete() {
        $.fancybox.open({
            href: '${ctx}/mpos/optionalWhite/deleteList',
            type: 'iframe',
            scrolling: 'no',
            scrollOutside: false,
            model: true,
            minWidth: 400,
            height: 200,
            width: 800,
            autoHeight: true,
            autoWidth: true,
            closeBtn: true,
            padding: 5,
            afterClose: function () {
                location.reload();
            }
        });
    }

    /*//清空检索条件
    function resetMecForm(){
        $(".find").val("");

    }*/
</script>
</body>
</html>