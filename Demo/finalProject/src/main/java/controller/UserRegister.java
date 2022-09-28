package controller;

import dao.DatabaseConnection;
import dao.UserInfoImpl;
import pojo.UserInfo;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 用户注册Servlet
 * */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求的编码
        request.setCharacterEncoding("utf-8");
        //设置响应的编码
        response.setContentType("text/html;charset=utf-8");
        //获取传过来的信息
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String username=request.getParameter("username");
        String birthday=request.getParameter("birthday");
        DatabaseConnection dc=new DatabaseConnection();
        Connection cc=dc.getConnection();
        //创造执行环境
        try {
            Statement statement=cc.createStatement();
            //先验证账号是否存在
            ResultSet result=statement.executeQuery("select * from user");
            boolean ifExists=false;//默认账号不存在
            while(result.next()){
                if(email.equals("")){
                    //如果注册号为空
//                    System.out.println(request.getRemoteAddr()+"注册失败,账号为空");
                    response.setContentType("text/html;charset=utf-8");
                    PrintWriter out=response.getWriter();
                    out.print("<script language='javascript'>alert('注册失败,账号不能为空');window.location.href='project.jsp';</script>");
                    ifExists=true;
                    break;
                }
                if(password.equals("")){
                    //如果注册密码为空
//                    System.out.println(request.getRemoteAddr()+"注册失败,密码为空");
                    response.setContentType("text/html;charset=utf-8");
                    PrintWriter out=response.getWriter();
                    out.print("<script language='javascript'>alert('注册失败,密码为空');window.location.href='project.jsp';</script>");
                    ifExists=true;
                    break;
                }
                if(result.getString("email").equals(email)){
                    //验证失败
//                    System.out.println(request.getRemoteAddr()+"注册失败,账号已存在");
                    response.setContentType("text/html;charset=utf-8");
                    PrintWriter out=response.getWriter();
                    out.print("<script language='javascript'>alert('注册失败,账号已存在');window.location.href='project.jsp';</script>");
                    ifExists=true;
                }
            }
            if(!ifExists){
                //注册成功,插入数据
//                statement.executeUpdate("insert into user values ("+
//                        "\'"+ email+"\'"
//                        +",\'"+ password+"\'"
//                        +",\'"+ username+"\'"
//                        +",\'"+ birthday+"\'"
//                        +",\'"+ ""+"\'"
//                        +",\'"+""+"\');");
                int n=new UserInfoImpl().addWhenRegister(new UserInfo(email,password,username,birthday));
//                System.out.println(request.getRemoteAddr()+"注册成功");
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out=response.getWriter();
                out.print("<script language='javascript'>alert('注册成功！');window.location.href='project.jsp';</script>");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
