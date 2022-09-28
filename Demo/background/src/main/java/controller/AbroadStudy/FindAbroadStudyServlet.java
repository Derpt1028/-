package controller.AbroadStudy;

import com.alibaba.fastjson.JSON;
import dao.AbroadStudyImpl;
import pojo.AbroadStudy;
import pojo.UserInfo;
import service.UserInfoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 获得用户出国申请信息Servlet
 * */
@WebServlet("/FindAbroadStudyServlet")
public class FindAbroadStudyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置请求的编码
        req.setCharacterEncoding("utf-8");
        //设置响应的编码
        resp.setContentType("text/html;charset=utf-8");
        //获取响应字节打印流
        PrintWriter out=resp.getWriter();

        //通过调用service层方法获取所有申请信息列表
        List<AbroadStudy> userList= new AbroadStudyImpl().findAll();
        //使用阿里的fastJson将用户信息列表转换成json字符串
        String data = JSON.toJSONString(userList);
//        System.out.println(data);
        //获取信息条数
        int count=userList.size();
        //字符串拼接成Layui的table组件能识别的json字符串
        data="{\"code\": 0,\"msg\": \"\",\"count\": "+count+",\"data\":"+data+"}";
        //输出拼接好的json字符串
        out.println(data);
    }
}
