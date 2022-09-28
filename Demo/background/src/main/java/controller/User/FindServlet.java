package controller.User;

import com.alibaba.fastjson.JSON;
import dao.UserInfoImpl;
import pojo.UserInfo;
import service.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置请求的编码
        req.setCharacterEncoding("utf-8");
        //设置响应的编码
        resp.setContentType("text/html;charset=utf-8");
        //获取响应字节打印流
        PrintWriter out=resp.getWriter();

        if(req.getParameter("email")==null){
            //如果传过来的值为空
            //通过调用service层方法获取所有用户信息列表
            List<UserInfo> userList= new UserInfoServiceImpl().findAll();
            //使用阿里的fastJson将用户信息列表转换成json字符串
            String data = JSON.toJSONString(userList);
//        System.out.println(data);
            //获取信息条数
            int count=userList.size();
            //字符串拼接成Layui的table组件能识别的json字符串
            data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
            //输出拼接好的json字符串
            out.println(data);
        }else{
            String key=req.getParameter("email");
            key="%" + key + "%";
            //通过调用dao层方法获取指定搜索条件的用户信息列表
            List<UserInfo> userList= new UserInfoImpl().findQuery(key);
            //使用阿里的fastJson将用户信息列表转换成json字符串
            String data = JSON.toJSONString(userList);
            //获取信息条数
            int count=userList.size();
            //字符串拼接成Layui的table组件能识别的json字符串
            data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
            //输出拼接好的json字符串
            out.println(data);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}