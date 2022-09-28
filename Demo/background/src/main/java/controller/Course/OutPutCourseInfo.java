package controller.Course;

import com.alibaba.fastjson.JSON;
import dao.Course.getCourseInfo;
import pojo.Course;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


/**
 * 给出所有课程信息的Servlet
 * */
@WebServlet("/OutPutCourseInfo")
public class OutPutCourseInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        List<Course> CourseList =null;
        CourseList= new getCourseInfo().getCourseInfo();
        String data = JSON.toJSONString(CourseList);
        //书籍的数量
        int count=CourseList.size();
        //字符串拼接成Layui的table组件能识别的json字符串
        data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
        resp.getWriter().print(data);
    }
}
