<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/1/30
  Time: 上午 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>页面走丢了</title>
    <style>

        body{
            margin:0;
            padding: 0;
            background-color: #d8f2f0;
        }

        *{
            margin:0;
            padding: 0;
        }
        a{
            width: 100%;
            color: #31b7b1;
            font-size: 14px;
            text-decoration: none;
        }
        .lose{
            width: 100%;
            height: auto;
            margin-top: 100px;
            margin-bottom: 50px;
        }
        .loseP{
            font-size: 160px;
            text-align: center;
            font-family: "Adobe Garamond Pro";
            color: #31b7b1;
        }
        .loseP2{
            text-align: center;
            font-size: 15px;
            color: #666666;
        }
        .loseP3{
            text-align: center;
        }
        .timeS{
            font-size: 30px;
            color: #31b7b1;
            padding: 5px;
        }

    </style>
    <script src="../js/jquery-3.2.1.js"></script>
    <script>

        $(function(){

            var cheight = document.documentElement.clientHeight || document.body.clientHeight;
            var times = 5;
            setInterval(function(){
                $(".timeS").html(times);
                if(times==0){
                    window.location.href = "../index.jsp";
                }
                times--;
            },1000);
        });


    </script>
</head>
<body>

<div class="lose">
    <p class="loseP">404</p>
    <p class="loseP2">啊偶，页面走丢了<span class="timeS">5</span>秒后返回首页...</p>
    <p class="loseP3"><a href="../index.jsp">返回首页</a></p>
</div>

</body>
</html>
