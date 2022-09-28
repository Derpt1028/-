package controller.User;

import dao.UserInfoImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/DelUserServlet")
public class DelUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取view层传递过来在data参数中定义的待删除的用户Email列表
        String[] ulist = request.getParameterValues("email");
        String result="true";//设置默认返回值为真
        for(String S:ulist){
            int del=new UserInfoImpl().delete(S);
            if(del<0){
                result="false";//如果删除失败则返回false
            }
        }
        response.getWriter().print(result);

    }
}
