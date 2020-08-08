<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>费率修改</title>

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
                                    <i class="ace-icon fa fa-table"></i> 费率修改
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/updateUserFee/edit" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商编</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="inMno" id="inMno">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-140px no-padding-left">费率套餐</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="rateId" id="rateId" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1103" >三方：0.6+3/90天</option>
                                                            <option value="1104" >三方：0.55+3/90天</option>
                                                            <option value="1105" >三方：0.5+3/90天</option>
                                                            <option value="PB03" >二方：0.6+3/长期</option>
                                                            <option value="GOODS-INF-MPSF-CMBD" >二方：0.55+3/长期</option>
                                                        </select>
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-140px no-padding-left">变更来源</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <select data-placeholder="请选择" name="updateSource" id="updateSource" class="chosen-select form-control " style="width: 150px">
                                                            <option value="" >请选择</option>
                                                            <option value="1" >Plus预警活动</option>
                                                            <option value="2" >Plus沉默活动</option>
                                                            <option value="3" >商服-费率调整</option>
                                                            <option value="4" >商服-来电注销</option>
                                                            <option value="5" >Plus-其他</option>
                                                            <option value="6" >商服-其他</option>
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

        if($("#inMno").val()==""){
            Modal.alert({
                msg:"商编不能为空！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#rateId").val()==""){
            Modal.alert({
                msg:"请选择费率套餐！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#updateSource").val()==""){
            Modal.alert({
                msg:"请选择变更来源！",
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
            url:'${ctx}/mpos/updateUserFee/editSave',
            cache:false,
            async:false,
            data : {
                inMno : $("#inMno").val(),
                rateId : $("#rateId").val(),
                updateSource : $("#updateSource").val(),
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
