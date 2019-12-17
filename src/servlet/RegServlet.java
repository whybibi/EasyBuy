package servlet;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "RegServlet")
public class RegServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("userName").trim();
        String pwd = request.getParameter("passWord").trim();
        String rePwd = request.getParameter("rePwd").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String realName = request.getParameter("realName").trim();
        String idCard = request.getParameter("idCard").trim();
        String sex = request.getParameter("sex");

        User user = new User(0,name,pwd,email,phone,realName,idCard,0,sex);
        UserDao userDao = new UserDaoImpl();

        if(userDao.getUser(name.toLowerCase()).size()!=0){
            out.print("<script type='text/javascript'>alert('当前用户名已被注册！请重新注册');document.location.href='../user/register.jsp';</script>");
            return;
        }
        int result = userDao.insertUser(user);
        if(result>0){
            System.out.print("注册成功！");
            out.print("<script type='text/javascript'>alert('注册成功！去登陆');document.location.href='../user/login.jsp';</script>");
        }else{
            System.out.println("注册失败");
            out.print("<script type='text/javascript'>alert('注册失败！');document.location.href='../user/register.jsp';</script>");
        }
        out.flush();
        out.close();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        UserDao userDao = new UserDaoImpl();
        String name = request.getParameter("name").trim();
        if(userDao.getUser(name.toLowerCase()).size()!=0){
            out.print("true");
        }else{
            out.print("false");
        };
        out.flush();
        out.close();
    }

}
