<%--
  Created by IntelliJ IDEA.
  User: code_bear
  Date: 2019/8/6
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
                                    <i class="ace-icon fa fa-table"></i> 修改费率套餐配置
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/optionalWhite/add" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">套餐编码</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="feeCode" id="feeCode" value="${result.feeCode}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">套餐名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="feeName" id="feeName" value="${result.feeName}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">套餐描述</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="feeDesc" id="feeDesc" value="${result.feeDesc}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">借记卡交易手续费</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="debitRate" id="debitRate" value="${result.debitRate}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">贷记卡交易手续费</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="creditRate" id="creditRate" value="${result.creditRate}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">结算手续费</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="settleFee" id="settleFee" value="${result.settleFee}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">有效时长(天)</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="duration" id="duration" value="${result.duration}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">套餐类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String feeType = (String) session.getAttribute("feeType"); %>
                                                        <select data-placeholder="请选择" name="feeType" id="feeType" class="chosen-select form-control " style="width: 220px">
                                                            <option value="" <%="".equals(feeType)?"selected":"" %> >请选择</option>
                                                            <option value="01" <%="01".equals(feeType)?"selected":"" %> >默认</option>
                                                            <option value="02" <%="02".equals(feeType)?"selected":"" %> >普通</option>
                                                            <option value="03" <%="03".equals(feeType)?"selected":"" %> >VIP</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-120px no-padding-left">状态</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String feeStatus = (String) session.getAttribute("feeStatus"); %>
                                                        <select data-placeholder="请选择" name="feeStatus" id="feeStatus" class="chosen-select form-control " style="width: 220px">
                                                            <option value="" <%="".equals(feeStatus)?"selected":"" %> >请选择</option>
                                                            <option value="1" <%="1".equals(feeStatus)?"selected":"" %> >可用</option>
                                                            <option value="0" <%="0".equals(feeStatus)?"selected":"" %> >不可用</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck()" >
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>确定
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="closes()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>取消
                                            </button>
                                        </form>
                                    </div>
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

    function closes(){
        parent.$.fancybox.close();
    }

    function finalCheck(){

        if($("#feeCode").val()==""){
            Modal.alert({
                msg:"请输入套餐编码！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#feeName").val()==""){
            Modal.alert({
                msg:"请输入套餐名称！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#debitRate").val()==""){
            Modal.alert({
                msg:"请输入借记卡交易手续费！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#creditRate").val()==""){
            Modal.alert({
                msg:"请输入贷记卡交易手续费！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#settleFee").val()==""){
            Modal.alert({
                msg:"请输入结算手续费！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#duration").val()==""){
            Modal.alert({
                msg:"请输入有效时长！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#feeType").val()==""){
            Modal.alert({
                msg:"请选择套餐类型！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#feeStatus").val()==""){
            Modal.alert({
                msg:"请选择状态！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        f="true";

        if(f=="true"){
            sub();
        }
    }

    function sub(){
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/optionalWhite/addSave',
            cache:false,
            async:false,
            data : {
                feeCode : $("#feeCode").val(),
                feeName : $("#feeName").val(),
                feeDesc : $("#feeDesc").val(),
                debitRate : $("#debitRate").val(),
                creditRate : $("#creditRate").val(),
                settleFee : $("#settleFee").val(),
                duration : $("#duration").val(),
                feeType : $("#feeType").val(),
                feeStatus : $("#feeStatus").val(),
            },
            success:function(result){
                if(result === "success"){
                    Modal.alert({
                        msg:"修改成功。"
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

</script>
</body>
</html>
