<%@ page import="java.net.URLDecoder" %>
<%@ page import="dao.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="service.getInfoOfCourse"%>
<%@ page import="java.util.List"%>
<%@ page import="pojo.Course"%>
<%@ page import="pojo.UserInfo" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" href="BootStrap/css/bootstrap.min.css">
    <script src="BootStrap/JQuery.js"></script>
    <script src="BootStrap/js/bootstrap.js"></script>
    <!--引用图标-->
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <title>中国高等教育网</title>
    <!--导入css-->
    <link rel="stylesheet" href="UserPage1.css">
    <!--导入外部图标-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<%--接收page属性--%>
<%
    int pageNum;
    if(request.getParameter("page")!=null){
        pageNum=Integer.valueOf(request.getParameter("page"));
    }else{
        pageNum=1;
    }

%>
<%--header标签--%>
<%@include file="commons/header.jsp"%>
<%
    //获取用户的邮箱信息
    List<UserInfo> userinfos = new UserInfoImpl().findQuery(email);
    UserInfo user=userinfos.get(0);%>
<%--购买界面--%>
<div class="container-fluid">
    <div class="row" style="margin-top: 20px">
        <!--左边占8格-->
        <div class="col-lg-8 news_left">
            <!--图文-->
            <div class="row">
                <div class="col-lg-12">
                    <p class="newsTitle"><i class="bi bi-basket"></i>选课列表</p>
                </div>
            </div>


            <%--获取数据库课程信息--%>
            <%
                getInfoOfCourse course=new getInfoOfCourse();
                //返回Course集合
                List<Course> list=course.getInfoOfCourse();
                Course c=list.get((pageNum-1)*3);

            %>
            <div class="row">
                <div class="col-lg-12 news">
                    <div class="card mb-3 newsBody">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                    <img src=<%=c.getimageURL()%>>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h2 class="card-title"><%=c.getCourseName()%></h2>
                                    <p class="card-text"><%=c.getCourseDescription()%></p>
                                    <button type="button" class="btn btn-danger" id="btn1">加入学习清单</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%
                c=list.get((pageNum-1)*3+1);
            %>
            <div class="row">
                <div class="col-lg-12 news">
                    <div class="card mb-3 newsBody">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src=<%=c.getimageURL()%>>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h2 class="card-title"><%=c.getCourseName()%></h2>
                                    <p class="card-text"><%=c.getCourseDescription()%></p>
                                    <button type="button" class="btn btn-danger" id="btn2">加入学习清单</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%
                c=list.get((pageNum-1)*3+2);
            %>
            <div class="row">
                <div class="col-lg-12 news">
                    <div class="card mb-3 newsBody">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src=<%=c.getimageURL()%>>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h2 class="card-title"><%=c.getCourseName()%></h2>
                                    <p class="card-text"><%=c.getCourseDescription()%></p>
                                    <button type="button" class="btn btn-danger" id="btn3">加入学习清单</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>

        <%--右边占4格--%>
        <div class="col-lg-4">
            <ul class="list-group">
                <li class="list-group-item active" aria-current="true">其他服务</li>
                <li class="list-group-item"><button type="button" class="btn btn-warning"><a href="views/myBackground/StudyList.jsp?email=<%=email%>" style="color: black">学习清单</a></button></li>
                <li class="list-group-item"><button type="button" class="btn btn-secondary"><a href="MyCenter.jsp" style="color: black">个人中心</a></button></li>
                <li class="list-group-item"><button type="button" class="btn btn-info"><a href="MyDocument.jsp" style="color: black">个人档案</a></button></li>
                <li class="list-group-item"><button type="button" class="btn btn-success"><a href="https://www.ncss.cn/" target="_blank" style="color: black">个人就业</a></button></li>
                <li class="list-group-item"><button type="button" class="btn btn-danger"><a href="AbroadStudy.jsp" style="color: black">留学申请</a></button></li>

            </ul>
        </div>
    </div>

    <div class="col-lg-12">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item" id="pageBtn1"><a class="page-link" href="UserPage1.jsp?page=<%=pageNum-1%>" id="pageA1">Previous</a></li>
                <li class="page-item" id="pageBtn2"><a class="page-link" href="UserPage1.jsp?page=<%=pageNum%>" id="pageA2"><%=pageNum%></a></li>
                <li class="page-item" id="pageBtn3"><a class="page-link" href="UserPage1.jsp?page=<%=pageNum+1%>" id="pageA3"><%=pageNum+1%></a></li>
                <li class="page-item" id="pageBtn4"><a class="page-link" href="UserPage1.jsp?page=<%=pageNum+2%>" id="pageA4"><%=pageNum+2%></a></li>
                <li class="page-item" id="pageBtn5"><a class="page-link" href="UserPage1.jsp?page=<%=pageNum+1%>" id="pageA5">Next</a></li>
            </ul>
        </nav>
    </div>

</div>

<%--footer标签--%>
<%@include file="commons/footer.jsp"%>
<script>
    $("#btn1").click(function (){
<%--        <%--%>
<%--            if(Username.equals("未登陆用户")){--%>
<%--            //如果是未登录用户，则返回登陆界面--%>
<%--            response.sendRedirect("./UnLoginIn.html");--%>
<%--            }--%>
<%--        %>--%>
        <c:if test="${Username=='未登录用户'}">
            <%response.sendRedirect("./UnLoginIn.html");%>
        </c:if>
        $.ajax({
            type:"post",
            url:"AddToStuList",
            data:{
                email:"<%=user.getEmail()%>"//传过去用户的邮箱号
                ,CourseID: 1//传过去选择的课程ID
                ,pageNum:<%=pageNum%>//传过去当前页数
            },
            success:function (result){
                if(result=="true"){
                    alert("添加课程成功");
                }else{
                    alert("课程已经在学习清单中！");
                }
            },
            error:function (){
                alert("操作错误，请联系管理员!")
            },
        });
    });
    $("#btn2").click(function (){
<%--        <%--%>
<%--            if(Username.equals("未登陆用户")){--%>
<%--            //如果是未登录用户，则返回登陆界面--%>
<%--            response.sendRedirect("./UnLoginIn.html");--%>
<%--            }--%>
<%--        %>--%>
        <c:if test="${Username=='未登录用户'}">
        <%response.sendRedirect("./UnLoginIn.html");%>
        </c:if>
        $.ajax({
            type:"post",
            url:"AddToStuList",
            data:{
                email:"<%=user.getEmail()%>"//传过去用户的邮箱号
                ,CourseID: 2//传过去选择的课程ID
                ,pageNum:<%=pageNum%>//传过去当前页数
            },
            success:function (result){
                if(result=="true"){
                    alert("添加课程成功");
                }else{
                    alert("课程已经在学习清单中！");
                }
            },
            error:function (){
                alert("操作错误，请联系管理员!")
            },
        });
    });
    $("#btn3").click(function (){
<%--        <%--%>
<%--            if(Username.equals("未登陆用户")){--%>
<%--            //如果是未登录用户，则返回登陆界面--%>
<%--            response.sendRedirect("./UnLoginIn.html");--%>
<%--            }--%>
<%--        %>--%>
        <c:if test="${Username=='未登录用户'}">
        <%response.sendRedirect("./UnLoginIn.html");%>
        </c:if>
        $.ajax({
            type:"post",
            url:"AddToStuList",
            data:{
                email:"<%=user.getEmail()%>"//传过去用户的邮箱号
                ,CourseID: 3//传过去选择的课程ID
                ,pageNum:<%=pageNum%>//传过去当前页数
            },
            success:function (result){
                if(result=="true"){
                    alert("添加课程成功");
                }else{
                    alert("课程已经在学习清单中！");
                }
            },
            error:function (){
                alert("操作错误，请联系管理员!")
            },
        });
    });

    var pageNum=<%=pageNum%>;
    if(pageNum==1){
        //更改分页状态为禁用
        document.getElementById("pageBtn1").setAttribute('class','page-item disabled');
        document.getElementById("pageA1").setAttribute('href','#');
    }
    if(pageNum==4){
        //更改分页状态为禁用
        document.getElementById("pageBtn4").setAttribute('class','page-item disabled');
        document.getElementById("pageA4").setAttribute('href','#');
        // document.getElementById("pageBtn4").className="page-item disabled";
    }
    if(pageNum==5){
        document.getElementById("pageBtn3").setAttribute('class','page-item disabled');
        document.getElementById("pageA3").setAttribute('href','#');
        document.getElementById("pageBtn4").setAttribute('class','page-item disabled');
        document.getElementById("pageA4").setAttribute('href','#');
        document.getElementById("pageBtn5").setAttribute('class','page-item disabled');
        document.getElementById("pageA5").setAttribute('href','#');
    }
</script>
</body>
</html>
