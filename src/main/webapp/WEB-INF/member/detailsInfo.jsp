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
                                    <i class="ace-icon fa fa-table"></i> 查看购买会员记录
                                </h5>
                                <!-- <span class="widget-toolbar">
                                    <a data-action="collapse" href="#">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </span> -->
                            </div>
                        </div>
                        <div class="widget-box widget-color-normal2" style="opacity: 1;">
                            <div class="widget-body">
                                <div class="widget-main no-padding table-responsive">
                                    <table class="table  table-condensed table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="10%">uuid</th>
                                            <th width="10%">关卡编码</th>
                                            <th width="10%">关卡名称</th>
                                            <th width="10%">关卡等级</th>
                                            <th width="20%">邀新人数</th>
                                            <th width="10%">奖励编码</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <input type="hidden" id="dataSize" value="${listData.size()}" />
                                        <c:forEach var="listData" items="${listData}" >
                                            <tr>
                                                <td align="center">${listData.uuid}</td>
                                                <td align="center">${listData.pointCode}</td>
                                                <td align="center">${listData.pointName}</td>
                                                <td align="center">${listData.pointLevel}</td>
                                                <td align="center">${listData.pointNum}</td>
                                                <td align="center">${listData.feeCode}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <%-- 分界线 --%>
                                    <%--<div class="col-xs-12">

                                        <div class="form-group form-group-sm width-1000px">
                                            <fieldset style="margin-top: 30px;">
                                                <legend></legend>
                                            </fieldset>
                                        </div>

                                    </div>--%>

                                    <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                        <div class="widget-header">
                                            <h5 class="widget-title bigger lighter">
                                                <i class="ace-icon fa fa-table"></i> 体验卡
                                            </h5>
                                            <!-- <span class="widget-toolbar">
                                                <a data-action="collapse" href="#">
                                                    <i class="ace-icon fa fa-chevron-up"></i>
                                                </a>
                                            </span> -->
                                        </div>
                                    </div>

                                    <table class="table  table-condensed table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                        <thead class="thin-border-bottom">
                                        <tr>
                                            <th width="7%">uuid</th>
                                            <th width="7%">费率套餐名称</th>
                                            <th width="7%">费率套餐描述</th>
                                            <th width="7%">套餐产品ID</th>
                                            <th width="7%">套餐产品名称</th>
                                            <th width="7%">借记卡交易手续费</th>
                                            <th width="7%">贷记卡交易手续费</th>
                                            <th width="7%">结算手续费</th>
                                            <th width="7%">有效时长</th>
                                            <th width="7%">套餐类型</th>
                                            <th width="7%">状态</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <input type="hidden" id="dataSize" value="${list.size()}" />
                                        <c:forEach var="list" items="${list}" >
                                            <tr>
                                                <td align="center">${list.uuid}</td>
                                                <td align="center">${list.name}</td>
                                                <td align="center">${list.desc}</td>
                                                <td align="center">${list.goodsId}</td>
                                                <td align="center">${list.goodsNm}</td>
                                                <td align="center">${list.debitRate}</td>
                                                <td align="center">${list.creditRate}</td>
                                                <td align="center">${list.settleFee}</td>
                                                <td align="center">${list.duration}</td>
                                                <td align="center">${list.packageType}</td>
                                                <td align="center">${list.status}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
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