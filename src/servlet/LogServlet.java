package servlet;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SubmitServlet")
public class LogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name").trim().toLowerCase();
        String pwd = request.getParameter("pwd").trim();
        if(name==null || name.equals("") || pwd==null || pwd.equals("")){
            out.print("<script type='text/javascript'>alert('用户名或密码不能为空！');document.location.href='../user/login.jsp';</script>");
        }else{
            UserDao userDao = new UserDaoImpl();
            User user = userDao.checkLogUser(name,pwd).get(0);
            if(user!=null){
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(300*60);
                session.setAttribute("user",user);
                out.print("<script type='text/javascript'>alert('登录成功！');document.location.href='../index.jsp';</script>");
            }else{
                out.print("<script type='text/javascript'>alert('请检查用户名或密码是否正确！');document.location.href='../user/login.jsp';</script>");
            }
        }
        out.flush();
        out.close();
    }


}
