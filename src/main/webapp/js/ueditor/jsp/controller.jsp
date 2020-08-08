<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.baidu.ueditor.ActionEnter"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	//String rootPath2 = application.getRealPath( "/" );
	//String rootPath = "E:/faq/ueditor/";
	String rootPath="//home//app//sxpservice//";
	out.write( new ActionEnter( request, rootPath ).exec() );
%>