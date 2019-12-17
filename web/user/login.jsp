<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/1/30
  Time: 上午 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../method.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>

<div class="loginMain">
    <%@include file="../include/head.jsp"%>
    <div class="loginDiv">
        <p class="loginTit">用户登录</p>
        <form action="<%=basePath%>log" method="post">
            <input class="textInput" placeholder="用户名" type="text" name="name" class="name" required/><br/>
            <input class="textInput" placeholder="密码" type="password" name="pwd" class="pwd" required/><br/>
            <input class="btnInput" type="reset" value="重置"/>
            <input class="btnInput" type="submit" value="登录"/>
        </form>
        <p class="loginRegp">还没有账户？去<a href="../user/register.jsp">注册</a></p>
    </div>
</div>
<p class="loginBtmP">易买网2017-2018</p>

</body>
</html>
