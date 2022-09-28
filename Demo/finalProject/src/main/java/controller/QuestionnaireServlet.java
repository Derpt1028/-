package controller;

import dao.QuestionnaireImpl;
import pojo.questionnaire;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/QuestionnaireServlet")
public class QuestionnaireServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求的编码
        request.setCharacterEncoding("utf-8");
        //设置响应的编码
        response.setContentType("text/html;charset=utf-8");
        //获取传过来的信息
        String username=request.getParameter("username");//用户姓名
        String major=request.getParameter("major");//用户专业
        String tele=request.getParameter("tele");//联系方式
        String education=request.getParameter("education");//受教育程度
        String age=request.getParameter("age");//年龄
        String majorSatisfaction=request.getParameter("majorSatisfaction");//专业满意度
        String lifeSatisfaction=request.getParameter("lifeSatisfaction");//生活满意度
        String recommendation=request.getParameter("recommendation");//推荐意志
        String advice=request.getParameter("advice");//建议
        //插入数据
        int result=new QuestionnaireImpl().add(new questionnaire(username,major,tele,education,age,majorSatisfaction,lifeSatisfaction,recommendation,advice));
        if(result>0){
            response.getWriter().print("\"<script language='javascript'>alert('问卷提交成功！');window.location.href='MyDocument.jsp';</script>\"");
        }else{
            response.getWriter().print("\"<script language='javascript'>alert('请勿重复提交问卷！');window.location.href='MyDocument.jsp';</script>\"");
        }
    }
}
