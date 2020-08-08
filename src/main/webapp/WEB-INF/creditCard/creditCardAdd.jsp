<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付手刷平台</title>

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
										<i class="ace-icon fa fa-table"></i> 信用卡信息
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="form" class="form-inline form-horizontal">
												<div class="col-xs-12">
													<div class="tabbable">
														<ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
															<li class="active"><a href="#home4" data-toggle="tab" aria-expanded="true">基本信息</a></li>
														</ul>
														<div class="tab-content ">
															<div class="tab-pane active no-padding" id="home4">
																<div class="col-sm-12">
																
																	<input type="hidden" name="uuid" id="uuid" value="${creditCard.uuid }"/>
																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">显示位置:</label>

																		<div class="col-sm-8  no-padding">
																			<input class="form-control input-small width-200px view-control" id="positionNo" name="positionNo" value="${creditCard.positionNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"></input>
																		</div>
																	</div>
																	<br>

																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">名称:</label>

																		<div class="col-sm-8  no-padding">
																			<input class="form-control input-small width-200px view-control" id="bankName" name="bankName" value="${creditCard.bankName }" data-placement="bottom" data-trigger="hover" data-rel="popover"></input>
																		</div>
																	</div>
																	<br>

																	<div class="col-sm-16">
			                                                           <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">图片上传:</label>
			                                                            <div class="col-sm-4  no-padding">
																		<input type="file" style="display:none" onchange="uploadFile()" class="form-control input-small width-200px view-control" id="upload" name=upload value="上传">
			                                                            </div>
			                                                           <div class="col-sm-8  no-padding">
			                                                           <input type="button" class="form-control input-small width-100px view-control" data-placement="bottom" data-trigger="hover" data-rel="popover" onclick="uploadclick();" value="上传图片"/>
			                                                           <input type="text" class="form-control input-small width-200px view-control" id="appFileName" name="appFileName" readonly="readonly"  data-placement="bottom" data-trigger="hover"  data-rel="popover"></input>
			                                                           <input type="hidden" name="imgUrl" id="imgUrl" value="${creditCard.imgUrl }"/>
			                                                           <img alt="图片预览" src="" id="pic" height="32" width="150">
			                                                          </div>
			                                                   		</div>
																	<br>

																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">URL地址:</label>

																		<div class="col-sm-8  no-padding">
																			<input class="form-control input-small width-200px view-control" name="pageUrl" id="pageUrl" value="${creditCard.pageUrl }" data-placement="bottom" data-trigger="hover" data-rel="popover"></input>
																		</div>
																	</div>


																</div>
															</div>
														</div>
													</div>
												</div>

												<div style="text-align: center;">
												 	<button class="btn btn-info btn-sm" type="button" name="submit-save" onclick="finalCheck('save')">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        	保存
                                                    </button>
                                                    <button class="btn btn-info btn-sm" type="button" name="submit-release" onclick="finalCheck('release')">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        	发布
                                                    </button>
												 	<button id="close" class="btn btn-sm" type="button" onclick="javascript:parent.$.fancybox.close();location.reload();">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        	关闭
                                                    </button>
												</div>
												
											</form>
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
	$('.chosen-select').chosen({});
	
	function uploadclick(){
		$('#upload').click();
	}
	
	function  uploadFile() {
		$.ajaxFileUpload({
			url:'${ctx}/creditCard/uploadFile',
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
				$("#imgUrl").val(fileName);
				$("#appFileName").val(data.name);
				//console.info(data);
				var picUrl = "${ctx}/creditCard/getPic?fileName=" + fileName;
				$("#pic").attr('src',picUrl); 
				
				//alert();
			},
			error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
		});
	}
	
	function finalCheck(type) {
		
		if($("#positionNo").val()=="" || $("#positionNo").val()==null){
			Modal.alert({
				msg:"显示位置不能为空！",
				title: '提示',
			    btnok: '确定',
				btncl: '取消'
			});
			return;
		} else{
			var reg=/^[1-9].*$/;
			if (!reg.test($("#positionNo").val())) {
				Modal.alert({
					msg:"显示位置只能是数字！",
					title: '提示',
				    btnok: '确定',
					btncl: '取消'
				});
				return;
			}
		}
		
		if($("#bankName").val()=="" || $("#bankName").val()==null){
			Modal.alert({
				msg:"名称不能为空！",
				title: '提示',
			    btnok: '确定',
				btncl: '取消'
			});
			return;
		} else {
			if ($("#bankName").val().length > 20) {
				Modal.alert({
					msg:"名称不能超过20个字符！",
					title: '提示',
				    btnok: '确定',
					btncl: '取消'
				});
				return;
			}
		}
		
		if($("#imgUrl").val()=="" || $("#imgUrl").val()==null){
			Modal.alert({
				msg:"请上传图片！",
				title: '提示',
			    btnok: '确定',
				btncl: '取消'
			});
			return;
		}
		
		if($("#pageUrl").val()=="" || $("#pageUrl").val()==null){
			Modal.alert({
				msg:"URL地址不能为空！",
				title: '提示',
			    btnok: '确定',
				btncl: '取消'
			});
			return;
		} else {
			var reg=/^((https|http|HTTP|HTTPS):\/\/){1}[0-9a-zA-Z\u0000-\u00FF]+$/;
			
			if (!reg.test($("#pageUrl").val())) {
				Modal.alert({
					msg:"URL地址不合法！",
					title: '提示',
				    btnok: '确定',
					btncl: '取消'
				});
				return;
			} else  {
				if (($("#pageUrl").val().length > 200)) {
					Modal.alert({
						msg:"URL地址不能超过200个字符！",
						title: '提示',
					    btnok: '确定',
						btncl: '取消'
					});
					return;
				}
				
			}
		}
		sub(type);
		
	}
	
	function sub(type){
		 $.ajax({  
              type:'post',       
              url:'${ctx}/creditCard/saveCreditCard',
              cache:false,
              async:false,
              dataType: 'TEXT',
              data : {
              	uuid : $("#uuid").val(),
              	positionNo : $("#positionNo").val(),
              	bankName: $("#bankName").val() ,
              	imgUrl: $("#imgUrl").val(),
              	pageUrl: $("#pageUrl").val(),
              	type:type
   	        },
              success:function(data){
           	data=eval('('+data+')');
           	   
              	 if(data.result==1){
              		$("#uuid").val(data.uuid);
              		var info_msg = type=="save"?"保存成功。":"发布成功。";
              		Modal.alert({
              			msg:info_msg
              		}).on(function(e){
              			if(e==true){
              				parent.$.fancybox.close();
              			}
              		});
              	}
              }
		});	
	}
	
	function release() {
		if($("#uuid").val()=="" || $("#uuid").val()==null){
			Modal.alert({
				msg:"请先保存信用卡后再发布！",
				title: '提示',
			    btnok: '确定',
				btncl: '取消'
			});
			return;
		}
		$.ajax({
           type:'post',       
           url:'${ctx}/creditCard/release',
           cache:false,
           async:false,
           data : {
           	uuid : $("#uuid").val(),
           	positionNo : $("#positionNo").val(),
           	bankName: $("#bankName").val() ,
           	imgUrl: $("#imgUrl").val(),
           	pageUrl: $("#pageUrl").val(),
	        },
           success:function(result){
           	 if(result==1){
           		Modal.alert({
           			msg:"发布成功。"
           		}).on(function(e){
           		});
           	}
           }
		});	
	}
	
	
</script>
</body>
</html>