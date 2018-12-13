<%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/12/13
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>register</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        div.modal-body{
            margin-left: 15%;
            width: 70%;
        }
    </style>
    <script type="text/javascript">
        function check() {
            var username=document.getElementById("username").value;
            var xmlHttp = false;
                if (window.XMLHttpRequest)
                    xmlHttp = new XMLHttpRequest();
                else if (window.ActiveXObject) {
                    try {
                        xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
                    } catch (e) {
                        try {
                            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            window.alert("该浏览器不支持AJAX")
                        }
                    }
                }
                var url="/registerServlet?username="+username;
                xmlHttp.open("GET",url,true);
                xmlHttp.onreadystatechange=function () {
                    if (xmlHttp.readyState == 4) {
                        var a = xmlHttp.responseText.split(":");
                        checkDiv.innerHTML = a[0];
                        if (a[1].trim() == "1"){
                                document.getElementById("submit").disabled = true;
                        }
                }
                    else {
                        document.getElementById("submit").disabled = false;
                        checkDiv.innerHTML = "正在检测...."
                    }
                }
                xmlHttp.send();
        }

        function textPhone(obj){
        var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
        if(isMob.test(obj.value)){
            document.getElementById("mgs2").innerHTML = null;
            document.getElementById("submit").disabled = false;
        }
        else{
            document.getElementById("mgs2").innerHTML = "<font color='red'>请输入有效手机号</font>";
            document.getElementById("submit").disabled = true;
        }
    }

    function textPwd(){
        var pwd02=document.getElementById("pwd1");
        var pwd01=document.getElementById("pwd2");
        if(pwd01.value!=pwd02.value) {
            document.getElementById("mgs1").innerHTML = "<font color='red'>两次密码不相同</font>";
            document.getElementById("submit").disabled = true;
        }
        else {
            document.getElementById("mgs1").innerHTML = null;
            document.getElementById("submit").disabled = false;
        }
    }

    function se() {
        alert("恭喜你，注册成功！")
    }
</script>
</head>
<body>
<div class="modal-title">
    <h1 class="text-center">注册</h1>
</div>
<div class="modal-body">
    <form class="form-group" action="/user/register" method="post" accept-charset="utf-8" onsubmit="se()" >
        <div class="form-group">
            <label>用户名</label>
            <input name="username" id="username" class="form-control" type="text" placeholder="请输入用户名" <%--onblur="check()"--%> required value="${messageError}" >
        </div>
        <span id="checkDiv"></span>
        <div class="form-group">
            <label>密码</label>
            <input name="password" id="pwd1" class="form-control" type="password" placeholder="请输入密码" required>
        </div>
        <div class="form-group">
            <label>确认密码</label>
            <input name="phone" id="pwd2" class="form-control" type="password" placeholder="请再输入密码" onkeyup="textPwd()" required >
        </div>
        <span id="mgs1"></span>
        <div class="form-group">
            <label>手机号</label>
            <input name="cellphone" class="form-control" type="tel" placeholder="请输入手机号" onblur="textPhone(cellphone)" required>
        </div>
        <span id="mgs2"></span>
        <div class="form-group">
            <label>邮箱</label>
            <input name="email" class="form-control" type="email" placeholder="请输入邮箱" required>
        </div>
        <div class="form-group">
            <label>地址</label>
            <input name="address" class="form-control" type="text" placeholder="请输入地址" required>
        </div>
        <div>
            已经有账号?点击<a href="/index/login">登录</a>
        </div>
        <div class="text-right">
            <button class="btn btn-primary" id="submit" type="submit">注册</button>
            <button class="btn btn-primary" type="reset">取消</button>
        </div>
    </form>
</div>
</body>
</html>
