<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/2/4
  Time: 上午 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .userInfo_main{
            width: 100%;
            height: auto;
            margin-bottom: 30px;
            overflow: hidden;
        }
        .userInfo_ul{
            width: 100%;
            height: auto;
            margin-top: 30px;
            list-style: none;
        }
        .userInfo_ul li{
            font-size: 16px;
            margin-top: 10px;
            color: #7f7f7f;
            padding-left: 30px;
        }
        .userInfo_ul li p{
            width: 50%;
            height: 35px;
            line-height: 35px;
            text-align: left;
            text-indent: 3em;
            float: left;
        }

        .psp{
            color: #57acc8;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <div class="userInfo_main">
            <ul class="userInfo_ul">
                <li><p>用户名： <span class="psp">${user.getUserName()}</span></p><p>用户类型： <span class="psp">${user.getType()==1?"管理员":"注册用户"}</span></p></li>
                <li><p>邮箱： <span class="psp">${user.getEmail()}</span></p><p>手机： <span class="psp">${user.getPhone()}</span></p></li>
                <li><p>真实姓名： <span class="psp">${user.getRealName()}</span></p><p>性别： <span class="psp">${user.getSex()}</span></p></li>
                <li><p>身份证号： <span class="psp">${user.getIdCard()}</span></p></li>
            </ul>
        <br/>
    </div>
</body>
</html>
