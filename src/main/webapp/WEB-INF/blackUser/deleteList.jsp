<%--
  Created by IntelliJ IDEA.
  User: code_bear
  Date: 2019/8/6
  Time: 19:56
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
    <title>白名单</title>

</head>
<body class="no-skin ">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){};
    </script>

    <div class="main-content ">
        <div class="main-content-inner ">
            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i>批量删除
                                    <%-- ****************************************************标题***************************************************************************** --%>
                                </h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main " style = "padding-top: 0px">
                                        <%-- ********************************************************表单开始************************************************************************* --%>
                                        <form class="form-inline form-horizontal no-padding"
                                              role="form" method="post" action="${ctx}/mpos/optionalWhite/deleteList"
                                              enctype="multipart/form-data" id="rateAdd">
                                            <div class="col-xs-12" >
                                                <div class="tabbable" >
                                                    <ul id="myTab4"
                                                        class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                        <li class="active"><a href="#home4" data-toggle="tab" aria-expanded="true">模板下载</a></li>
                                                    </ul>

                                                    <div class="col-sm-12" >
                                                        <p class="help-block">
                                                            导入excel文件,：<a href="../../../../template/optional.xlsx">下载模板</a>
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="col-xs-12">
                                                <div class="tabbable">
                                                    <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                        <li class="active"><a href="#home4" data-toggle="tab" aria-expanded="true">模板导入</a></li>
                                                    </ul>
                                                    <div class="tab-content ">
                                                        <div class="tab-pane active no-padding" id="home4">
                                                            <div class="col-sm-12" >

                                                                <div class="form-group form-group-sm width-100 ">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-140px no-padding-left">选择文件<span style="color: red">*</span></label>
                                                                    <div class="col-sm-8  no-padding width-200px">
                                                                        <input type="file" name="excel" id="excelUpload" onchange="checkExcel()">
                                                                    </div>

                                                                </div>

                                                                <div class="form-group form-group-sm width-100 ">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-140px no-padding-left">功能</label>
                                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                                        <select data-placeholder="请选择" name="type" id="type" class="chosen-select form-control " style="width: 150px">
                                                                            <option value="" >全部</option>
                                                                            <option value="" >自选功能</option>
                                                                            <option value="" >xxx功能</option>
                                                                        </select>
                                                                    </div>

                                                                </div>

                                                                <div class="form-group form-group-sm width-100 "
                                                                     id="batnodiv" style="display: none">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-140px no-padding-left">批次号<span style="color: red">*</span></label>
                                                                    <div class="col-sm-8  no-padding width-200px">
                                                                        <input type="text" name="batno" id="batno" style="height: 30px; width: 280px;">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group form-group-sm width-100">
                                                                    <font color="red" id="uploadFont" name="uploadFont"><span
                                                                            id="uploadSpan" style="margin-left: 20%"></span></font>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-actions center widget-color-normal5">
                                                <button class="btn btn-info btn-sm" type="button" onclick="checkFile()" id="submit">
                                                    <span class="ace-icon fa fa-check icon-on-right bigger-110"></span>
                                                    确定
                                                </button>
                                                <button id="close" class="btn btn-default btn-sm" type="button" onclick="closeWin()">
                                                    <span class="ace-icon fa fa-close icon-on-right bigger-110"></span>
                                                    取消
                                                </button>
                                            </div>

                                        </form>
                                        <%-- ********************************************************表单结束************************************************************************* --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../layout/common.js.jsp"%>
<script type="text/javascript" src="${ctx }/js/jquery.form.js"></script>
<script type="text/javascript">
    $('.chosen-select').chosen({width:"100%"});
    /*******关闭弹出框*******/
    function closeWin(){
        window.parent.$.fancybox.close();
    }
    function display(id){
        var traget=document.getElementById(id);
        if(traget.style.display=="none"){
            traget.style.display="";
        }else{
            traget.style.display="none";
        }
    }
    function checkFile(){

        if(!checkExcel()){

            return false;
        }

        $('#submit').attr('disabled',"true");

        $("#rateAdd").ajaxSubmit({
            type:"post",
            success:function(obj){
                if(obj.success =='1') {
                    Modal.alert({msg: '删除成功'}).on(function(e){
                        Modal.confirm({
                            msg : "要导出删除结果吗？",
                            title : '提示',
                            btnok : '确定',
                            btncl : '取消'
                        }).on(function(e){
                            if(e==true){
                                window.location.href='${ctx}/mpos/optionalWhite/export';
                                $('#submit').removeAttr('disabled');
                            }else{
                                window.parent.location.reload();
                            }
                        })
                    });
                }else {
                    Modal.alert({msg: obj.msg});
                    $('#submit').removeAttr('disabled');
                }
            }
        });
    }

    function checkExcel(){
        //得到上传文件后缀
        var end=/\.[^\.]+$/.exec($("#excelUpload").val());
        if(end!=".xlsx"&&end!=".xls"){
            $("#uploadFont").attr("color","red");
            $("#uploadSpan").html("请选择excel文件");
            return false;
        }else{
            $("#uploadSpan").html(" ");
            return true;
        }
    }

    window.onload=function(){
        var inputs=document.getElementsByTagName("input");
        for (var i=0;i<inputs.length; i++) {
            if(inputs[i].getAttribute("type")=="text")
                inputs[i].onblur=function(){
                    this.value=this.value.replace(/\s/g,"");
                };
        }
    }
</script>
</body>
</html>
