<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../jquery.min.js">
    <title>注册信息</title>
    <style>
        .hrefoff{
            color: grey;
            font-size: 18px;
        }
        .hrefon{
            color: blue;
            font-size: 18px;
        }
        .switch {
            position: relative;
            float: left;
            width: 90px;
            margin: 0;
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select: none;
        }

        .switch-checkbox {
            display: none;
        }

        .switch-label {
            display: block;
            overflow: hidden;
            cursor: pointer;
            border: 1px solid #999999;
            border-radius: 20px;
        }

        .switch-inner {
            display: block;
            width: 200%;
            margin-left: -100%;
            transition: margin 0.3s ease-in 0s;
        }

        .switch-inner::before, .switch-inner::after {
            display: block;
            float: right;
            width: 50%;
            height: 30px;
            padding: 0;
            line-height: 30px;
            font-size: 14px;
            color: white;
            font-family:
                    Trebuchet, Arial, sans-serif;
            font-weight: bold;
            box-sizing: border-box;
        }

        .switch-inner::after {
            content: attr(data-on);
            padding-left: 10px;
            background-color: #019FE8;
            color: #FFFFFF;
        }

        .switch-inner::before {
            content: attr(data-off);
            padding-right: 10px;
            background-color: #EEEEEE;
            color: #999999;
            text-align: right;
        }

        .switch-switch {
            position: absolute;
            display: block;
            width: 22px;
            height: 22px;
            margin: 4px;
            background: #FFFFFF;
            top: 0;
            bottom: 0;
            right: 56px;
            border: 1px solid #999999;
            border-radius: 20px;
            transition: all 0.3s ease-in 0s;
        }

        .switch-checkbox:checked + .switch-label .switch-inner {
            margin-left: 0;
        }

        .switch-checkbox:checked + .switch-label .switch-switch {
            right: 0px;
        }
    </style>
</head>
<body>
<form action="/ccc">
    <div class="switch">
        <input class="switch-checkbox" id="enableStatus" type="checkbox" checked onclick="cha(2)">
        <label class="switch-label" for="enableStatus">
            <span class="switch-inner" data-on="启用" data-off="停用"></span>
            <span class="switch-switch"></span>
        </label>
    </div>
    <a id="edit" name="edit" class="hrefon">编辑</a>&nbsp;&nbsp;
    <a id="delete" name="delete" class="hrefon">删除</a>
    <input hidden type="text" id="text" name="text" width="200px" value="">
    <input type="submit" value="提交" name="ccc" />
</form>
<script src="../jquery.min.js"></script>
<script type="text/javascript">


    /*function changetype(){
        var a = 3;
        if ($('#enableStatus').attr('checked')) {
            alert("jinlaile");
            document.getElementById("edit").className = "hrefoff";
            document.getElementById("delete").className = "hrefoff";
        }
    }*/
        /*var input = function () {
            $("input[name='enableStatus']").each(function () {
                alert("dd");
                var num = this.checked ? 1 : 2;
                $("input[name='enableStatus']").val(num);
            });
            /!*$("input[name='enableStatus']").click(function(){
                var str = "1";
                $("input[name='enableStatus']").val(str);//此处想怎么赋值就怎么赋值
            })*!/
        }*/
        function cha(id){
            if ($("#enableStatus").is(':checked')) {
                //开关打开对应的操作
                $("input[id='text']").val(1);
                document.getElementById("edit").className = "hrefon";
                document.getElementById("delete").className = "hrefon";
            } else {
                //开关关闭对应的操作
                $("input[id='text']").val(2);
                document.getElementById("edit").className = "hrefoff";
                document.getElementById("delete").className = "hrefoff";
            }
            alert(id)
        }

        /*$("#enableStatus").on('click', function(){
            if ($("#enableStatus").is(':checked')) {
                //开关打开对应的操作
                $("input[id='text']").val(1);
                document.getElementById("edit").className = "hrefon";
                document.getElementById("delete").className = "hrefon";
            } else {
                //开关关闭对应的操作
                $("input[id='text']").val(2);
                document.getElementById("edit").className = "hrefoff";
                document.getElementById("delete").className = "hrefoff";
            }
        });*/

</script>
</body>
</html>