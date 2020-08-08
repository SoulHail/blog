<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>用户信息清除</title>
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
                                              action="${ctx}/mpos/userCancel/list" id="searchForm"
                                              method="post">
                                            <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}"/>
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
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作来源</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="optSource" id="optSource" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >全部</option>
                                                            <option value="1" >Plus-验证测试</option>
                                                            <option value="2" >商服-来电注销</option>
                                                            <option value="3" >Plus-其他</option>
                                                            <option value="4" >商服-其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <br>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作时间</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input readonly type="text" id="optStartTime" name="optStartTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="${queryItem.optStartTime}">&nbsp;&nbsp;-&nbsp;&nbsp;
                                                        <input readonly type="text" id="optEndTime" name="optEndTime" class="form-control input-small width-200px"
                                                               data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})" style="width: 100px !important;"
                                                               value="${queryItem.optEndTime}">
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>检索
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="resetS()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>重置
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="batchCleanInfo()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>批量清除
                                            </button>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-info btn-sm" type="button" id="exportIt" onclick="ExportInfo()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>导出
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
                                                <i class="ace-icon fa fa-table"></i> 检索结果
                                            </h5>
                                            <P id="statisticsNum" style="float: right;"></P>
                                        </div>

                                        <table
                                                class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="8%">序号</th>
                                                <th width="10%">身份证号码</th>
                                                <th width="10%">商户商编</th>
                                                <th width="10%">商户状态</th>
                                                <th width="10%">欢乐送状态</th>
                                                <th width="10%">操作来源</th>
                                                <th width="10%">操作时间</th>
                                                <th width="10%">操作人</th>
                                                <th width="10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <input type="hidden" id="dataSize" value="${list.size()}"/>
                                            <c:forEach var="list" items="${list}" varStatus="status">
                                                <tr>
                                                    <td align="center">${status.index+1}</td>
                                                    <td align="center">${list.idCard}</td>
                                                    <td align="center">${list.inMno}</td>
                                                    <td align="center">
                                                        <c:if test="${list.userStatus=='1'}">正常</c:if>
                                                        <c:if test="${list.userStatus=='2'}">注销</c:if>
                                                        <c:if test="${list.userStatus=='3'}">冻结</c:if>
                                                        <c:if test="${list.userStatus=='4'}">异常</c:if>
                                                    </td>
                                                    <td align="center">
                                                        <c:if test="${list.hlsStatus=='00'}">开通中</c:if>
                                                        <c:if test="${list.hlsStatus=='01'}">已激活</c:if>
                                                        <c:if test="${list.hlsStatus=='02'}">已完成</c:if>
                                                        <c:if test="${list.hlsStatus=='03'}">已失效</c:if>
                                                        <c:if test="${list.hlsStatus=='04'}">已关闭</c:if>
                                                    </td>
                                                    <td align="center">
                                                        <c:if test="${list.optSource=='1'}">Plus-验证测试</c:if>
                                                        <c:if test="${list.optSource=='2'}">商服-来电注销</c:if>
                                                        <c:if test="${list.optSource=='3'}">Plus-其他</c:if>
                                                        <c:if test="${list.optSource=='4'}">商服-其他</c:if>
                                                    </td>
                                                    <td align="center">
                                                        <c:if test="${list.optTime==''}">--</c:if>
                                                        <c:if test="${list.optTime==null}">--</c:if>
                                                        <c:if test="${list.optTime!=null}">${list.optTime}</c:if>
                                                    </td>
                                                    <td align="center">${list.operator}</td>
                                                    <td align="center"><a onclick="cleanInfo('${list.inMno}')">清除</a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row col-sm-12    ">
                            <%@include file="../page.jsp" %>
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

        function finalCheck(){

            var start = $("#optStartTime").val();
            var end = $("#optEndTime").val();
            var mno = $("#inMno").val();
            var opts = $("#optSource").val();
            if (start==="" && end==="" && mno==="" && opts==="") {
                alert("检索条件不能为空");
                return;
            }
            if(start==="" && end!==""){
                alert("开始为空结束不为空-时间跨度范围不得超过一个月");
                return ;
            }
            if(end==="" && start!==""){
                alert("结束为空开始不为空-时间跨度范围不得超过一个月");
                return ;
            }
            if (start==="" && end==="") {
                sub();
                return;
            }

            var startDate = new Date($("#optStartTime").val());
            var endDate = new Date($("#optEndTime").val());
            if(startDate>=endDate){
                alert("结束时间应大于开始时间") ;
                return ;
            }
            if(endDate.getTime() - startDate.getTime() > 1000*24*60*60*30) {
                alert("都不为空-时间跨度范围不得超过一个月");
                return;
            }
            sub();
        }

        function sub() {
            alert("开始查询");
            var inMno = $("#inMno").val();
            var optSource = $("#optSource").val();
            var optStartTime = $("#optStartTime").val();
            var optEndTime = $("#optEndTime").val();
            window.location.href='${ctx}/a_export?inMno='+inMno+'&optSource='+optSource+'$optStartTime='+optStartTime+'&optEndTime='+optEndTime;
        }

        // 批量清除欢乐送&归属
        function batchCleanInfo() {
            $.fancybox.open({
                href: '${ctx}/mpos/optionalBlack/addList',
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

        function cleanInfo(inMno) {
            var source = $("#optSource").val();
            if (source==="") {
                alert("请选择操作来源");

                return;
            }
            Modal.confirm({
                msg: "您正在清除用户信息，是否继续？",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            }).on(function (e) {
                if (e == true) {
                    $.ajax({
                        type:'post',
                        url:'${ctx}/mpos/userInfoClean/cleanSave',
                        cache:false,
                        async:false,
                        data : {
                            inMno : inMno,
                            optSource : $("#optSource").val(),
                        },
                        success:function(result){
                            if(result === "1"){
                                Modal.alert({
                                    msg:"清除成功。"
                                }).on(function(e){
                                    if(e===true){
                                        parent.$.fancybox.close();
                                        location.reload();
                                    }
                                });
                            }else {
                                Modal.alert({
                                    msg:""+ result
                                });
                            }
                        }
                    });
                }
            });


        }

        // 导出
        function ExportInfo() {
            var size=$('#dataSize').val();
            if(size<=0){
                alert("不能导出空表!");
                return;
            }else{
                window.location.href='${ctx}/a_export';
            }
        }

        function resetS() {
            $("#inMno").val("");
            $("#optSource").val("");
            $("#optStartTime").val("");
            $("#optEndTime").val("");
        }

    </script>
</body>
</html>

