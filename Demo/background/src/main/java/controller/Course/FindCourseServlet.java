package controller.Course;

import com.alibaba.fastjson.JSON;
import dao.Course.CourseInfoImpl;
import pojo.Course;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


/**
 * 给出所有的课程信息或查找指定的课程
 * */
@WebServlet("/FindCourseServlet")
public class FindCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求的编码
        request.setCharacterEncoding("utf-8");
        //设置响应的编码
        response.setContentType("text/html;charset=utf-8");
        //获取响应字节打印流
        PrintWriter out=response.getWriter();


        if(request.getParameter("CourseID")==null&&request.getParameter("CourseName")==null){
            //如果传过来的值全为空，则加载全部数据
            //通过调用service层方法获取所有用户信息列表
            List<Course> courseList= new CourseInfoImpl().findAll();
            //使用阿里的fastJson将用户信息列表转换成json字符串
            String data = JSON.toJSONString(courseList);
            //获取信息条数
            int count=courseList.size();
            //字符串拼接成Layui的table组件能识别的json字符串
            data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
            //输出拼接好的json字符串
            out.println(data);
        }else{//如果传来的值有一个不为空则开始搜索
            String key1="";//初始化key
            String key2="";//初始化key
            key1=request.getParameter("CourseID");
            key2=request.getParameter("CourseName");
            key1="%" + key1 + "%";
            key2="%" + key2 + "%";
            //通过调用dao层方法获取指定搜索条件的用户信息列表
            List<Course> courseList= new CourseInfoImpl().findQuery(key1,key2);
            //使用阿里的fastJson将用户信息列表转换成json字符串
            String data = JSON.toJSONString(courseList);
            //获取信息条数
            int count=courseList.size();
            //字符串拼接成Layui的table组件能识别的json字符串
            data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
            //输出拼接好的json字符串
            out.println(data);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
