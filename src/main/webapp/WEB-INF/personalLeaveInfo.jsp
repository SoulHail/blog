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
        <div class="layui-logo">个人请假申请信息</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
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
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <table border="1" width="81%">
            <tr style="height: 50px">
                <th align="center" width="21%">请假开始日期</th>
                <th align="center" width="21%">请假结束日期</th>
                <th align="center" width="18%">辅导员</th>
                <th align="center" width="21%">审批状态</th>
            </tr>
            <tr>
                <td align="center" width="11%">${sessionScope.personalInfo.userId}</td>
                <td align="center" width="11%">${sessionScope.personalInfo.userName}</td>
                <td align="center" width="11%">
                    <c:if test="${sessionScope.personalInfo.sex==1}">
                        男
                    </c:if>
                    <c:if test="${sessionScope.personalInfo.sex==2}">
                        女
                    </c:if>
                </td>
                <td align="center" width="11%">${sessionScope.personalInfo.major}</td>
                <td align="center" width="11%">${sessionScope.personalInfo.age}</td>
                <td align="center" width="11%">${sessionScope.personalInfo.phone}</td>
                <td align="center" width="11%">${sessionScope.personalInfo.email}</td>
            </tr>
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
