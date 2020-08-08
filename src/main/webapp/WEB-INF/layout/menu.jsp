<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@include file="../common/taglib.jsp"%>
<div id="sidebar" class="sidebar                  responsive sidebar-fixed compact sidebar-scroll" data-sidebar="true" data-sidebar-scroll="true" style="" data-sidebar-hover="true">
  <script type="text/javascript">
    try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
  </script>

  <div class="nav-wrap-up pos-rel"><div class="nav-wrap nav-wrap-t" style="max-height: 418px;"><ul class="nav nav-list" style="position: relative; top: 0px; transition: top 0.15s; -webkit-transition: top 0.15s;">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tachometer"></i>
        <span class="menu-text"> 首页 </span>
      </a>

      <b class="arrow"></b>
       
    </li>
  <c:if test="${loginUserPermission.SMSA_BATCH_TEST_001!=null}">
   <li class="hover">
      <a href="#"  class="dropdown-toggle">
        <i class="menu-icon fa fa-file-o"></i>

        <span class="menu-text">
            跑批测试

        </span>

      </a>

      <b class="arrow"></b>
      <ul class="submenu can-scroll">
           <c:if  test="${loginUserPermission.SMSA_BATCH_TEST_001!=null }">   
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/batchTest/listView.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	           跑批测试界面
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
      </ul>
     
    </li>
</c:if>
  <c:if test="${loginUserPermission.SMSA_AGENT_008!=null || loginUserPermission.SMSA_AGENT_009!=null || loginUserPermission.SMSA_AGENT_019!=null || loginUserPermission.SMSA_AGENT_020!=null || loginUserPermission.SMSA_BASE_001!=null ||loginUserPermission.SMSA_FINANCE_001!=null || loginUserPermission.SMSA_AGENT_043!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								代理商管理
							</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>

      <ul class="submenu can-scroll">
       
        <c:if  test="${loginUserPermission.SMSA_AGENT_008!=null }">   
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/org/toAddOrg.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            新增代理商
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if  test="${loginUserPermission.SMSA_AGENT_046!=null }">   
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/batchIncome/tobatchAddMerc.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            批量新增商户
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_AGENT_009!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/org/toAddOrgQuick.do?type=quick">
	            <i class="menu-icon fa fa-caret-right"></i>
	            代理商快速创建
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_AGENT_019!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/org/list.do?orgProp=2">
	            <i class="menu-icon fa fa-caret-right"></i>
	            代理商管理
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_AGENT_020!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/org/searchAgentLever.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            代理商下属管理
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_BASE_001!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/org/searchAreaNum.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            修改代理区域数量限制
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
       <c:if test="${loginUserPermission.SMSA_FINANCE_001!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/virtualAccount/showVirtual.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              虚拟账号导入
	          </a>
	          <b class="arrow"></b>
	        </li>
       </c:if>
       <c:if test="${loginUserPermission.SMSA_AGENT_043!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/mercIncome/tipsInfoExport.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              修改提示信息导出
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_AGENT_044!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/org/changeOwner.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              退出代理商机具转移
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
      </ul>

    </li>
    </c:if>
    <c:if test="${loginUserPermission.SMSA_QUERY_008!=null ||loginUserPermission.SMSA_QUERY_009!=null ||loginUserPermission.SMSA_QUERY_010!=null 
    	||loginUserPermission.SMSA_QUERY_011!=null || loginUserPermission.SMSA_QUERY_015!=null || loginUserPermission.SMSA_QUERY_018!=null || loginUserPermission.SMSA_QUERY_022!=null 
    	||loginUserPermission.SMS_POSMEC_DOWN_001!=null ||loginUserPermission.SMS_MOBMEC_DOWN_001!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-list"></i>
        <span class="menu-text"> 商户查询 </span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
      <c:if test="${loginUserPermission.SMSA_QUERY_008!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/mecIf/listView.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            商户查询
	          </a>
	          <b class="arrow"></b>
	        </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_QUERY_009!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfTrade/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户交易查询
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>    
     
     <c:if test="${loginUserPermission.SMSA_QUERY_015!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfDatum/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户资料查询
          </a>
          <b class="arrow"></b>
        </li>
    </c:if>
    <c:if test="${loginUserPermission.SMSA_QUERY_018!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfWorkOrder/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户工单查询
          </a>
          <b class="arrow"></b>
        </li>
	</c:if>

     
     <c:if test="${loginUserPermission.SMSA_QUERY_010!=null}">
        <li class="hover">
         <a href="<%=request.getContextPath()%>/mecIfSettle/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户结算查询
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      
      <c:if test="${loginUserPermission.SMSA_POS_029!=null}">
        <li class="hover">
         <a href="<%=request.getContextPath()%>/mecIf/mecIfPosMgr.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户POS管理
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      
      
      <c:if test="${loginUserPermission.SMSA_QUERY_011!=null }">
        <li class="hover">

          <a href="<%=request.getContextPath()%>/mecIf/listSearch.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户关联修改
          </a>

          <b class="arrow"></b>
        </li>
      </c:if> 
	  <!--
      <c:if test="${loginUserPermission.SMSA_QUERY_022!=null}">
        <li class="hover">
         <a href="<%=request.getContextPath()%>/mecIf/toExportDown.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户信息导出
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
	  -->
		<c:if test="${loginUserPermission.SMSA_MOB_002!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mobMercAuthAdmin/realNamCheckList">
            <i class="menu-icon fa fa-caret-right"></i>
            二代手刷实名认证审核
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>
     <c:if test="${loginUserPermission.SMSA_RECORD_007!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecRecordOper/mecRecordView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            备案商户
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>
      <c:if test="${loginUserPermission.SMSA_COMPLIANC_001!=null }">
      <li class="hover">
         <a href="<%=request.getContextPath() %>/MerchantComplianceManage/toQueryMercComplianceList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户追偿核算
          </a>
          <b class="arrow"></b>
        </li>
       </c:if>	  	
     <c:if test="${loginUserPermission.SMS_MOBMEC_DOWN_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/imageUpload/downloadPosIndex.do">
            <i class="menu-icon fa fa-caret-right"></i>
         进件图片下载
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>	
     <c:if test="${loginUserPermission.SMS_MOBMEC_DOWN_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/imageUpload/downloadMobIndex.do">
            <i class="menu-icon fa fa-caret-right"></i>
         手刷商户实名认证照片下载
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>		
      </ul><div class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible" style="display: none; top: 1px; left: 288px;"><div class="scroll-bar" style="top: 0px;"></div></div>
    </li>
</c:if>
<c:if test="${loginUserPermission.SMSA_PROFIT_001!=null ||loginUserPermission.SMSA_PROFIT_004!=null ||loginUserPermission.SMSA_PROFIT_010!=null 
	||loginUserPermission.SMSA_PROFIT_013!=null ||loginUserPermission.SMSA_PROFIT_014!=null ||loginUserPermission.SMSA_PROFIT_015!=null}">
   <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-pencil-square-o"></i>
        <span class="menu-text"> 分润管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
      <c:if test="${loginUserPermission.SMSA_PROFIT_001!=null}">
	       <li class="hover">
	          <a href="<%=request.getContextPath()%>/profitLevel/list.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            分润等级设置
	          </a>
	
	          <b class="arrow"></b>
	        </li>
       </c:if> 
       <c:if test="${loginUserPermission.SMSA_PROFIT_004!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/profitArea/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            分润地区设置
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        
        <c:if test="${loginUserPermission.SMSA_PROFIT_045!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/profitArea/profitOrglist.do">
            <i class="menu-icon fa fa-caret-right"></i>
            分润机构设置
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        
        <%--  <li class="hover">
          <a href="<%=request.getContextPath()%>/profitArea/batchList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            分润地区批量设置
          </a>

          <b class="arrow"></b>
        </li> --%>
        <c:if test="${loginUserPermission.SMSA_PROFIT_010!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/agentExam/examList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            代理商分润考核设置
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_037!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/profitLoss/lossImportList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            每月损失同步
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_026!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/orgTradeSum/orgProfit.do">
            <i class="menu-icon fa fa-caret-right"></i>
            代理商分润查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_013!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/mecTradeSum/mecList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户日交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_PROFIT_015!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/mecTradeSum/mecMonthList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户月交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_PROFIT_017!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/empTradeSum/empList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            业务员日交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_019!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/empTradeSum/empMonthList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            业务员月交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_021!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/orgTradeSum/orgList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            机构日交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_PROFIT_023!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/orgTradeSum/orgMonthList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            机构月交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
      </ul>
    </li>
</c:if>

<c:if test="${loginUserPermission.SMSA_POS_028!=null ||loginUserPermission.SMSA_OMS_001!=null ||loginUserPermission.SMSA_OMS_002!=null ||loginUserPermission.SMSA_OMS_003!=null ||loginUserPermission.SMSA_POS_020!=null ||loginUserPermission.SMSA_OMS_008!=null ||loginUserPermission.SMSA_OMS_009!=null ||loginUserPermission.SMSA_OMS_004!=null ||loginUserPermission.SMSA_OMS_005!=null ||loginUserPermission.SMSA_OMS_006!=null ||loginUserPermission.SMSA_OMS_007!=null }">

    <li class="hover">
      <a href="calendar.html" class="dropdown-toggle">
        <i class="menu-icon fa fa-calendar"></i>
        <span class="menu-text">
            终端管理
        </span>
        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>
      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
       <c:if test="${loginUserPermission.SMSA_POS_028!=null}">
         <li class="hover">
        	<a href="<%=request.getContextPath() %>/IcCardManage/toQueryCardList.do">
            <i class="menu-icon fa fa-caret-right"></i>
           IC卡管理
          </a>
          <b class="arrow"></b>
        </li>
       </c:if>
       <%--密钥预灌装取消迁移  <li class="hover">
        	<a href="<%=request.getContextPath() %>/device/sKeyImport/list">
            <i class="menu-icon fa fa-caret-right"></i>
            	密钥预灌装     </a>

          <b class="arrow"></b>
        </li> --%>
		<c:if test="${loginUserPermission.SMSA_OMS_001!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/device/sKeyExport/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	密钥导出     </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_002!=null}">
 		<li class="hover">
        	<a href="<%=request.getContextPath() %>/device/deviceInStockOrder/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	终端附件入库     </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_003!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/device/posdevice/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	终端设备管理     </a>

          <b class="arrow"></b>
        </li>
        </c:if>
       <c:if test="${loginUserPermission.SMSA_POS_020!=null}">
       <li class="hover">
          <a href="<%=request.getContextPath() %>/deviceBatchIntake/toDeviceBatchIntake.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	携机入库
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_008!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/manufacturer/view.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                   厂商管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_009!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/posModel/posModelManager.do">
            <i class="menu-icon fa fa-caret-right"></i>
           	 型号管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_OMS_004!=null}">
        <li class="hover">
       	<a href="<%=request.getContextPath() %>/deviceOperateLog/view.do">
           <i class="menu-icon fa fa-caret-right"></i>
                                  终端历史数据查询
         </a>
         <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_005!=null}">
         <li class="hover">
        	<a href="<%=request.getContextPath() %>/attachmentDevices/view.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                 附件设备管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_006!=null}">
       <li class="hover">
          <a href="<%=request.getContextPath() %>/posTransferAdmin/queryTransferListView.do">
            <i class="menu-icon fa fa-caret-right"></i>
           	划拨单查询
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_007!=null}">
          <li class="hover">
          <a href="<%=request.getContextPath() %>/posTransferAdmin/queryPosBattchWrongList.do">
            <i class="menu-icon fa fa-caret-right"></i>
          	 批量划拨异常数据查询
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
      </ul>
    </li>
 </c:if>
 <c:if test="${loginUserPermission.SMSA_BASE_003!=null ||loginUserPermission.SMSA_POS_001!=null||loginUserPermission.SMSA_POS_011!=null||loginUserPermission.SMSA_ONLINE_PAY_001!=null||loginUserPermission.SMSA_POS_005!=null }">
 	<li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-pencil"></i>
        <span class="menu-text">订购管理</span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      	<c:if test="${loginUserPermission.SMSA_BASE_003!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/posPriceAdmin/priceGroupPage.do">
            <i class="menu-icon fa fa-caret-right"></i>
            价格设定
          </a>
          <b class="arrow"></b>
        </li>
       </c:if>
       <c:if test="${loginUserPermission.SMSA_POS_001!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/posOrderAdmin/orderList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            订单管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_POS_011!=null }">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/posOrderAdmin/orderListForConfirmPage.do">
            <i class="menu-icon fa fa-caret-right"></i>
            收款确认
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_ONLINE_PAY_001!=null }">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/onlinePayment/onlinePayLogList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            在线支付对账
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_POS_005!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/posTransferAdmin/queryTransferList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            发货管理
          </a>

          <b class="arrow"></b>
        </li>
       </c:if>
        </ul>
 </c:if>
 <c:if test="${loginUserPermission.SMSA_FLOW_001!=null || loginUserPermission.SMSA_FLOW_011!=null || loginUserPermission.SMSA_REST_001!=null || loginUserPermission.SMSA_REST_005!=null || loginUserPermission.SMSA_FORBID_001!=null ||loginUserPermission.SMSA_TASKCOUNT_001!=null 
 	|| loginUserPermission.SMSA_FORBID_RULE_001!=null || loginUserPermission.SMSA_FLOW_072!=null}">   
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text">流程管理</span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      	<c:if test="${loginUserPermission.SMSA_FLOW_001!=null}">
			<li class="hover">
	          <a href="<%=request.getContextPath() %>/task/list.do?taskSts=1&isFirstLoad=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	            流程审批
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        
       <c:if test="${loginUserPermission.SMSA_FLOW_072!=null}">
			<li class="hover">
	          <a href="<%=request.getContextPath() %>/task/taskEndListMgr.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            结束工单管理
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        
         <c:if test="${loginUserPermission.SMSA_FLOW_070!=null}">
			<li class="hover">
	          <a href="<%=request.getContextPath() %>/taskEntrust/listView.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            工单委托记录查询
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_FLOW_011!=null}">
	        <li class="hover">
	          <a href="javascript:void()"  class="dropdown-toggle" onclick="openDataImportPage()">
	            <i class="menu-icon fa fa-caret-right"></i>
	            合规整改工单导入
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_REST_001!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/restrict/restrictTimesList.do"   >
	            <i class="menu-icon fa fa-caret-right"></i>
	            重复次数限制
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_REST_005!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/restExcep/restExcepTimesList.do" >
	            <i class="menu-icon fa fa-caret-right"></i>
	            重复次数例外限制
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_REST_009!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/mercValiRepeat/exportView.do" >
	            <i class="menu-icon fa fa-caret-right"></i>
	            重复次数导出
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
		<c:if test="${loginUserPermission.SMSA_TASKCOUNT_001!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/taskCount/taskCountList.do" >
	            <i class="menu-icon fa fa-caret-right"></i>
	            审单工作量统计
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if> 
        <c:if test="${loginUserPermission.SMSA_FORBID_001!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/forbidAudit/forbidAuditView.do"   >
	            <i class="menu-icon fa fa-caret-right"></i>
	            禁审工单管理
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_FORBID_RULE_001!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/forbidAudit/forbidAuditRuleView.do"   >
	            <i class="menu-icon fa fa-caret-right"></i>
	            禁审工单规则管理
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_TASKCOUNT_011!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/taskCount/assignView.do"   >
	            <i class="menu-icon fa fa-caret-right"></i>
	    账号办理中工单统计
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
      </ul>
    </li>
 </c:if>   
<c:if test="${loginUserPermission.SMSA_COMMON_010!=null ||loginUserPermission.SMSA_COMMON_016!=null }">
   <li class="hover">
      <a href="#"  class="dropdown-toggle">
        <i class="menu-icon fa fa-file-o"></i>

        <span class="menu-text">
            文件资料


        </span>

      </a>

      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_COMMON_010!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/file/fileTypeList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           文件分类管理
          </a>

          <b class="arrow"></b>
          
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_COMMON_016!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath() %>/file/fileList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           文件内容管理
          </a>

          <b class="arrow"></b>
         </li>
         </c:if>
      </ul>

    </li>
</c:if>
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 系统管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_COMMON_005!=null}">
       <li class="hover">
          <a href="<%=request.getContextPath()%>/notice/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            公告管理
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <li class="hover">
          <a href="<%=request.getContextPath() %>/employee/toUpdatePassword.do" id="updatePassword">
            <i class="menu-icon fa fa-caret-right"></i>
            密码修改
          </a>

          <b class="arrow"></b>
        </li>
              <c:if test="${loginUserPermission.SMSA_admin_001!=null}">
        
        <li class="hover">
          <a href="<%=request.getContextPath() %>/employee/adminList.do" id="updatePassword">
            <i class="menu-icon fa fa-caret-right"></i>
            权限设置
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_FLOW_067!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/identityDetail/toNameAndCardid.do">
            <i class="menu-icon fa fa-caret-right"></i>
            身份证验证
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_FLOW_073!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/centerCManage/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            审单人员管理
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
       
      </ul>
    </li>
    
    
    
    
    
    <c:if test="${loginUserPermission.SMSA_COMMON_023!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 意见管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/suggestion/toList.do?entry=0">
            <i class="menu-icon fa fa-caret-right"></i>
            意见管理
          </a>
          <b class="arrow"></b>
        </li>
      </ul>
    </li>
    </c:if>
    </ul>
    </div>
    <div class="ace-scroll nav-scroll">
      <div class="scroll-track scroll-active" >
    <div class="scroll-bar" ></div>
  </div>
    <div class="scroll-content" ></div>
  </div>

  </div><!-- /.nav-list -->



  <script type="text/javascript">
    try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    function openDataImportPage(){
    	$.fancybox.open({
    		href : '/complianceRectification/toImportOrderPage.do',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: false,
	        closeClick: false
        });
    }
  </script>
</div>
