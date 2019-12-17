package servlet;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import models.Page;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserListServlet")
public class UserListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        UserDao userDao = new UserDaoImpl();

        try{
            String id = request.getParameter("del");
            if(id!=null){
                int d = Integer.parseInt(id);
                List<User> user =  userDao.getUser(d);
                if(user.get(0).getType()==1){
                    out.print("<script type='text/javascript'>alert('管理员账户不能删除！');document.location.href='../user/userhome.jsp';</script>");
                    return;
                }
                if(userDao.delUser(d)>0){
                    out.print("<script type='text/javascript'>alert('删除成功！');document.location.href='../user/userhome.jsp';</script>");
                    return;
                }
                out.print("<script type='text/javascript'>alert('删除失败！');document.location.href='../user/userhome.jsp';</script>");
                out.flush();
                out.close();
                return;
            }
        }catch(Exception e){
        }

        String nowPage = request.getParameter("nowPage");
        int pg = 1;

        Page page = new Page();
        page.setNewsCount(userDao.getAllNum());
        page.setPageListSize(13);
        page.setPageSum();
        page.setPageEnd();

        if(nowPage!=null){
            int n = Integer.parseInt(nowPage);
            if(n<=0){
                pg = 1;
            }else if(n>page.getPageSum()){
                pg = page.getPageSum();
            }else{
                pg=n;
            }
        }
        page.setPageNow(pg);

        List<User> list = userDao.getUserByLimit((page.getPageNow()-1)*page.getPageListSize(),page.getPageListSize());
        request.setAttribute("pageSum",page.getPageSum());
        request.setAttribute("pageNow",page.getPageNow());
        request.setAttribute("list",list);

        request.getRequestDispatcher("/user/content/userlist.jsp").forward(request,response);
    }

}
