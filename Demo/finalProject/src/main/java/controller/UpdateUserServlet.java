package controller;

import dao.UserInfoImpl;
import pojo.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

/**
 * 更新用户表数据Servlet
 * */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
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
        //获取响应字节打印流
        PrintWriter out=response.getWriter();
        //实例化用户信息实体类，获取View层输入的数据
        UserInfo user = new UserInfo();
        user.setEmail(request.getParameter("email"));//用户邮箱
        user.setPassword(request.getParameter("password")); //用户密码
        user.setUsername(request.getParameter("username"));//用户名
        user.setBirthday(request.getParameter("birthday"));//用户生日
        user.setNation(request.getParameter("nation"));//国籍
        user.setIdentityID(request.getParameter("id"));//身份证信息

        //调用更新用户的方法
        if(new UserInfoImpl().update(user)>0){
            out.print("success");
        }else{
            out.print("fail");
        }

        //更改用户cookie里的uname的值
        //向用户发送信息Cookie
        //URL编码(防止中文乱码)
        String username=request.getParameter("username");
        String UserEmail=request.getParameter("email");
        username= URLEncoder.encode(username,"utf-8");
        UserEmail= URLEncoder.encode(UserEmail,"utf-8");
        Cookie Uname=new Cookie("Uname",username);
        Cookie UEmail=new Cookie("UEmail",UserEmail);
        //设置Cookie的存活时间
        Uname.setMaxAge(30*24*60*60);//一个月
        UEmail.setMaxAge(30*24*60*60);//一个月
        response.addCookie(Uname);
        response.addCookie(UEmail);
    }
}
