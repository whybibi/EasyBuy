<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/1/31
  Time: 上午 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <script src="../js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="../js/checkForm.js" type="text/javascript"></script>
    <link href="../css/register.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="regMain">
    <%@include file="../include/head.jsp"%>
    <div>
        <div class="regDiv">
            <p class="regTit">用户注册</p><p class="regMust">*为必填项</p>
            <form name="regForm" action="<%=basePath%>reg" method="post" onsubmit="return checkReg()">
                <input class="textInput" type="text" placeholder="*用户名（不区分大小写，不超过16个字符）" name="userName" id="userName" required title="用户名不区分大小写，不超过16个字符"/><br/>
                <p class="formP" id="nameP"></p>
                <input class="textInput" type="password" placeholder="*密码（不超过12个数字或字母）" name="passWord" id="passWord" required title="密码不超过12个数字或字母"/><br/>
                <p class="formP" id="pwdP"></p>
                <input class="textInput" type="password" placeholder="*确认密码" name="rePwd" id="rePwd" required/><br/>
                <p class="formP" id="rpwdP"></p>
                <input class="textInput" type="text" placeholder="邮箱" name="email" id="email" pattern="/^\w+@\W+(\.[a-zA-Z]{2,3}){1,2}$/" /><br/>
                <input class="textInput" type="text" placeholder="*11位手机号" name="phone" id="phone" required title="11位手机号"/><br/>
                <p class="formP" id="phoneP"></p>
                <input class="textInput" type="text" placeholder="*真实姓名" name="realName" id="realName" required/><br/>
                <p class="formP" id="realnameP"></p>
                <input class="textInput" type="text" placeholder="*18位身份证号" name="idCard" id="idCard" required/><br/>
                <p class="formP" id="idcardP"></p>
                <div class="sexD">性别:&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" checked value="男" id="man"/>男&nbsp;&nbsp;<input type="radio" name="sex" value="女" id="woman" />女</div><br/>
                <input class="btnInput" type="submit" value="立即注册"/>
            </form>
            <p class="regP">已有账号？去<a href="../user/login.jsp">登录</a></p>
        </div>
    </div>

    <p class="regBtmP">易买网2017-2018</p>
</div>

</body>
</html>
