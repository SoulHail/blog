<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-hans">
<!--<![endif]-->

<head>
    <meta charset="utf-8" />
    <title>随行付收单管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=320, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <jsp:include page="../common/resource.jsp" flush="true"/>

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

<!-- BEGIN HEADER -->
<jsp:include page="../common/header.jsp" flush="true"/>
<!-- END HEADER -->

<!-- BEGIN CONTAINER -->
<div class="clearfix"> </div>
<div class="page-container">

    <!-- BEGIN MENU -->
    <%-- <jsp:include page="../common/menu.jsp" flush="true"/> --%>
    <!-- END MENU -->

    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- 主体-->
        <!-- <div class="page-content"> -->
        <div class="">
            <!-- 右边开始 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light bordered scaffold-list">
                        <!-- 查询信息 -->
                        <div class="portlet-body form">
                            <form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
                                <div class="form-body">
                                    <div class="row norow">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-4 text-right">银行返回日期:</label>
                                                <div class="col-md-8 paddingnone">
                                                    <div class="input-group input-daterange">
                                                        <input type="text" class="form-control col-md-3" name="startDate" id="queryMecStore_startDate">
                                                        <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
                                                        <input type="text" class="form-control" name="endDate" id="queryMecStore_endDate">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="span-medium-1" class="control-label col-md-4 text-right">银行账号:</label>
                                                <div class="col-md-8 paddingnone">
                                                    <select  name="actNo"  id="queryMecStore_actNo" class="form-control bs-select" data-show-subtext="true" data-live-search="true" multiple required data-size="10">

                                                    </select>
                                                    <!-- 		                                                <input name="actNo" id="queryMecStore_actNo" class="form-control" placeholder="请输入账号"> -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="span-medium-1"
                                                       class="control-label col-md-4 text-right">真实账户:</label>
                                                <div class="col-md-8 paddingnone">
                                                    <select name="realFlg" id="queryMecStore_realFlg" class="form-control bs-select"  required data-size="10">
                                                        <option value = "">全部</option>
                                                        <option value = "00">是</option>
                                                        <option value = "01">否</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="span-medium-1"
                                                       class="control-label col-md-4 text-right">审核状态:</label>
                                                <div class="col-md-8 paddingnone">
                                                    <select name="checkStatus" id="queryMecStore_capAudSts" class="form-control bs-select"  required data-size="10">
                                                        <option value="">全部</option>
                                                        <option value="01">待提交</option>
                                                        <option value="02">待审核</option>
                                                        <option value="03">已完成</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="span-medium-1" class="control-label col-md-4 text-right">行别:</label>
                                                <div class="col-md-8 paddingnone">
                                                    <select name="bnkCd" id="bnkCd" class="form-control selectpicker" data-live-search="true" data-show-subtext="true" data-size="12">
                                                        <option value="">全部</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-offset-1 col-md-11">
                                                    <button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
                                                    <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
                                                    <button type="button" id="audit_btn" class="btn red"> <i class="fa fa-refresh"></i> 审核</button>
                                                    <button type="button" id="auditAll_btn" class="btn red"> <i class="fa fa-refresh"></i> 批量审核</button>
                                                    <button type="button" id="exportexcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 导出excel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="portlet light bordered scaffold-list">
                        <div class="portlet-title">
                            <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">资金日报信息列表</span> </div>
                            <div class="tools">
                                <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
                            </div>
                        </div>
                        <div class="portlet-body wheel"  >
                            <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
                                <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
                                    </th>
                                    <th class="nowrap"> 序号 </th>
                                    <th class="nowrap"> 银行记账日期 </th>
                                    <th class="nowrap"> 银行名称 </th>
                                    <th class="nowrap"> 银行账号 </th>
                                    <th class="nowrap"> 账户类型 </th>
                                    <th class="nowrap"> 期初余额</th>
                                    <th class="nowrap"> 收入金额 </th>
                                    <th class="nowrap"> 支出金额</th>
                                    <th class="nowrap"> 期末余额 </th>
                                    <th class="nowrap"> 存款类型</th>
                                    <th class="nowrap"> 存款利率</th>
                                    <th class="nowrap"> 利息金额</th>
                                    <th class="nowrap"> 结息日</th>
                                    <th class="nowrap"> 银行户名</th>
                                    <th class="nowrap"> 联行行号</th>
                                    <th class="nowrap"> 真实账户</th>
                                    <th class="nowrap"> 操作记录</th>
                                    <th class="nowrap"> 操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!-- 分页开始 -->
                        <div class="row no-margin" id="pagination-bar">
                            <div class="col-sm-4 left no-padding">
                                <div class="inline fl">
                                    记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span id="toalPage"></span>页 每页显示:
                                </div>
                                <div class="inline fl">
                                    <select id="limit" class=" form-control "
                                            onchange="onChange4PageSize(this)">
                                        <option value="10">10</option>
                                        <option value="20" selected="selected" >20</option>
                                        <option value="30">30</option>
                                        <option value="50">50</option>
                                        <option value="75">75</option>
                                        <option value="100">100</option>
                                        <option value="200">200</option>
                                        <option value="500">500</option>
                                    </select>
                                </div>
                                <div class="inline fl">条</div>
                            </div>

                            <div class="col-sm-6 pull-right no-padding">
                                <div id="pagination"
                                     class="dataTables_paginate paging_simple_numbers clearfix pull-right">
                                    <nobr>
                                        <ul class="pagination no-padding" style="float: left">
                                            <li class="prev "> <a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a> </li>
                                            <li class="prev "> <a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a> </li>
                                            <li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
                                            <li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
                                        </ul>
                                        <div class="input-group pull-right col-sm-2" style="float: left;">
                                            <input min="1" class="form-control p" style="height: 31px; width: 80px;" type="number">
                                            <a href="javascript:;" class="input-group-addon" onclick="javascript:pageing($('.p').val())"><i class="fa fa-mail-forward brown"></i></a>
                                        </div>
                                    </nobr>
                                </div>
                            </div>
                        </div>
                        <!-- 分页结束 -->
                        <div class="">
                            <div class="left no-padding"><span id="displaySumInfo"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!----------------------------------- 添加(修改)功能弹出页面（获取输入值的输入框后缀统一增加_SHOW标识符） ------------------------------------------>
    <div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="900px" data-height="300px">
        <div class="modal-header">
            <button type="button" class="close"
                    data-dismiss="modal" aria-hidden="true">
                &times;
            </button>
            <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
        </div>
        <div class="modal-body">
            <div class="portlet-body form">
                <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addOrUpdateform">
                    <div class="form-body">
                        <div class="row norow">
                            <input type="hidden" value = "" id = "hiddenType"/>
                            <input type="hidden" value = "" id = "hiddenUUid"/>
                            <!-- 普通输入框 -->
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-4 text-right">
                                        银行记账日期:</label>
                                    <div class="col-md-8 paddingnone">
                                        <input name="tranDt"
                                               id="TRAN_DT_SHOW" class="form-control"
                                               placeholder="银行记账日期" readonly>
                                    </div>
                                </div>
                            </div>
                            <!-- 普通输入框 -->
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-4 text-right">
                                        银行账号:</label>
                                    <div class="col-md-8 paddingnone">
                                        <input name="actNo"
                                               id="ACT_NO_SHOW" class="form-control"
                                               placeholder="银行账号" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-4 text-right">
                                        银行名称:</label>
                                    <div class="col-md-8 paddingnone">
                                        <input name="actNo"
                                               id="LBNK_NM_SHOW" class="form-control"
                                               placeholder="银行名称" readonly>
                                    </div>
                                </div>
                            </div>

                            <!-- 普通输入框 -->
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-2 text-right" style="margin-left: -6%">
                                        期初余额:</label>
                                    <div class="col-md-3 paddingnone">
                                        <input name="initialBalance"
                                               id="INITIAL_BALANCE_SHOW" class="form-control"
                                               placeholder="期初余额">
                                    </div>
                                    <div class="control-label col-md-2 text-right" style="margin-left: -3%">
                                        <span>&nbsp;上一日期末</span>
                                    </div>
                                </div>
                            </div>
                            <!-- 普通输入框 -->
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-4 text-right">
                                        收入金额:</label>
                                    <div class="col-md-8 paddingnone">
                                        <input name="creditSum"
                                               id="CREDIT_SUM_SHOW" class="form-control"
                                               placeholder="收入金额">
                                    </div>
                                </div>
                            </div>
                            <!-- 普通输入框 -->
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-4 text-right">
                                        支出金额:</label>
                                    <div class="col-md-8 paddingnone">
                                        <input name="debitSum"
                                               id="DEBIT_SUM_SHOW" class="form-control"
                                               placeholder="支出金额">
                                    </div>
                                </div>
                            </div>
                            <!-- 普通输入框 -->
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="span-medium-2"
                                           class="control-label col-md-2 text-right" style="margin-left: -6%">
                                        期末余额:</label>
                                    <div class="col-md-3 paddingnone">
                                        <input name="endBalance"
                                               id="END_BALANCE_SHOW" class="form-control"
                                               placeholder="期末余额" readonly>
                                    </div>
                                    <div class="control-label col-md-6 text-right" style="margin-left: -1%">
                                        <span>期末余额=期初余额+收入金额-支出金额,计算结果<0,则设置为0</span>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="form-actions" style="margin-top: 5%">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12" style="text-align:center;">
                                        <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
                                        <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- BEGIN FOOTER -->
<jsp:include page="../common/footer.jsp" flush="true"/>
<!-- END FOOTER -->


<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script> -->
<script type="text/javascript">

    //分页默认隐藏
    $("#pagination-bar").hide();

    //每页多少条
    var limit=0;
    //当前页
    var page=1;
    //起始条
    var start=0;
    //总页数
    var toalPage;
    //数据列表缓存
    var tableData;

    var constTotalCount = 0;

    //分页
    function pageing(opp) {
        $(window.document).scrollTop(0,500);
        limit=$("#limit  option:selected").text();

        if(opp=='pro')
        {
            if(page>1)
            {
                page=page-1;
                start=(page-1)*limit;
            }
            else
            {
                bootbox.alert('已经是第一页');
                return;
            }
        }
        else if (opp=='next')
        {
            if(page==toalPage)
            {
                bootbox.alert('已经是最后一页');
                return;
            }
            page=page+1;
            start=(page-1)*limit;
        }
        else if (opp=='last')
        {
            if (page == toalPage) {
                return;
            }
            page=$("#toalPage").text();
            if(page>toalPage)
            {
                bootbox.alert('对不起没有你要跳转的页面');
                return;
            }
            else if(page<1)
            {
                bootbox.alert('对不起没有你要跳转的页面');
                return;
            }

            start=(page-1)*limit;
        }
        else
        {
            if (page == 1 && opp == 1) {
                return;
            }

            if(opp>toalPage)
            {
                bootbox.alert('对不起没有你要跳转的页面');
                return;
            }
            else if(opp<1)
            {
                bootbox.alert('对不起没有你要跳转的页面');
                return;
            }
            page=opp*1;
            start=(page-1)*limit;
        }
        $('table > tbody').empty();
        //$("table tbody [id^='resutl_']").remove();
        reloadGrid();
    }

    //全选列表数据
    function checkAll(checked) {
        $("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }

    function onChange4PageSize(select) {
        limit = select.value;
        reloadGrid();
    }


    function audit() {
        var selectRocords = $("#queryMecGrid tbody input:checked");
        if (selectRocords.length <= 0) {
            bootbox.alert("请选择至少一条数据进行审核");
            return;
        } else {
            var uuids = '';
            for(var i=0; i<selectRocords.length; i++){
                var index = $(selectRocords[i]).attr("rownum");
                record = tableData.items[index];
                if(record.capAudSts!='00'){//待审核
                    bootbox.alert("只能选择待审核的数据");
                    return;
                }
                uuids+= ',' + record.uuid;
            }
            uuids = uuids.substr(1,uuids.length);
            bootbox.confirm("您已选中"+selectRocords.length+"数据进行审批!", function (result) {
                if(result) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "/ses/chcOrdCheck/auditCapital?uuids=" + uuids,
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            if(data.timeout){
                                ajaxTimeout();
                            }
                            bootbox.alert("审核的成功,共"+data.count+"条");
                            reloadGrid();
                        },
                        error: function(error) {
                        }
                    });
                }
            });

        }
    }

    function auditAll() {
        if (tableData.length <= 0) {
            bootbox.alert("无满足条件的记录");
            return;
        }
        bootbox.confirm("将对所有查询结果进行批量审批", function (result) {
            if(result) {
                $.ajax({
                    type: "POST",
                    url: baseURL + "/ses/chcOrdCheck/auditAll",
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    dataType: "json",
                    success: function(data) {
                        if(data.timeout){
                            ajaxTimeout();
                        }
                        bootbox.alert("批量审核的成功,共"+data.count+"条");
                        reloadGrid();
                    },
                    error: function(error) {
                    }
                });
            }
        });

    }

    //查询数据
    function reloadGrid() {
        $('table > tbody').empty();
        if(limit==0) {
            //默认20条
            limit=20;
        }
        start=(page-1)*limit;

        var bankCdArr  = $('#queryMecStore_actNo').val();
        var backDtBg = $('#queryMecStore_startDate').val().replace('/', '').replace('/', '');
        var backDtEd = $('#queryMecStore_endDate').val().replace('/', '').replace('/', '');
        var realFlg  = $('#queryMecStore_realFlg').val();
        var capAudSts  = $('#queryMecStore_capAudSts').val();
        //行别
        var bnkCd = $('#bnkCd').val();
        var bankCdArrStr = '';
        if (bankCdArr != null) {
            for (var i = 0; i<bankCdArr.length; i++) {
                if (bankCdArr[i] != null && bankCdArr[i] != '') {
                    bankCdArrStr += ',' + bankCdArr[i];
                }
            }
            bankCdArrStr = bankCdArrStr.substr(1,bankCdArrStr.length);
        }
        App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
        $.ajax({
            // http://127.0.0.1:8080/bap/posAD_Mec/index?_dc=1471942708283&page=1&start=0&limit=15
            type: "POST",
            url: baseURL + "/ses/tSesSetReportFundsDaily/query",
            data:{
                start:start,
                page:page,
                limit:limit,
                tranDtbeginDt:backDtBg,
                tranDtendDt:backDtEd,
                actNo:bankCdArrStr,
                realFlg:realFlg,
                status:capAudSts,
                bnkCd:bnkCd
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
                if(data.timeout){
                    ajaxTimeout();
                }
                constTotalCount = data.totalCount;
                toalPage=Math.ceil(data.totalCount/limit);
                $("#itemCount").text(data.totalCount);
                $("#nowpage").text(page);
                $("#toalPage").text(toalPage);
                if (!data.totalCount || data.totalCount == 0) {
                    $("#pagination-bar").hide();
                    $("#displaySumInfo").hide();
                    return;
                }
                if (toalPage < 2) {
                    $("#pagination").hide();
                } else {
                    $("#pagination").show();
                }
                tableData = $.extend(true, {}, data);//cache

                $("#queryMecGrid").DataTable().clear().draw();
                var totalBkRetNext = new Decimal("0");
                var totalAllInCome = new Decimal("0");
                var totalAllotInAmt = new Decimal("0");
                var totalRestInAmt = new Decimal("0");
                $.each(data.items, function(index, obj) {
                    var trData = [];
                    trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                    trData.push(start + index + 1);
                    trData.push(obj.tranDt);
                    trData.push(obj.lbnkNm);
                    trData.push(obj.actNo);
                    trData.push(obj.actType_NM);
                    trData.push(getThousandSeparator(obj.initialBalance));
                    trData.push(getThousandSeparator(obj.creditSum));
                    trData.push(getThousandSeparator(obj.debitSum));
                    trData.push(getThousandSeparator(obj.endBalance));
                    if(obj.depositType == 00){
                        trData.push("活期");
                    }else if(obj.depositType == 01){
                        trData.push("定期");
                    }else if(obj.depositType == 02){
                        trData.push("结构性存款");
                    }else if(obj.depositType == 03){
                        trData.push("协定存款");
                    }else if(obj.depositType == 04){
                        trData.push("其他存款");
                    }else{
                        trData.push("");
                    }
                    trData.push(getThousandSeparator(obj.depositRate));
                    trData.push(getThousandSeparator(obj.interestAmt));
                    trData.push(obj.knotRest);
                    trData.push(obj.actNm);
                    trData.push(obj.lbnkNo);
                    trData.push(obj.realFlgNm);
                    var optHis = "";
                    if (hasPermission(PERMISSSIONCONST.SES25526)) {
                        optHis = "<a href='javascript:void(0)'  onclick = optHis('" + obj.uuid + "')>查看</a>";
                    }
                    trData.push(optHis);
                    var update = "";
                    if (hasPermission(PERMISSSIONCONST.SES25522)) {
                        update = "<a href='javascript:void(0)'  onclick = update('" + obj.uuid + "')>修改</a>";
                    }
                    trData.push(update);

                    for(i=0; i < trData.length; i++){
                        if(trData[i] == undefined || trData[i] == null || trData[i]==""){
                            trData[i] = '';
                        }
                    }
                    $("#queryMecGrid").DataTable().row.add(trData).draw();
                    totalBkRetNext = totalBkRetNext.add(obj.initialBalance);
                    totalAllInCome = totalAllInCome.add(obj.creditSum);
                    totalAllotInAmt = totalAllotInAmt.add(obj.debitSum);
                    totalRestInAmt = totalRestInAmt.add(obj.endBalance);
                });
                $("#queryMecGrid").DataTable().order([1, 'asc']).draw();
                $("#pagination-bar").show();
                $("#displaySumInfo").show();
                $("#displaySumInfo").html(getSumInfo(getThousandSeparator(totalBkRetNext), getThousandSeparator(totalAllInCome),
                    getThousandSeparator(totalAllotInAmt), getThousandSeparator(totalRestInAmt)));
                if (page == 1) {
                    //first page
                    $("#pagination .prev a").css({'color':'gray','cursor':'not-allowed'});
                } else {
                    $("#pagination .prev a").css({'color':'#23527c','cursor':'pointer'});
                }
                if (page == toalPage) {
                    // last page
                    $("#pagination .next a").css({'color':'gray','cursor':'not-allowed'});
                } else {
                    $("#pagination .next a").css({'color':'#23527c','cursor':'pointer'});
                }
                //动态设置iframe高度
                //var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
                //setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
            },
            error: function(error) {
                bootbox.alert("连接超时！");
            }
        });
    }

    function update(uuid) {
        document.getElementById("hiddenType").value = "2";
        var title = document.getElementById("addOrUpdateWin_title");
        title.innerHTML = "资金日报信息修改";
        var record = {};
        record.uuid = uuid;
        addOrUpdate("update",record);
    }

    //添加或者修改方法
    function addOrUpdate(type,record){
        if("add" == type){
            $("#addOrUpdateWin").modal('show');
        }else if("update" == type){
            var param = {};
            param.uuid = record.uuid;
            $.ajax({
                type : "POST",
                url : baseURL + "/ses/tSesSetReportFundsDaily/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                    <!--修改页面展示字段-->
                    document.getElementById('TRAN_DT_SHOW').value=data.data.tranDt;
                    document.getElementById('ACT_NO_SHOW').value=data.data.actNo;
                    document.getElementById('INITIAL_BALANCE_SHOW').value=data.data.initialBalance;
                    document.getElementById('LBNK_NM_SHOW').value=data.data.lbnkNm;
                    document.getElementById('CREDIT_SUM_SHOW').value=data.data.creditSum;
                    document.getElementById('DEBIT_SUM_SHOW').value=data.data.debitSum;
                    document.getElementById('END_BALANCE_SHOW').value=data.data.endBalance;
                    document.getElementById('hiddenUUid').value=data.data.uuid;
                    $("#addOrUpdateWin").modal('show');
                },
                error:function(){
                    alert("操作失败，请重新操作！")
                }
            });
        }else{
            bootbox.alert("操作错误，请重新操作！");
            return;
        }
    }

    function getSumInfo(bkRetNext, allInCome, allotInAmt, restInAmt) {
        var info = "<font>期初余额合计:" +bkRetNext
            + "元&nbsp;&nbsp;收入金额合计:" + allInCome + "元&nbsp;&nbsp;支出金额合计:"
            + allotInAmt +"元&nbsp;&nbsp;期末余额合计:"+ restInAmt+"元</font>";
        return info;
    }
    //数字校验
    var numReg = /^\d{1,12}(\.\d{1,2})?$/;
    $(function(){

        /*初始化页面按钮权限*/
        if (!hasPermission(PERMISSSIONCONST.SES25521)) {$("#query_btn").hide();}
        if (!hasPermission(PERMISSSIONCONST.SES25524)) {$("#audit_btn").hide();}
        if (!hasPermission(PERMISSSIONCONST.SES25525)) {$("#auditAll_btn").hide();}
        if (!hasPermission(PERMISSSIONCONST.SES25523)) {$("#exportexcel_btn").hide();}

        initDefaultDate();

        bindDatabankNo('queryMecStore_actNo');

        //获取行别信息
        var param ={bnkCd:'',page:1,start:0,limit:10000};
        var getbnURL = baseURL + "/ses/payChan/queryBnkList";
        getAllSelect(getbnURL,param,"bnkCd",true,'','POST');
        //导出excel按钮
        $("#exportexcel_btn").on('click', function() {
            if(constTotalCount <= 0){
                bootbox.alert("请查询数据后再导出!");
                return;
            }

            if(constTotalCount > 300000){
                bootbox.alert("超过了30万条数据，请筛选数据!");
                return;
            }

            bootbox.confirm("共有"+constTotalCount+"条数据，确认要导出吗?", function(truthBeTold){

                if(truthBeTold){
                    window.open(baseURL+"/ses/tSesSetReportFundsDaily/export");
                }else{
                    return;
                }


            });

        });
        //查询按钮
        $("#query_btn").on('click', function() {
            page = 1;
            reloadGrid();
        });

        //重置按钮
        $("#reset_btn").on('click', function() {
            $("#queryMecPanel_Form")[0].reset();
            $('#queryMecStore_actNo').selectpicker('deselectAll');
            $("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
            $('#bnkCd').selectpicker('val', '');
            initDefaultDate();
        });

        $("#audit_btn").on('click',function(){
            //audit();
        });

        $("#auditAll_btn").on('click',function(){
            //auditAll();
        });

        //弹出页面取消按钮（添加/修改）
        $("#addform_cancel_btn").on('click',function(){
            $("#addOrUpdateWin").modal('hide');
        });

        //期初余额变化触发
        $("#INITIAL_BALANCE_SHOW").change(function () {
            var amt =  $("#INITIAL_BALANCE_SHOW").val().trim();
            if (amt == null || amt == "") {
                bootbox.alert("期初余额不能为空！");
                return;
            }
            if(!numReg.test(amt)) {
                bootbox.alert("期初余额只能为0-999999999999之间的数字!");
                return;
            }
            getEndBalance();
        });


        //收入金额变化触发
        $("#CREDIT_SUM_SHOW").change(function () {
            var amt =  $("#CREDIT_SUM_SHOW").val().trim();
            if (amt == null || amt == "") {
                bootbox.alert("收入金额不能为空！");
                return;
            }
            if(!numReg.test(amt)) {
                bootbox.alert("收入金额只能为0-999999999999之间的数字!");
                return;
            }
            getEndBalance();
        });

        //支出金额变化触发
        $("#DEBIT_SUM_SHOW").change(function () {
            var amt =  $("#DEBIT_SUM_SHOW").val().trim();
            if (amt == null || amt == "") {
                bootbox.alert("支出金额不能为空！");
                return;
            }
            if(!numReg.test(amt)) {
                bootbox.alert("支出金额只能为0-999999999999之间的数字!");
                return;
            }
            getEndBalance();
        });

    });

    //添加或修改按钮
    var param = {};
    $("#addform_save_btn").off('click').on('click', function() {
        param.tranDt = $("#TRAN_DT_SHOW").val();
        param.actNo = $("#ACT_NO_SHOW").val();
        if ($("#INITIAL_BALANCE_SHOW").val().trim() == null || $("#INITIAL_BALANCE_SHOW").val().trim() == "") {
            bootbox.alert("期初余额不能为空！");
            return;
        }
        if (!numReg.test($("#INITIAL_BALANCE_SHOW").val().trim())) {
            bootbox.alert("期初余额只能为0-999999999999之间的数字！");
            return;
        }
        param.initialBalance = $("#INITIAL_BALANCE_SHOW").val().trim();

        param.lbnkNm = $("#LBNK_NM_SHOW").val();

        if ($("#CREDIT_SUM_SHOW").val().trim() == null || $("#CREDIT_SUM_SHOW").val().trim() == "") {
            bootbox.alert("收入金额不能为空！");
            return;
        }
        if (!numReg.test($("#CREDIT_SUM_SHOW").val().trim())) {
            bootbox.alert("收入金额只能为0-999999999999之间的数字！");
            return;
        }
        param.creditSum = $("#CREDIT_SUM_SHOW").val().trim();

        if ($("#DEBIT_SUM_SHOW").val().trim() == null || $("#DEBIT_SUM_SHOW").val().trim() == "") {
            bootbox.alert("支出金额不能为空！");
            return;
        }
        if (!numReg.test($("#DEBIT_SUM_SHOW").val().trim())) {
            bootbox.alert("支出金额只能为0-999999999999之间的数字！");
            return;
        }
        param.debitSum = $("#DEBIT_SUM_SHOW").val().trim();
        param.endBalance = $("#END_BALANCE_SHOW").val().trim();
        var hiddenType = $("#hiddenType").val();
        var url = "";
        if("1" == hiddenType){
            url = baseURL + "/ses/tSesSetReportFundsDaily/save";
        }else if ("2" == hiddenType){
            url = baseURL + "/ses/tSesSetReportFundsDaily/update";
            param.uuid = $("#hiddenUUid").val();
        }else{
            url = "";
        }
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success:function(data){
                if(data.timeout){
                    ajaxTimeout();
                }
                bootbox.alert(data.msg);
                $("#addOrUpdateWin").modal('hide');
                reloadGrid();
            },
            error:function(){

            }
        });
    });

    //期末余额
    function getEndBalance() {
        var initialBalance = new Decimal($("#INITIAL_BALANCE_SHOW").val().trim());
        var creditSum = new Decimal($("#CREDIT_SUM_SHOW").val().trim());
        var debitSum = new Decimal($("#DEBIT_SUM_SHOW").val().trim());
        var endBalance = initialBalance.add(creditSum).sub(debitSum);
        document.getElementById('END_BALANCE_SHOW').value=endBalance<0 ? 0 : endBalance;
    }

    function bindDatabankNo(element,value){
        var gcdFlg = "";
        $.ajax({
            type: "GET",
            url: baseURL + "/ses/check/queryAllActNo?gfdFlg=00&gcdFlg="+gcdFlg,
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
                if(data.timeout){
                    ajaxTimeout();
                }
                $("#" + element).empty();
                $("#" + element).append($("<option></option>").val("").text("请选择"));
                $.each(data, function(index, obj) {
                    var tempName;
                    tempName = obj.cdNm;
                    $("#" + element).append($("<option></option>").val(obj.cdVl).text(tempName));
                });
                //更新内容刷新到相应的位置
                $("#" + element).selectpicker('render');
                $("#" + element).selectpicker('refresh');
            },
            error: function(error) {
            }
        });

    }


    //行业大类，商户推展类型,商户类型在码表中加载数据
    function getComboStore(element, value) {
        $.ajax({
            type: "GET",
            url: baseURL + "/code/query/typ/ACT_TYPE",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
                if(data.timeout){
                    ajaxTimeout();
                }
                $("#" + element).empty();
                $("#" + element).append($("<option></option>").val("").text("请选择..."));
                $.each(data, function(index, obj) {
                    if(obj.cdVl == value){
                        $("#" + element).append($("<option selected=\"selected\"></option>").val(obj.cdVl).text(obj.cdNm));
                    }
                    $("#" + element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                });
                //更新内容刷新到相应的位置
                $("#" + element).selectpicker('render');
                $("#" + element).selectpicker('refresh');
            },
            error: function(error) {
            }
        });
    }


    function initDefaultDate(){
        var myDate = new Date();
        myDate.setTime(myDate.getTime()-24*60*60*1000);
        var tempMonth;
        if(myDate.getMonth()<9){
            tempMonth = '0'+ (myDate.getMonth() + 1);
        }else{
            tempMonth = myDate.getMonth() + 1;
        }

        var tempDay;
        if(myDate.getDate()<=9){
            tempDay = '0'+ myDate.getDate();
        }else{
            tempDay = myDate.getDate();
        }
        var dateString = myDate.getFullYear()+"/"+tempMonth+"/"+tempDay;
        $("#queryMecStore_startDate").datepicker('update', dateString);
        $("#queryMecStore_endDate").datepicker('update', dateString);

    }

    //获取行别
    function getAllSelect(url,param,element,isItems, defaultValue,postSign){

        $.ajax({
            type: postSign,
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data:param,
            dataType: "json",
            success: function(data) {
                if(data.timeout){
                    ajaxTimeout();
                }

                $("#"+element).empty();
                if(isItems){
                    if(postSign == 'GET'){
                        $("#"+element).append($("<option></option>").val("").text("全部"));
                        $.each(data, function(index, obj) {
                            $("#"+element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                        });
                    }else{
                        $("#"+element).append($("<option></option>").val("").text("全部"));
                        $.each(data.items, function(index, obj) {
                            $("#"+element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                        });
                    }

                }else{

                    if(postSign == 'GET'){
                        $.each(data, function(index, obj) {

                            if(obj.cdVl == defaultValue){

                                $("#" + element).append($("<option selected='selected'></option>").val(obj.cdVl).text(obj.cdNm));
                            }else{
                                $("#"+element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                            }

                        });
                    }else{
                        $.each(data.items, function(index, obj) {
                            if(obj.cdVl == defaultValue){
                                $("#" + element).append($("<option selected='selected'></option>").val(obj.cdVl).text(obj.cdNm));
                            }else{
                                $("#"+element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                            }

                        });
                    }

                }

                $("#"+element).selectpicker('render');
                $("#"+element).selectpicker('refresh');

            },
            error: function(error) {
            }
        });
    }
</script>

</body>

</html>
