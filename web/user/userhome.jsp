<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/2/1
  Time: 上午 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../css/userhome.css" type="text/css" rel="stylesheet"/>
    <script src="../js/jquery-3.2.1.js"></script>
    <script>

        function changeUserSize(){
            var width = document.documentElement.clientWidth || document.body.clientWidth;
            if(width<1000){
                $(".home_main").width(1000);
            }else if(width>1600){
                $(".home_main").width(1600);
            }else{
                $(".home_main").width("100%");
            }
        }

        $(window).resize(function(){
            changeUserSize();
        });


        $(function () {
            changeUserSize();
            $("dt").click(function () {
                if($(this).nextAll().is(":visible")){
                    $(this).nextAll().hide("fast");
                    return;
                }
                $(this).nextAll().show("fast");
            });

            $(".news").click(function () {
                $(".home_show_tit").html($(this).html())
                $(".home_load").load("/page");
            });
            $(".userinfos").click(function () {
                $(".home_show_tit").html($(this).html());
                $(".home_load").load("/userInfo");
            });
            $(".userlist").click(function () {
                $(".home_show_tit").html($(this).html());
                $(".home_load").load("/userList");
            });

        });

    </script>

</head>
<body>
<div class="home_main">
    <%@include file="../include/head.jsp"%>
    <div class="home_center">
        <div class="home_manage">
            <div class="manage_tit">
                <p class="managa_titP"><img src="../img/home_24px.png"/>&nbsp;&nbsp;管理中心</p>
            </div>
            <div class="order_main">
                <dl>
                    <dt><p><img src="../img/user_24px.png"/>&nbsp;&nbsp;订单中心</p></dt>
                    <dd>我的订单</dd>
                    <dd>全部订单</dd>
                </dl>
            </div>
            <div class="vip_main">
                <dl>
                    <dt><p><img src="../img/user_24px.png"/>&nbsp;&nbsp;会员中心</p></dt>
                    <dd class="userinfos">用户信息</dd>
                    <dd class="userlist">用户列表</dd>
                </dl>
            </div>
            <div class="product_main">
                <dl>
                    <dt><p><img src="../img/user_24px.png"/>&nbsp;&nbsp;商品管理</p></dt>
                    <dd>分类管理</dd>
                    <dd>商品管理</dd>
                    <dd>商品上架</dd>
                </dl>
            </div>
            <div class="info_main">
                <dl>
                    <dt><p><img src="../img/user_24px.png"/>&nbsp;&nbsp;资讯中心</p></dt>
                    <dd class="news">资讯列表</dd>
                </dl>
            </div>
            <br/>
        </div>
        <div class="home_show">
            <div class="home_show_top">
                <p class="home_show_tit">我的订单</p>
            </div>
            <div class="home_load">

            </div>
        </div>
    </div>
    <p style="padding: 10px;text-align: center;font-size: 13px">易买网2017-2018</p>
</div>
</body>
</html>
