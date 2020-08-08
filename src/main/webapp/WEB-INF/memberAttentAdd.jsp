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
                                    <i class="ace-icon fa fa-table"></i> 添加
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/memberAttent/add" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">展示顺序</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="sort" id="sort">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC类别名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="codeName" id="codeName">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC类别编码</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="code" id="code">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <input class="form-control input-small width-200px view-control" name="mcc" id="mcc">
                                                    </div>
                                                </div>

                                            </div>



                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">图标</label>
                                                    <div class="col-sm-4">
                                                        <input type="file" style="display:none" onchange="uploadFile(false)" id="upload" name=upload value="上传">
                                                    </div>
                                                    <div class="col-sm-8">
                                                        <input type="hidden" name="icon" id="icon" value=""/>
                                                        <input type="button" class="form-control input-small width-100px" onclick="uploadclick();" value="上传文件"/>
                                                        <input type="text" class="form-control input-small view-control" id="appFileName" name="appFileName" readonly="readonly" style="width: 70%;" data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                        <img alt="图片预览" src="http://www.sxpmpos.com/plusImages/test/admin/344aa557-1ce2-4153-a54c-54d816363086_car.jpg" id="pic" height="32" width="150">
                                                    </div>
                                                </div>
                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck()" >
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


    function finalCheck(){

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
            sub();
        }
    }

    function sub(){
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/memberAttent/addSave',
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
                if(result === "success"){
                    Modal.alert({
                        msg:"添加成功。"
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

    //触发上传操作按钮
    function uploadclick() {
        $('#upload').click();
    }
    //执行上传图片
    function  uploadFile(isCover) {
        if($("#upload").val()==""){
            Modal.alert({msg: "请先选择文件！"})
        }else if($("#upload")[0].files[0].size > 52428800){
            Modal.alert({msg: "文件大小不能超过50M"})
        }else{
            $.ajaxFileUpload({
                url: '${ctx}/mpos/upload/uploadFile?isCover='+isCover,
                fileElementId:'upload',
                dataType: 'text',
                success: function (data)
                {
                    data=eval('('+$(data).text()+')');
                    if("0000"==data.code){
                        var fileName = $("#upload")[0].files[0].name;
                        var picUrl = data.url;
                        $("#icon").val(picUrl);
                        $("#appFileName").val(picUrl);
                        var imgUrl = "${ctx}/creditCard/getPic?fileName=" + picUrl;
                        $("#pic").attr('src',imgUrl);
                    }else if("1003"==data.code){
                        if(confirm('要覆盖此图片吗?')){
                            uploadFile(true);
                        }

                    }else{
                        Modal.alert({msg: data.message})
                    }

                    //Modal.alert({msg: fileName+" 上传成功！"})
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            });
        }
    }

</script>
</body>
</html>