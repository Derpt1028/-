package controller;

import dao.DatabaseConnection;
import dao.UserInfoImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 用户从网站首页表单提交的信息进入此Servlet，经过验证后进入用户页面
 * */
@WebServlet("/UserLoginIn")
public class UserLoginIn extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //经验证，可以与project.html连接上
        //获取传过来的信息
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String rememberMe=request.getParameter("rememberMe");//判断用户是否点击了记住我(如果点击了返回on)
        DatabaseConnection dc=new DatabaseConnection();
        Connection cc=dc.getConnection();
        //创造执行环境
        try {
            Statement statement=cc.createStatement();
            //先验证账号是否存在
            ResultSet result=statement.executeQuery("select * from user");
            boolean ifExists=false;//默认账号不存在
            while(result.next()){
                if(result.getString("email").equals(email)&&result.getString("password").equals(password)){
                    //验证成功

//                    System.out.println(request.getRemoteAddr()+"验证成功");

                    response.setContentType("text/html;charset=utf-8");
                    String username=result.getString("username");//获取用户用户名
                    String UserEmail=result.getString("email");//获取用户邮箱（唯一标识码）
                    //设置用户登陆时间

                    Date date = new Date();
                    SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    int flag=new UserInfoImpl().updateLastLoginIn(UserEmail,dateFormat.format(date));

                    ifExists=true;
                    //向用户发送信息Cookie
                    //URL编码(防止中文乱码)
                    username= URLEncoder.encode(username,"utf-8");
                    UserEmail= URLEncoder.encode(UserEmail,"utf-8");
                    Cookie Uname=new Cookie("Uname",username);
                    Cookie UEmail=new Cookie("UEmail",UserEmail);
                    //设置Cookie的存活时间
                    Uname.setMaxAge(30*24*60*60);//一个月
                    UEmail.setMaxAge(30*24*60*60);//一个月
                    response.addCookie(Uname);
                    response.addCookie(UEmail);

                    //判断有没有记住我，如果有的话设置记住我Cookie，没有的话则删除记住我Cookie
                    if("on".equals(rememberMe)){
                        //点击了记住我
                        Cookie rememberEmail=new Cookie("rememberEmail",email);
                        Cookie rememberPassword=new Cookie("rememberPassword",password);
                        rememberEmail.setMaxAge(30*24*60*60);//一个月保存时间
                        rememberPassword.setMaxAge(30*24*60*60);//一个月保存时间
                        response.addCookie(rememberEmail);//设置Cookie
                        response.addCookie(rememberPassword);
                    }else{
                        //没有点击记住我则删掉Cookie
                        Cookie rememberEmail=new Cookie("rememberEmail",email);
                        Cookie rememberPassword=new Cookie("rememberPassword",password);
                        rememberEmail.setMaxAge(0);//删除Cookie
                        rememberPassword.setMaxAge(0);//删除Cookie
                        response.addCookie(rememberEmail);//设置Cookie
                        response.addCookie(rememberPassword);
                    }
                    //跳转到登陆界面(重定向)
                    response.sendRedirect("./UserPage1.jsp?page=1");

                }
            }
            if(!ifExists){
                //验证失败
                System.out.println(request.getRemoteAddr()+"验证失败");
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out=response.getWriter();
                out.print("<script language='javascript'>alert('验证失败！');window.location.href='project.jsp';</script>");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
