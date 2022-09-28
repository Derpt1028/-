package controller;


import dao.StudyListImpl;
import pojo.StudyList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 用户添加课程至学习清单servlet
 * */
@WebServlet("/AddToStuList")
public class AddToStuList extends HttpServlet {
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
        //实例化信息实体类，获取View层输入的数据,并存放在类中
        String email=request.getParameter("email");//获取传过来的邮箱
        int CourseID=Integer.parseInt(request.getParameter("CourseID"));//获取传过来的课程ID
        int pageNum=Integer.parseInt(request.getParameter("pageNum"));//获取传过来的页码
        CourseID=CourseID+(pageNum-1)*3;
        StudyList sl=new StudyList(email,CourseID);

        //调用插入数据的add方法，根据返回的n值来判断插入是否成功
        boolean flag=false;//建立返回是否添加成功的判断条件
        if(new StudyListImpl().add(sl)>0){
            flag=true;
            out.print(flag);
        }else{
            out.print(flag);
        }

    }
}
