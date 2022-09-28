package controller;

import dao.AbroadStudyImpl;
import dao.UserInfoImpl;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import pojo.AbroadStudy;
import pojo.UserInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

/**
 * 用户提交出国申请的servlet，同时该servlet发送申请已被提交的邮箱
 * */
@WebServlet("/SubmitAbroadStudyServlet")
public class SubmitAbroadStudyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取传过来的参值
        String identityID=request.getParameter("identityID");//获取用户身份证号
        String Name=request.getParameter("Name");//获取用户真实姓名
        String SchoolName=request.getParameter("SchoolName");//获取用户选择的院校姓名
        String Result="待审批";//设置请求结果默认的值为待审批
        int add=new AbroadStudyImpl().add(new AbroadStudy(identityID,Name,SchoolName,Result));
        //判断添加是否成功
        String actionResult="false";//设置操作结果默认为未成功
        if(add>0){
            actionResult="success";
        }

        //根据用户id查找用户的身份证
        List<UserInfo> userinfos =new UserInfoImpl().findQueryById(identityID);
        if(userinfos!=null){
            //获取用户的邮箱号码
            String Useremail=userinfos.get(0).getEmail();
            //发送普通邮件
            SimpleEmail email = new SimpleEmail();
            email.setHostName("smtp.163.com");// 设置使用发电子邮件的邮件服务器，这里以qq邮箱为例（其它例如：【smtp.163.com】，【smtp.sohu.com】）
            try {
                // 收件人邮箱
                email.addTo(Useremail);
                // 邮箱服务器身份验证
                email.setAuthentication("ZZT13975857929@163.com", "GEFSINGIPFZTKEAF");
                // 发件人邮箱
                email.setFrom("ZZT13975857929@163.com");
                // 邮件主题
                email.setSubject("申请提交通知");
                // 邮件内容
                email.setMsg("你好:"+Name+"，你申请的院校："+SchoolName+"的申请已经成功提交，请留意邮箱，申请结果将在五个工作日内告知!");
                // 发送邮件
                email.send();
                actionResult="success";//发送邮件操作成功!
            } catch (EmailException ex) {
                ex.printStackTrace();
            }
        }

        response.getWriter().print(actionResult);
    }
}
