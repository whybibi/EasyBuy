<%@ page import="models.Addressed" %>
<%@ page import="dao.AddressDao" %>
<%@ page import="daoImpl.AddressDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDao" %>
<%@ page import="daoImpl.UserDaoImpl" %>
<%@ page import="models.User" %><%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/1/30
  Time: 上午 09:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.2.1.js"></script>
    <%--<script>
        $.ajax("../reg",
            {
                data : "name="+name,
                type : get,
                dataType : "text",
                timeout : 5000,
                global : false
            }).done(function(data){
            console.log(data);
            if(data == "true"){
                $("#nameP").html(data.toString());
                $("#nameP").show("fast");
                return;
            }
        }).fail(function () {
            console.log("获取失败！");
        });
    </script>--%>
</head>
<body>
      <%--<%  AddressDao address = new AddressDaoImpl();
        List<Addressed> ad =  address.getAllAddress();
          System.out.println(ad);
        out.print(ad.size());
            for(Addressed asd : ad){
                out.print(asd.getCity());
            }

          out.print("<br/>");
          UserDao user = new UserDaoImpl();
          List<User> list = user.getAllUser();
          System.out.print(list);
          out.print("<br/>"+"list大小为："+list.size()+"<br/>");
          for(User u : list){
              out.print(u.getId()+"用户名："+u.getUserName());
          }

          out.print("WWESDEWS".toLowerCase());

            %>--%>
    <form action="/ps" enctype="multipart/form-data" method="post">
        <p>商品名称：<input type="text" name="name"/></p>
        <p>商品描述：<input type="text" name="description"/></p>
        <p>商品价格：<input type="text" name="price"/></p>
        <p>商品库存：<input type="text" name="stock"/></p>
        <p>一级分类：<input type="text" name="categoryLevel1"/></p>
        <p>二级分类：<input type="text" name="categoryLevel2"/></p>
        <p>三级分类：<input type="text" name="categoryLevel3"/></p>
        <p>商品图片：<input type="file" name="file"/></p>
        <p>商品上架：<input type="text" name="isDelete" value="0"/></p>
        <input type="submit" value="提交"/>
    </form>
</body>
</html>
