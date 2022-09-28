package controller;

import com.alibaba.fastjson.JSON;
import dao.CourseInfoImpl;
import dao.StudyListImpl;
import pojo.Course;
import pojo.StudyList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * 给出所有用户的学习清单信息（可用于后续的整体数据的统计）
 * */
@WebServlet("/FindListServlet")
public class FindListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求的编码
        request.setCharacterEncoding("utf-8");
        //设置响应的编码
        response.setContentType("text/html;charset=utf-8");
        //获取响应字节打印流
        PrintWriter out=response.getWriter();
        //获取传过来的用户email
        String email=request.getParameter("email");
        List<StudyList> sl=new StudyListImpl().findQuery(email);//通过传过来的email来返回用户选择的课程类
        List<Course> course = new ArrayList<Course>();//设置课成集合用于后续操作
        if(sl!=null){
            for(int i=0;i<sl.size();i++){
                course.add((new CourseInfoImpl().findQueryByID(sl.get(i).getCourseID())).get(0));
            }
        }
        //使用阿里的fastJson将用户信息列表转换成json字符串
        String data = JSON.toJSONString(course);
        //获取信息条数
        int count=course.size();
        //字符串拼接成Layui的table组件能识别的json字符串
        data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
        //输出拼接好的json字符串
        out.println(data);
    }
}
