package controller.AbroadStudy;

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
 * 经管理员确认后申请通过
 */
@WebServlet( "/pass")
public class pass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionResult="false";//设置操作的完成结果默认为false
        String identityID=request.getParameter("identityID");
        String Name=request.getParameter("Name");
        String SchoolName=request.getParameter("SchoolName");
        String Result=request.getParameter("Result");

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
                email.setSubject("院校申请结果");
                // 邮件内容
                email.setMsg("恭喜你!"+Name+"，你申请的院校："+SchoolName+"的申请结果为通过!");
                // 发送邮件
                email.send();
                actionResult="success";//发送邮件操作成功!
            } catch (EmailException ex) {
                ex.printStackTrace();
            }

            //然后更改数据表里的信息
            int update=new AbroadStudyImpl().update(new AbroadStudy(identityID,Name,SchoolName,Result));
            if(update<0){
                actionResult="false";
            }
        }
        response.getWriter().print(actionResult);
    }
}
