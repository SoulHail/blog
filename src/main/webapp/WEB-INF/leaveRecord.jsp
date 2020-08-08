<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>考勤管理系统</title>
    <link rel="stylesheet" href="../css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">请假信息中心</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <%--<ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">请假申请</a></li>
            <li class="layui-nav-item"><a href="">申请记录</a></li>
            <li class="layui-nav-item"><a href="/center?userId=${sessionScope.userId}">个人中心</a></li>
        </ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="../images/xc.jpg" class="layui-nav-img">
                    ${sessionScope.userName}
                </a>
            </li>
            <li class="layui-nav-item"><a href="/back">返回</a></li>
            <li class="layui-nav-item"><a href="/exit">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        </div>
    </div>

    <div class="layui-body">
        <table border="1" width="81%">
            <tr style="height: 50px">
                <th align="center" width="23%">请假开始时间</th>
                <th align="center" width="23%">请假结束时间</th>
                <th align="center" width="35%">申请原因</th>
                <th align="center" width="10%">审批状态</th>
            </tr>
            <c:forEach var="lr" items="${lr}">
                <tr style="height: 30px">
                    <td align="center" width="23%">${lr.startTime}</td>
                    <td align="center" width="23%">${lr.endTime}</td>
                    <td align="center" width="35%">${lr.reason}</td>
                    <td align="center" width="10%">
                        <c:if test="${lr.status==0}">
                            <span style="color: lightskyblue">待审批</span>
                        </c:if>
                        <c:if test="${lr.status==1}">
                            <span style="color: green">通过</span>
                        </c:if>
                        <c:if test="${lr.status==2}">
                            <span style="color: red">驳回</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © coolBear.com - 版权归熊淳所有
    </div>
</div>
<script src="../src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
