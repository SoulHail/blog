<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
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
                                    <i class="ace-icon fa fa-table"></i> 修改
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/memberAttent/update" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">展示顺序</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="sort" id="sort" value="${MposMemberMccType.sort}">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC类别名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="codeName" id="codeName" value="${MposMemberMccType.codeName}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC类别编码</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="code" id="code" value="${MposMemberMccType.code}">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="mcc" id="mcc" value="${MposMemberMccType.mcc}">
                                                    </div>
                                                </div>

                                            </div>

                                            <%--<div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">图标</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" type="file" name="icon" id="icon" value="${MposMemberMccType.icon}">
                                                    </div>
                                                </div>

                                            </div>--%>

                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">&nbsp;&nbsp;图标</label>
                                                <div class="col-sm-4  no-padding">
                                                    <input type="file" style="display:none" onchange="uploadFile()" class="form-control input-small width-200px view-control" id="upload" name=upload value="上传">
                                                </div>
                                                <div class="col-sm-8  no-padding">
                                                    <input type="button" class="form-control input-small width-100px view-control" data-placement="bottom" data-trigger="hover" data-rel="popover" onclick="uploadclick();" value="上传图片"/>
                                                    <input type="text" class="form-control input-small width-200px view-control" id="appFileName" name="appFileName" readonly="readonly"  data-placement="bottom" data-trigger="hover"  data-rel="popover"></input>
                                                    <input type="hidden" name="icon" id="icon" value="${MposMemberMccType.icon}"/>
                                                    <img alt="图片预览" src="" id="pic" height="32" width="150">
                                                </div>
                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck('${MposMemberMccType.uuid}')" >
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>保存
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
                            <%@include file="layout/pagination.jsp"%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.main-content -->
</div>


<!-- /.main-container -->
<%@include file="layout/common.js.jsp"%>
<script type="text/javascript">

    function closes(){
        parent.$.fancybox.close();
    }


    function finalCheck(uuid){

        if($("#sort").val()==""){
            Modal.alert({
                msg:"请输入展示顺序！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        } else {
            var reg=/^[1-9].*$/;
            if (!reg.test($("#sort").val())) {
                Modal.alert({
                    msg:"展示顺序只能是数字！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }
        }
        if($("#codeName").val()==""){
            Modal.alert({
                msg:"请输入MCC类别名称！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        };
        if($("#code").val()==""){
            Modal.alert({
                msg:"请输入MCC类别码！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        };
        if($("#mcc").val()==""){
            Modal.alert({
                msg:"请输入mcc！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        };
        if($("#icon").val()==""){
            Modal.alert({
                msg:"请上传图标！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        };

        f="true";

        if(f=="true"){
            sub(uuid);
        }
    }

    function sub(uuid){
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/memberAttent/updateSave?uuid' + uuid,
            cache:false,
            async:false,
            data : {
                sort : $("#sort").val(),
                code : $("#code").val(),
                codeName : $("#codeName").val(),
                mcc : $("#mcc").val(),
                icon : $("#icon").val(),
            },
            success:function(result){
                if(result){
                    Modal.alert({
                        msg:"修改成功。"
                    }).on(function(e){
                        if(e==true){
                            parent.$.fancybox.close();
                            location.reload();
                        }
                    });
                }
            }
        });
    }

    function  uploadFile() {
        $.ajaxFileUpload({
            url:'${ctx}/mpos/memberAttent/uploadFile',
            fileElementId:'upload',
            dataType: 'TEXT',
            success: function (data)
            {
                data=eval('('+$(data).text()+')');
                if (data.error && data.error == "noPic") {
                    Modal.alert({
                        msg:"只能上传图片！",
                        title: '提示',
                        btnok: '确定',
                        btncl: '取消'
                    });
                    return;
                }


                var fileName =data.fileName;
                $("#icon").val(fileName);
                $("#appFileName").val(data.name);
                //console.info(data);
                var picUrl = "${ctx}/mpos/memberAttent/getPic?fileName=" + fileName;
                $("#pic").attr('src',picUrl);

                //alert();
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        });
    }

    function uploadclick(){
        $('#upload').click();
    }

</script>
</body>
</html>