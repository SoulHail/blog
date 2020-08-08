<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
	 <style type="text/css" >
    	a:hover{
    		background-color:transparent;
  			text-decoration:underline;
    	}
    </style>
    <%@include file="../layout/common.jsp"%>
    
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger">
                                        <i class="ace-icon fa fa-table"></i>
                                        操作结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                	<h3 class="smaller lighter green inline">&nbsp;&nbsp;${message}&nbsp;&nbsp;</h3>
                                	<c:if test="${downloadFlag == 'true'}">
                                		<label style="font-size: 15px;color: green;"><a href="${path}" id="returnLink">&nbsp;&nbsp;请尝试点击此处下载图片</a></label>
                                	</c:if>
                                	<c:if test="${isHaveButton != 'false'}">
                                		<label style="font-size: 15px;color: green;"><a href="${returnUrl}" id="returnLink">&nbsp;&nbsp;点击立即返回${returnPageName}</a></label>
                                	</c:if>
                                </div>
                                <br /><br />
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    <c:if test="${isToErrorPage != 'true'}">
    	<%@include file="../layout/common.js.jsp"%>
    </c:if>
</body>
<script type="text/javascript">
	jQuery(function($) {
		if('${returnUrl}'.indexOf('/task/list') != -1)
			window.parent.refreshTask();
	});
</script>
</html>











