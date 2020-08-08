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
        <div class="layui-logo">考勤系统布局-学生</div>
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
            <li class="layui-nav-item"><a href="/createExcel?userId=${sessionScope.userId}">导出Excel</a></li>
            <li class="layui-nav-item"><a href="/exit">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考勤记录</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/applyLeave">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请假申请</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/allLeaveRecord?userId=${sessionScope.userId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请记录</a>
                </li>
                <li class="layui-nav-item"><a href="/center?userId=${sessionScope.userId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人中心</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <table border="1" width="81%">
            <tr style="height: 50px">
                <th align="center" width="27%">时间</th>
                <th align="center" width="27%">缺席课数</th>
                <th align="center" width="27%">考勤状态</th>
            </tr>
            <c:forEach var="li" items="${li}">
                <tr style="height: 30px">
                    <td align="center" width="33%">${li.date}</td>
                    <td align="center" width="33%">
                        <c:if test="${li.count==12}">
                            上午1、2节课
                        </c:if>
                        <c:if test="${li.count==34}">
                            上午3、4节课
                        </c:if>
                        <c:if test="${li.count==56}">
                            下午1、2节课
                        </c:if>
                        <c:if test="${li.count==78}">
                            下午3、4节课
                        </c:if>
                    </td>
                    <td align="center" width="33%">
                        <c:if test="${li.status==1}">
                            <span style="color: green">事假</span>
                        </c:if>
                        <c:if test="${li.status==2}">
                            <span style="color: red">旷到</span>
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
