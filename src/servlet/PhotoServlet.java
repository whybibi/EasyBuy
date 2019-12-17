package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "PhotoServlet")
public class PhotoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uploadFileName = ""; //上传的文件名
        String normalName = "";

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        String uploadFilePath = request.getSession().getServletContext().getRealPath("F:\\EasyBuy");

        if(isMultipart){
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try{
                //解析表单中所有文件
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iterator = items.iterator();
                while(iterator.hasNext()){
                    FileItem item = iterator.next();
                    if(item.isFormField()){
                        normalName = item.getFieldName();//表单字段的name名

                    }else{
                        String fileName = item.getName();
                        if(fileName!=null && !fileName.equals("")){
                            File fullFile = new File(item.getName());
                            File saveFile = new File(uploadFilePath,fullFile.getName());
                            item.write(saveFile);
                        }
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }

        }

    }
}
