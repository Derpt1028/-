<%@ page import="pojo.UserInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留学申请页面</title>
</head>
<body>
<%@include file="commons/header.jsp"%>
<%
    //获取用户身份证信息(确保用户的身份证和邮箱能够一一对应)
    List<UserInfo> userinfos=new UserInfoImpl().findQuery(email);
    String id="";
    if(userinfos!=null){
        id=userinfos.get(0).getIdentityID();
    }
    if(id==null||id.equals("")){
        response.sendRedirect("FindNoID.html");
    }
%>
<div class="container">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">

                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>身份证信息:</h4></span><span class="col-lg-8"><h5><%=id%></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>真实姓名:</h4></span><span class="col-lg-8"><h5> <input type="text" style="width: 60%;height: 30px" name="name" id="name"></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>所选院校:</h4></span><span class="col-lg-8"><h5><input type="text" style="width: 60%;height: 30px" name="schoolName" id="schoolName" ></h5></span>
                </div>
            </div>
        </div>
        <center><button type="button" class="btn btn-info" id="submit" style="width: 180px;margin-bottom: 5px">提交</button></center>

    </div>
</div>

<%@include file="commons/footer.jsp"%>
<script>
    $("#submit").click(function (){
        //用ajax提交表单数据到Servlet
        $.ajax({
            type:"post",
            url:"SubmitAbroadStudyServlet",
            data:{
                identityID:<%=id%>,
                Name:$("#name").val(),
                SchoolName:$("#schoolName").val(),
            },
            //提交成功回调函数，data为返回的数据
            success: function (data) {
                if (data==="success") {//判断返回值
                    alert("申请成功");
                    location.reload();
                } else {
                    alert("申请失败");
                    location.reload();
                }
            },
            error: function (er) {//提交失败的处理
                alert(er.responseText);
            }
        })
    })
</script>
</body>
</html>
