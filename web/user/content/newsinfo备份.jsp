<%@ page import="dao.NewsDao" %>
<%@ page import="daoImpl.NewsDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="models.News" %><%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/2/2
  Time: 上午 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <style>

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
            height: 25px;
            float: left;
            font-size: 12px;
            text-align: center;
            line-height: 25px;
            margin-right: 6px;
            border: 1px solid #31b7b1;
        }
        .page_Ul li:hover{
            cursor: pointer;
            background-color: #c80530;
        }
        .li_up ,.li_down{
            width: 65px;
        }
        .li_num{
            width: 30px;
        }

    </style>
    <script src="../../js/jquery-3.2.1.js"></script>
    <script>
        $(function(){
            $(".li_num").click(function(){
                $(".list_li").hide();
                var page = $(this).index();

            });
            $(".li_up").click(function(){
                $(".list_li").show();
                var page = $(this).index();

            });

        })
    </script>
</head>
<body>
    <div class="news_main">
        <ul class="info_Ul">
            <li><p class="titT">文章标题</p><p class="titT">创建时间</p></li>
            <%
                NewsDao newsDao = new NewsDaoImpl();
                System.out.print(newsDao.getAllNum());
                List<News> list = newsDao.getAllNews();
                int size = list.size();
                Double pageSum = Math.ceil(size*1.0/3);
                if(size!=0 && size>13){
                    for(int i=0; i<13; i++){ %>
                        <li class="list_li"><p class="tit"><%=list.get(i).getTitle()%></p><p class="time"><%=list.get(i).getCreateDate()%></p></li>
                    <%}
                }else if(size!=0 && size<=13){
                    for(News n :list){ %>
                         <li class="list_li"><p class="tit"><%=n.getTitle()%></p><p class="time"><%=n.getCreateDate()%></p></li>
                <%} %>
            <%  }else{ %>
                    <li><p class="tit">暂无</p><p class="time">暂无</p></li>
            <% } %>
        </ul>

        <% if(list.size()>13){ %>
                <ul class="page_Ul">
                    <li class="li_up">上一页</li>
                    <%
                        Double s = Math.ceil(size*1.0/3);
                        for(int i=1; i<=s; i++ ){%>
                    <li class="li_num"><%=i%></li>
                    <% } %>
                    <li class="li_down">下一页</li>
                </ul>
         <% } %>

    </div>
</body>
</html>
