<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>考勤管理系统</title>
    <script src='../lay/modules/jquery.js'></script>
    <link rel="stylesheet" href="../css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">请假申请</div>
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
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>请假信息表单</legend>
        </fieldset>
        <form class="layui-form" action="/applyLeaveInfo" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">学号</label>
                <div class="layui-input-block">
                    <input type="text" name="userId" id="userId" lay-verify="title" autocomplete="off" value="${sessionScope.userId}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="userName" id="userName" lay-verify="required"  autocomplete="off" value="${sessionScope.userName}" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">请假原因</label>
                <div class="layui-input-block">
                    <input type="text" name="reason" id="reason" lay-verify="required" placeholder="请填写请假原因" autocomplete="off" class="layui-input">
                </div>
            </div>

            <%--<div class="layui-form-item">
                <label class="layui-form-label">证明材料</label>
                <div class="layui-input-block">
                    <input type="file" name="file" id="file" lay-verify="required" placeholder="请选择证明材料" autocomplete="off" class="layui-input">
                    <button class="layui-btn" type="button" onclick="upload2()">上传文件</button>
                    &lt;%&ndash;<button class="layui-btn" lay-submit="" lay-filter="upload">立即提交</button>&ndash;%&gt;
                </div>
            </div>--%>
            <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
                <button type="button" class="layui-btn" id="test9">开始上传</button>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">日期范围</label>
                    <div class="layui-input-inline">
                        <input type="text" name="leaveTime" class="layui-input" id="test6" placeholder=" - ">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © coolBear.com - 版权归熊淳所有
    </div>
</div>
<script src="../layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate','upload'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            , upload = layui.upload
            ,$ = layui.jquery;

        upload.render({
            elem: '#test8'
            , url: '/upload2/'
            , auto: false
            //,multiple: true
            , bindAction: '#test9'
            , done: function (res) {
                layer.msg("成功！！")
            }
        });

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
        //日期范围
        laydate.render({
            elem: '#test6'
            ,range: true
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 13 || value.length > 13){
                    return '学号格式不正确啊!';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

    });
    /*function F_Open_dialog()
    {
        $.ajax({
            url : "/upload",//这里写你的url
            type : 'POST',
            data : formData,
            contentType: false,// 当有文件要上传时，此项是必须的，否则后台无法识别文件流的起始位置
            processData: false,// 是否序列化data属性，默认true(注意：false时type必须是post)
            dataType: 'json',//这里是返回类型，一般是json,text等
            clearForm: true,//提交后是否清空表单数据
            success: function(data) {   //提交成功后自动执行的处理函数，参数data就是服务器返回的数据。
                layer.msg("上传成功!");
            },
            error: function(data, status, e) {  //提交失败自动执行的处理函数。
                layer.msg("上传失败!");
            }
        });
        layer.msg("进入方法");
    }*/
</script>
</body>
</html>
