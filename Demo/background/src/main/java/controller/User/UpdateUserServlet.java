package controller.User;

import dao.UserInfoImpl;
import pojo.UserInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

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
    }
}
