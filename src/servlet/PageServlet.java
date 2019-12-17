package servlet;

import com.alibaba.fastjson.JSON;
import dao.NewsDao;
import daoImpl.NewsDaoImpl;
import models.News;
import models.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PageServlet")
public class PageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        NewsDao newsDao = new NewsDaoImpl();
       //传过来的当前页
        String nowPage = request.getParameter("nowPage");
        int pg = 1;

        Page page = new Page();
        page.setNewsCount(newsDao.getAllNum());
        page.setPageListSize(13);
        page.setPageSum();
        page.setPageEnd();
        page.setPageNow(1);

        if(nowPage!=null){
            int s = Integer.parseInt(nowPage);
            if(s<=0){
                pg = 1;
            }else if(s>page.getPageSum()){
                pg = page.getPageSum();
            }else{
                pg = s;
            }
            page.setPageNow(pg);
        }

        List<News> list = newsDao.getByLimit((page.getPageNow()-1)*page.getPageListSize(),page.getPageListSize());

        request.setAttribute("pageSum",page.getPageSum());
        request.setAttribute("pageNow",page.getPageNow());
        request.setAttribute("list",list);
        request.getRequestDispatcher("user/content/newsinfo.jsp").forward(request,response);
    }


}
