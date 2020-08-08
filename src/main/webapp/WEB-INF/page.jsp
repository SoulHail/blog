<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 最下面显示跳转页面 -->
<!-- ${page.totalCount }总的记录条数  其他的类似，与Page.java相关联 -->
<div>

	共 <i class="blue">${page.totalCount }</i> 条记录，当前显示第 <i class="blue">${page.currPage }
	</i> 页 / 共 <i class="blue">${page.totalPage }</i> 页 跳转 <input type="text"
		class="scinput" style="width: 40px; height: 20px" id="currPage2"
		onblur="turnPage('${page.totalPage}')" onkeyup="this.value=this.value.replace(/\D/g,'')"
		onafterpaste="this.value=this.value.replace(/\D/g,'')" /> 页,
		条数：<div class="inline">
			<select id="showPageSize" class="form-control" style="width:60px ;height:25px;padding:1px;" onchange="onChange4PageSize();"> 
			    <option value="10">10</option>
	            <option value="20">20</option>
	            <option value="50">50</option>
	            <option value="100">100</option>
	            <option value="1000">1000</option>
	        </select></div>

	<!-- 首页按钮，跳转到首页 -->
	<p>
		<c:if test="${page.currPage <= 1 }"></c:if>
		<a href="javascript:;"
			<c:if test="${page.currPage > 1 }">onclick="pageFirst();"</c:if>>首页</a>


		<!-- 上页按钮，跳转到上一页 -->
		<c:if test="${page.currPage <= 1 }"></c:if>
		<a href="javascript:;"
			<c:if test="${page.currPage > 1 }">onclick="pageUp('${page.currPage - 1}')"</c:if>>上页</a>

		<!-- 下页按钮，跳转到下一页 -->
		<c:if test="${page.currPage >= page.totalPage }"></c:if>
		<a href="javascript:;"
			<c:if test="${page.currPage < page.totalPage }">onclick="pageDown('${page.currPage + 1}')"</c:if>>下页</a>

		<!-- 末页按钮，跳转到最后一页 -->
		<c:if test="${page.currPage >= page.totalPage }"></c:if>
		<a href="javascript:;"
			<c:if test="${page.currPage < page.totalPage }">onclick="pageLast('${page.totalPage}')"</c:if>>末页</a>
	</p>
</div>
<script>

	//首页跳转
	function pageFirst(){
		var currSize = $('#pageSize').val();
		$('#pageNum').val(1);
		$('#pageSize').val(currSize);
		$("#searchForm").submit();
	}
	
	//尾页跳转
	function pageLast(lastPage){
		var currSize = $('#pageSize').val();
		$('#pageNum').val(lastPage);
		$('#pageSize').val(currSize);
		
		$("#searchForm").submit();
	}
	
	//上一页跳转
	function pageUp(upPage){
		var currSize = $('#pageSize').val();
		$('#pageNum').val(upPage);
		$('#pageSize').val(currSize);
		
		$("#searchForm").submit();
	}
	
	//下一页跳转
	function pageDown(downPage){
		//var currNum = $('#pageNum').val();
		var currSize = $('#pageSize').val();
		//var totalPage = $('#totalPage').val();
		//var numPage=parseInt(currNum)+parseInt(1);
		$('#pageNum').val(downPage);
		$('#pageSize').val(currSize);
		$("#searchForm").submit();
	}
	
	//页面跳转
	function turnPage(totalPage){
		var goNum = $('#currPage2').val();
		if('' == goNum){
			return false;
		}
		var goPage=goNum;
		if(parseInt(goNum) > parseInt(totalPage)){
			$('#currPage2').val(totalPage);
			goPage=totalPage;
		}
		if(parseInt(goNum) <= parseInt(0)){
			$('#currPage2').val(1);
			goPage=1;
		}
		console.log("===跳转到："+goPage);
		var currSize = $('#pageSize').val();
		
		$('#pageNum').val(goPage);
		$('#pageSize').val(currSize);
		$("#searchForm").submit();
	}
	
	//跳转页面的显示条数
	function onChange4PageSize(){
		var pageSize=$('#showPageSize').val();
		$('#pageSize').val(pageSize);
		$('#pageNum').val(1);
		$("#searchForm").submit();
	}
	
	$(function(){
		//设置当前显示的条数
		$('#showPageSize').val($('#pageSize').val());
	})
</script>