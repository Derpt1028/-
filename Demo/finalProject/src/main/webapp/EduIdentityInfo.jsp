<%@ page import="pojo.EduInfo" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学历认证信息页面</title>
</head>
<body>
<%--header标签--%>
<%@include file="commons/header.jsp"%>
<%
    //先通过传过来的Id获取该用户的身份证
    String uIdentity=request.getParameter("id");
    //通过得到的身份证信息来得到特定的信息
    List<EduInfo> eduInfos=new UserInfoImpl().findQueryOfEduInfo(uIdentity);
    //判断用户身份证信息数据库是否存在
    boolean ifExist=false;//默认不存在
    EduInfo uInfo=new EduInfo();//初始化EduInfo对象
    if(eduInfos.size()>0){
        //如果存在则归为存在
        ifExist=true;
        uInfo=eduInfos.get(0);
    }
    if(!ifExist){
        //如果不存在则跳转到相应的提示页面
        response.sendRedirect("NoData.jsp");
    }
%>
<div class="container">
    <div class="col-lg-3">
        <div class="panel panel-default" style="margin-bottom: 0"><!--将上下连接起来-->
            <div class="panel-body">
                <a href="MyCenter.jsp"><button type="button" class="btn btn-info" style="width: 100%">账号信息</button></a>
            </div>
        </div>
        <div class="panel panel-default" style="margin-bottom: 0">
            <div class="panel-body">
                <a href="UserPage1.jsp?page=1"><button type="button" class="btn btn-secondary" style="width: 100%"><i class="bi bi-arrow-return-left"></i>返回至主页</button></a>
            </div>
            <div class="panel-body">
                <a href="HighEduInfo.jsp"><button type="button" class="btn btn-secondary" style="width: 100%"><i class="bi bi-mortarboard"></i>高等教育信息</button></a>
            </div>
            <div class="panel-body">
                <a href="https://xz.chsi.com.cn/survey/index.action" target="_blank"><button type="button" class="btn btn-secondary" style="width: 100%"><i class="bi bi-check-circle"></i>个人测评</button></a>
            </div>
            <div class="panel-body">
                <a href="EduIdentity.jsp"><button type="button" class="btn btn-secondary" style="width: 100%"><i class="bi bi-book-fill"></i>学历认证</button></a>
            </div>


        </div>
    </div>
    <div class="col-lg-9">
        <div class="panel panel-default">
            <div class="panel-body">
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>身份证:</h4></span><span class="col-lg-4"><h5><%=uInfo.getIdentityID()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>学历:</h4></span><span class="col-lg-4"><h5><%=uInfo.getDegree()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>毕业院校:</h4></span><span class="col-lg-4"><h5><%=uInfo.getSchool()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>姓名:</h4></span><span class="col-lg-4"><h5><%=uInfo.getName()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>学习形式:</h4></span><span class="col-lg-4"><h5><%=uInfo.getStudyType()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>学制:</h4></span><span class="col-lg-4"><h5><%=uInfo.getStudyTime()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>专业:</h4></span><span class="col-lg-4"><h5><%=uInfo.getMajor()%></h5></span><span class="col-lg-4"><h5></h5></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--footer标签-->
<%@include file="commons/footer.jsp"%>
</body>
</html>
