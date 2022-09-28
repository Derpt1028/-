package controller.Course;

import dao.Course.CourseInfoImpl;
import pojo.Course;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 增加课程servlet
 * */
@WebServlet( "/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求的编码
        request.setCharacterEncoding("utf-8");
        //设置响应的编码
        response.setContentType("text/html;charset=utf-8");
        //获取响应字节打印流
        PrintWriter out=response.getWriter();
        //实例化用户信息实体类，获取View层输入的数据
        Course course = new Course();
        course.setCourseID(Integer.parseInt(request.getParameter("courseId")));//课程代码
        course.setCourseName(request.getParameter("courseName"));//课程名
        course.setCourseDescription(request.getParameter("courseDescription"));//课程描述
        //获取上传的图片文件名
        course.setimageURL("resource/"+request.getParameter("filesrc"));//图片路径

        //调用增加用户的方法
        if(new CourseInfoImpl().add(course)>0){
            out.print("success");
        }else{
            out.print("fail");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
