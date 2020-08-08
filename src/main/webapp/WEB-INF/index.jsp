<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>
</head>
<body>
<form action="/login" method="post">
    用户名：<input type="text" name="userId" /><br/>
    密  码：<input type="password" name="password"/><br/>
    <input type="submit" value="登录" name="login" />
</form>
</body>
</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="../css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="../css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
    <%--<!--[if IE]>
    <script src="js/html5.js"></script>
    <![endif]-->--%>
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>Welcome My User</h3>
                <form action="/login" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <label for="userId"></label><input name="userId" id="userId" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <label for="password"></label><input name="password" id="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" value="" type="password" placeholder="请输入密码">
                    </div>
                    <div class="mb2">
                        <input data-method="setTips" class="act-but submit" style="color: #FFFFFF" value="                            登录                            " name="login" type="submit" onclick="loginCheck()"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="../js/TweenLite.min.js"></script>
<script src="../js/EasePack.min.js"></script>
<script src="../js/rAF.js"></script>
<script src="../js/demo-1.js"></script>
<script src="../layui.js" charset="utf-8"></script>
<script src="../jquery.min.js"></script>
<script type="text/javascript">

    function closes() {
        parent.$.fancybox.close();
    }


    function loginCheck() {
        if ($("#userId").val() === "") {
            alert("亲，用户名不能为空哦！");
            return false;
        }
        if ($("#password").val() === "") {
            alert("亲，密码不能为空哦！");
            return false;
        }
        return true;
    }

</script>
</body>
</html>
