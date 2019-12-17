<%@ page import="dao.NewsDao" %>
<%@ page import="daoImpl.NewsDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="models.News" %>
<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/2/2
  Time: 上午 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <style>

        a{
            color: #7f7f7f;
        }

        .news_main{
            width: 100%;
            height: auto;
            overflow: hidden;
            text-align: center;
        }

        .info_Ul{
            width: 97%;
            height: auto;
            margin: 0 auto;
            list-style: none;
            border-top: 1px solid #d5d5d5;
            border-right: 1px solid #d5d5d5;
            border-left: 1px solid #d5d5d5;
        }

        .info_Ul li{
            overflow: hidden;
            border-bottom: 1px solid #d5d5d5;
        }
        .tit{
            width: 49%;
            height: 40px;
            line-height: 40px;
            font-size: 12px;
            text-align: center;
            float: left;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .tit:hover{
            cursor: pointer;
        }
        .time{
            width: 49%;
            height: 40px;
            line-height: 40px;
            font-size: 12px;
            text-align: center;
            float: left;
            border-left: 1px solid #d5d5d5;
        }

        .titT{
            width: 49%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            float: left;
            font-weight: bold;
            font-size: 13px
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

        .news_content{
            width: 100%;
            height: auto;
            display: none;
        }
        .content_p{
            font-size: 14px;
            color: #7f7f7f;
            text-indent: 2em;
            text-align: left;
            margin-top: 20px;
        }
        .returnBtn{
            float: right;
            width: 60px;
            height: 25px;
            font-size: 13px;
            border: none;
            text-align: center;
            margin-right: 20px;
            margin-bottom: 20px;
            cursor: pointer;
            background-color: #f2f2f2;
        }

    </style>
    <script src="../../js/jquery-3.2.1.js"></script>
    <script>
        $(function(){
            $(".list_li").click(function(){
                var index = $(this).index();
                var text = $(this).text();
                $(".news_list").hide();
                $(".news_content").show();
                $(".content_s").html(text);
                console.log(index);
            });
            $(".returnBtn").click(function () {
                $(".news_list").show();
                $(".news_content").hide();
            });
            
        });
    </script>
</head>
<body>
    <div class="news_main">
        <div class="news_list">
        <ul class="info_Ul">
            <li><p class="titT">文章标题</p><p class="titT">创建时间</p></li>
            <c:forEach items="${list}" var="list" varStatus="i">
                <li class="list_li"><p class="tit">${list.getTitle()}</p><p class="time">${list.getCreateDate()}</p></li>
            </c:forEach>
        </ul>

                <ul class="page_Ul">
                    <li class="page_jump"><a href="/page?nowPage=${pageNow-1}">上一页</a></li>
                    <li>第${pageNow}页/共${pageSum}页</li>
                    <li>跳转到第<input class="pageInput" type="text" />页 <a href="/page?toPage=">跳转</a></li>
                    <li class="page_jump"><a href="/page?nowPage=${pageNow+1}">下一页</a></li>
                </ul>
        </div>

        <div class="news_content">
            <p class="content_p"><span class='content_s'></span></p>
            <input type="button" class="returnBtn" value ="返回"/>
        </div>


    </div>
</body>
</html>
