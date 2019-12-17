<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/2/4
  Time: 下午 05:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        a{
            text-decoration: none;
            color: #7f7f7f;
        }
        .userlist_main{
            width: 100%;
            height: auto;
            margin-bottom: 20px;
            text-align: center;
        }

        .addUserBtn{
            width: 100px;
            height: 25px;
            font-size: 12px;
            line-height: 25px;
            color: white;
            border: none;
            outline: none;
            cursor: pointer;
            background-color: #ab0000;
            float: right;
            margin-right: 2.5%;
            margin-top: 20px;
            margin-bottom: 15px;
        }

        table{
            width: 95%;
            margin: 0 auto;
            text-align: center;
            font-size: 13px;
        }
        tr{
            height:35px;
            line-height: 35px;
        }

        .tname{
            width: 30%;
        }
        .tother{
            width: 15%;
        }
        .tdo{
            width: 5%;
        }

        .page_Ul{
            width: auto;
            float: right;
            height: 25px;
            list-style: none;
            margin-top: 20px;
            margin-bottom: 5px;
        }
        .page_Ul li{
            width: auto;
            height: 25px;
            float: left;
            font-size: 12px;
            text-align: center;
            line-height: 25px;
            margin-right: 6px;
            color: #7f7f7f;
        }
        .page_jump:hover{
            cursor: pointer;
            color: #57acc8;
        }
        .pageInput{
            width: 25px;
            height: 20px;
        }

        .tdsp{
            color: #57acc8;
            font-weight: bold;
        }
        .info_tr:hover{
            background-color: #ebebeb;
        }

        .add_user{
            width: 100%;
            height: auto;
            display: none;
            margin-bottom: 30px;
        }

        .add_form{
            width: 40%;
            height: auto;
            margin: 0 auto;
        }

        input{
            outline:none;
            font-size: 12px;
        }
        .textInput{
            width: 250px;
            height: 35px;
            text-indent: 5px;
            margin-top: 20px;
            border: 1px solid #dadada;
        }
        .btnInput{
            border: none;
            width: 250px;
            height: 35px;
            cursor: pointer;
            color: white;
            background-color: #ab0000;
        }

        .sexD{
            font-size: 12px;
        }

        .returnBtn{
            float: right;
            width: 100px;
            height: 25px;
            border: none;
            margin-top: 20px;
            margin-bottom: 20px;
            margin-right: 2.5%;
            color: white;
            cursor: pointer;
            background-color: #ab0000;
        }

    </style>
    <script src="../../js/jquery-3.2.1.js"></script>
    <script>


        $(function () {
            $(".addUserBtn").click(function(){
                $(".userlist_main").hide();
                $(".add_user").show();
            });
            $(".returnBtn").click(function(){
                $(".userlist_main").show();
                $(".add_user").hide();
            });
        });

        function isDel(){
            if(confirm("确定要删除吗？")){
                return true;
            }else{
                return false;
            }
        }

        function checkAdd(){

        }

    </script>
</head>
<body>
    <div class="userlist_main">
        <input type="button" class="addUserBtn" value="添加用户"/>
        <table border="0" cellpadding="3" cellspacing="1" bgcolor="#c1c1c1">
            <tr bgcolor="#FFFFFF">
                <th class="tname">用户名称</th>
                <th class="tname">真实姓名</th>
                <th class="tother">性别</th>
                <th class="tother">类型</th>
                <th colspan="2">操作</th>
            </tr>
            <c:forEach items="${list}" var="list" varStatus="i">
            <tr class="info_tr" bgcolor="#FFFFFF">
                <td class="tname">${list.getUserName()}</td>
                <td class="tname"><span class="tdsp">${list.getRealName()}</span></td>
                <td class="tother">${list.getSex()}</td>
                <td class="tother">${list.getType()==1?"管理员":"注册用户"}</td>
                <td class="tdo"><a href="/userList?modify=${list.getId()}">修改</a></td>
                <%--<td class="tdo">${list.getType()==1?"":"<a href='/userList?del='>删除</a>"}</td>--%>
                <td class="tdo"><a onclick="return isDel()" href="/userList?del=${list.getId()}" ${list.getType()==1?"style='display:none;'":""}>删除</a></td>
            </tr>
            </c:forEach>
        </table>

        <ul class="page_Ul">
            <li class="page_jump"><a href="/userList?nowPage=${pageNow-1}">上一页</a></li>
            <li>第${pageNow}页/共${pageSum}页</li>
            <li>跳转到第<input class="pageInput" type="text" />页 <a href="/userList?toPage=">跳转</a></li>
            <li class="page_jump"><a href="/userList?nowPage=${pageNow+1}">下一页</a></li>
        </ul>
    </div>

    <div class="add_user">
        <input type="button" class="returnBtn" value="返回列表"/>
        <form class="add_form" action="/userList" method="post" onsubmit="return checkAdd()">
            <input class="textInput" type="text" placeholder="*用户名（不区分大小写，不超过16个字符）" name="userName" id="userName" required title="用户名不区分大小写，不超过16个字符"/><br/>
            <input class="textInput" type="password" placeholder="*密码（不超过12个数字或字母）" name="passWord" id="passWord" required title="密码不超过12个数字或字母"/><br/>
            <input class="textInput" type="text" placeholder="邮箱" name="email" id="email" pattern="/^\w+@\W+(\.[a-zA-Z]{2,3}){1,2}$/" /><br/>
            <input class="textInput" type="text" placeholder="*11位手机号" name="phone" id="phone" required title="11位手机号"/><br/>
            <input class="textInput" type="text" placeholder="*真实姓名" name="realName" id="realName" required/><br/>
            <input class="textInput" type="text" placeholder="*18位身份证号" name="idCard" id="idCard" required/><br/>
            <br/><div class="sexD">性别:&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" checked value="男" id="man"/>男&nbsp;&nbsp;<input type="radio" name="sex" value="女" id="woman" />女</div><br/>
            <input class="btnInput" type="submit" value="添加"/>
        </form>
    </div>

</body>
</html>
