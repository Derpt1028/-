package controller.Course;

import utils.FileTools;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/UploadFileServlet")
/**
 * 使用Servlet的part对象上传必须的注解
 */
@MultipartConfig
public class UploadFileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取上传文件域，在view层前端界面中定义
        Part part = request.getPart("photo");
        String fileimg = "";
        String cd = part.getHeader("Content-Disposition");
        String filename = cd.substring(cd.lastIndexOf("=")+2, cd.length()-1);
        //设置返回的文件名
        //判断是否选择了文件
        if(filename.length()>0&&filename!=null) {
            //获取文件上传位置，文件夹【resource】可自定义
            String filepath = this.getServletContext().getRealPath("/resource");
            //调用文件上传工具类中的方法上传文件，并返回上传后的文件名
            fileimg= FileTools.fileUpload(part, filepath);
        }
        //字符串拼接成Layui的upload文件上传组件回调函数能接受的固定格式json字符串
        String data="{\"code\": 1," +
                "\"msg\": \"\"," +
                "\"data\":{" +
                "\"src\":\"" + fileimg +
                "\"}}";
        response.getWriter().print(data);
    }
}
