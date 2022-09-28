package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/**
 * 用户退出登陆，删除网站保存的cookie的servlet
 * */
@WebServlet("/quitLoginIn")
public class QuitLoginIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //退出登陆Servlet
        //删除Cookie
        Cookie rememberEmail=new Cookie("rememberEmail","");
        Cookie rememberPassword=new Cookie("rememberPassword","");
        Cookie Uname=new Cookie("Uname","");
        rememberEmail.setMaxAge(0);//删除Cookie
        rememberPassword.setMaxAge(0);//删除Cookie
        Uname.setMaxAge(0);//删除Cookie
        response.addCookie(rememberEmail);//设置Cookie
        response.addCookie(rememberPassword);
        response.addCookie(Uname);
        //重定向
        response.sendRedirect("./project.jsp");
    }
}
