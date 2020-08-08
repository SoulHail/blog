<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付手刷平台</title>
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
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
											
												
												<button class="btn btn-info btn-sm" type="button"
													onclick="savePosition()">
													<span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
													保存
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">

								 <div class="widget-body">
                                    <div class="widget-main no-padding  table-responsive">
                                    
                                    	<ul class="sortable" id="test">
                                    		<c:forEach var="creditCard" items="${creditCardList}">
                                    			<li style="font-size:16px;" class="ui-state-default"  id="${creditCard.uuid}">${creditCard.bankName }</li>
                                    		</c:forEach>	
                                    		
                                    	</ul>
                                    <input type="hidden" name="sortedIDs" id="sortedIDs" value=""/>
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

        
        $(function() {
            $( ".sortable" ).sortable({
            cursor: "move",
            items :"li",                        
            opacity: 0.6,                       
            revert: true,                       
            update : function(event, ui){       
                //alert($(this).sortable("toArray"));
                $("#sortedIDs").val($("#test").sortable("toArray"));
                //alert($("#sortedIDs").val());
            }
           });
         });
        
        function savePosition() {
        	$.ajax({  
                type:'post',       
                url:'${ctx}/creditCard/savePosition',
                cache:false,
                async:false,
                data : {
                	sortedIDs : $("#sortedIDs").val()
     	        },
                success:function(result){
                	result = eval("(" + result + ")")
            		Modal.alert({msg: result.message}).on( function(e){
            			if(result.message == "操作成功"){
            				parent.$.fancybox.close();
            			}
            		});
                }
 		});
        }
</script>
</body>
</html>