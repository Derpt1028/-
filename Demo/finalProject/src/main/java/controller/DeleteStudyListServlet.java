package controller;

import dao.StudyListImpl;
import dao.UserInfoImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/**
 * 用户将课程从学习清单移除Servlet
 * */
@WebServlet("/DeleteStudyListServlet")
public class DeleteStudyListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取view层传递过来在data参数中定义的待删除的用户CourseID列表
        String email=request.getParameter("email");//获取传过来的用户邮箱
        String[] ulist = request.getParameterValues("CourseID");
        String result="true";//设置默认返回值为真
        for(String S:ulist){
            int del=new StudyListImpl().delete(email,Integer.parseInt(S));
            if(del<0){
                result="false";//如果删除失败则返回false
            }
        }
        response.getWriter().print(result);
    }
}
