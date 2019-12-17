<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/2/1
  Time: 上午 10:11
  To change this template use File | Settings | File Templates.
--%>
<%
    try{
        String pagePwd = request.getParameter("pagePwd");
        if("why741741".equals(pagePwd)){
            session.removeAttribute("user");
            response.sendRedirect("../index.jsp");
        }
    }catch(Exception e){
        out.print("禁止访问");
    }

    session.removeAttribute("user");
    response.sendRedirect("../index.jsp");
%>
