<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付微信平台</title>
</head>
<body class="no-skin ">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-content ">
        <div class="main-content-inner ">

            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable  ">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 历史记录
                                </h5>
                            </div>
                        </div>
                        <div class="widget-box widget-color-normal2" style="opacity: 1;">
                            <div class="widget-body">
                                <div class="widget-main no-padding table-responsive">
                                    <table class="table  table-condensed table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="10%">序号</th>
                                            <th width="10%">商户商编</th>
                                            <th width="10%">清除时间</th>
                                            <th width="10%">操作来源</th>
                                            <th width="10%">操作人</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <input type="hidden" id="dataSize" value="${list.size()}" />
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td align="center">${status.index+1}</td>
                                                <td align="center">${list.inMno}</td>
                                                <td align="center">${list.cleanTime}</td>
                                                <td align="center">
                                                    <c:if test="${list.optSource=='1'}">Plus-验证测试</c:if>
                                                    <c:if test="${list.optSource=='2'}">商服-来电注销</c:if>
                                                    <c:if test="${list.optSource=='3'}">Plus-其他</c:if>
                                                    <c:if test="${list.optSource=='4'}">商服-其他</c:if>
                                                </td>
                                                <td align="center">${list.operator}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                        <div class="row center" style="margin-top: 3%;">
                                            <button class="btn btn-grey btn-sm" type="button" onclick="closes()">
                                                <span class="ace-icon fa fa-backward icon-on-right bigger-110"></span>返回
                                            </button>
                                        </div>
                                    </div>
                                </div>
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

        function closes(){
            parent.$.fancybox.close();
        }

    </script>
</body>
</html>