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
										<i class="ace-icon fa fa-table"></i> 银行列表
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="${ctx}/creditCard/list"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
											

<!-- 												<button class="btn btn-normal btn-sm" type="submit"> -->
<!-- 													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span> -->
<!-- 													检索 -->
<!-- 												</button> -->
							
												<button class="btn btn-info btn-sm" type="button"
													onclick="show('add','')">
													<span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
													添加
												</button>
												
												<button class="btn btn-info btn-sm" type="button"
													onclick="show('sortList','')">
													<span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
													排序
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">

								 <div class="widget-body">
                                    <div class="widget-main no-padding  table-responsive">
                                        <table class="table table-striped table-bordered table-condensed table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="5%">排序</th>
                                                <th width="15%">名称</th>
                                                <th width="35%">URL</th>
                                                <th width="10%">发布状态</th>
                                                <th width="15%">发布日期</th>
                                     			<th width="10%">发布人</th>
                                                <th >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="creditCard" items="${creditCardList}">
                                            		<tr >
		                                                <td align="center">${creditCard.positionNo }</td>
		                                                <td align="center">${creditCard.bankName }</td>
		                                                <td align="center">${creditCard.pageUrl }</td>
		                                        		<td align="center">${creditCard.releaseStatus=="00"?"未发布":"已发布"}</td>
		                                                <td align="center"><fmt:formatDate value="${creditCard.releaseDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                <td align="center">${creditCard.releasePerson }</td>
		                                                <td align="left">
		                                                <a href="javascript:show('edit','${creditCard.uuid }')" >
															编辑</a>
<%-- 														<a href="javascript:release('${creditCard.uuid }')" >发布</a>	 --%>
		                                                <a href="javascript:del('${creditCard.uuid }')" >
																删除</a>
		                                                </td>
	                                                </tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
							</div>
						</div>
						<div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
	<script type="text/javascript">
        $('.chosen-select').chosen({});

        
        
        function show(type,uuid){
      	  $.fancybox.open({
  				href : '${ctx}/creditCard/'+type+'?uuid='+uuid,
  				type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 900,
  	        height: 800,
  	        autoSize: false,
  	        closeClick: false,
	  	      afterClose:function(){
					location.reload();
				}
  			});
      	  
        }
        function del(uuid){
        	var url="${ctx}/creditCard/del?uuid="+uuid;
        	Modal.confirm({msg: '确认删除？'}).on(function(e){
        		if(e){
        			$.post(url,function(data){
                		data = eval("(" + data + ")")
                		Modal.alert({msg: data.message}).on( function(e){
                			if(data.message == "删除成功"){
                				$("#searchForm").submit();
                			}
                		});
                	});
        		}
        	});
        }
        
        function release(uuid){
        	var url="${ctx}/creditCard/release?uuid="+uuid;
        	Modal.confirm({msg: '确认发布？'}).on(function(e){
        		if(e){
        			$.post(url,function(data){
                		data = eval("(" + data + ")")
                		Modal.alert({msg: data.message}).on( function(e){
                			if(data.message == "发布成功"){
                				$("#searchForm").submit();
                			}
                		});
                	});
        		}
        	});
        }
</script>
</body>
</html>