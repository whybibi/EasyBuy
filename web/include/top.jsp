<%@ page import="dao.AddressDao" %>
<%@ page import="daoImpl.AddressDaoImpl" %>
<%@ page import="models.Addressed" %>
<%@ page import="java.util.List" %>
<%@ page import="models.User" %>

<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/1/28
  Time: 上午 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <link href="css/top.css" type="text/css" rel="stylesheet"/>
    <script src="js/jquery-3.2.1.js"></script>
    <script>

        function changeSize(){
            var width = document.documentElement.clientWidth || document.body.clientWidth;
            if(width<1300){
                $(".topMain , .bottoms_allin_div").width(1300);
            }else if(width>1600){
                $(".topMain , .bottoms_allin_div").width(1600);
            }else{
                $(".topMain ,.bottoms_allin_div").width("100%");
            }
        }

        $(window).resize(function(){
            changeSize();
        });

        $(function(){
            changeSize();

            $(".topAddressLi").hover(function(){
                $(".topCityDiv").show("fast");
            },function(){
                $(".topCityDiv").hide("fast")
            });

            $(".topUser li").hover(function(){
                $(this).find("div:last").show("fast");
            },function(){
                $(this).find("div:last").hide("fast");
            });
        });

    </script>
</head>

<body>
<div class="topMain">
    <div class="topState">
        <ul class="topAddress">
            <li class="topAddressLi">
                <div class="localtionDiv">
                    <i><img class="topLoactionImg" src="img/top/location.png"/></i>
                    <span class="topCity">济南市</span>
                </div>
                <div class="topCityDiv">
                    <ul class="cityUl">
                        <%
                            AddressDao address = new AddressDaoImpl();
                            List<Addressed> list =  address.getAllAddress();
                            for(Addressed ad : list){
                        %>
                        <li><div class="cityIn"><% out.print(ad.getCity()); %></div></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </li>
        </ul>

        <ul class="topUser">
            <%
                try{
                    User user = (User) session.getAttribute("user");
                    if(user!=null){
                        out.print("<li><a href='user/userhome.jsp'>");
                        out.print("<p style='text-align:right;float:left;width: 110px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;'>你好，");
                        out.print(user.getUserName());
                        out.print("</p>");
                        out.print("</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='user/logout.jsp' style='color: red;'>退出</li></a></li>");
                    }else{
                        out.print("<a href='user/login.jsp'><li>你好，请登录</li></a>");
                        out.print("<a href='user/register.jsp'><li  style='color: red'>免费注册</li></a>");
                    }
                }catch(Exception e){
                    out.print("<a href='user/login.jsp'><li>你好，请登录</li></a>");
                    out.print("<a href='user/register.jsp'><li  style='color: red'>免费注册</li></a>");
                }
             %>
            <a href="#"><li style="width: 80px">我的订单</li></a>
            <li class="myEasyBuyLi">
                <div class="myEasyBuy">我的易买网∨</div>
                <div class="myEasyBuyDiv">
                    <dl class="myEasyBuyDl">
                        <a href="#"><dd>我的易买网</dd></a>
                        <a href="#"><dd>我的订单</dd></a>
                        <a href="#"><dd>我的收货地址</dd></a>
                        <a href="#"><dd>我的特权</dd></a>
                        <a href="#"><dd>我的记录</dd></a>
                    </dl>
                </div>
            </li>
            <a href="#"><li style="width: 80px">易买会员</li></a>
            <a href="#"><li style="width: 80px">企业采购</li></a>
            <li class="userVipLi">
                <div class="userVip">客户服务∨</div>
                <div class="userVipDiv">
                    <dl class="userVipDl">
                        <a href="#"><dd>我的星级</dd></a>
                        <a href="#"><dd>快速退货</dd></a>
                        <a href="#"><dd>客服优先</dd></a>
                        <a href="#"><dd>上门服务</dd></a>
                    </dl>
                </div>
            </li>
            <li class="websiteMapLi" title="扫码有惊喜哦">
                <div class="websiteMap">网站导航∨</div>
                <div class="websiteMapDiv">
                    <img src="img/top/qr.png"/>
                </div>
            </li>
        </ul>
    </div>


    <div class="topMain2">
        <div class="topLogo"><img src="img/top/logo3.png"/></div>
        <div class="topSearch">
            <div class="topPoster">
                我是广告
            </div>
            <div class="topSearchFrame">
                <input type="text" placeholder="输入内容搜索" name="searchValue" class="searchInput"/>
                <input type="button" class="searchBtn" value="搜索"/>
            </div>
            <div class="topHot">
                <ul>
                    <li>热门商品：</li>
                    <li>热门商品</li>
                    <li>热门商品</li>
                    <li>热门商品</li>
                    <li>热门商品</li>
                </ul>
            </div>
        </div>

        <div class="buyCar">
            <div></div>
        </div>
    </div>

</div>
</body>

</html>
