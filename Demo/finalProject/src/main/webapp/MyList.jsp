<%@ page import="java.net.URLDecoder" %>
<%@ page import="service.getInfoOfCourse" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Course" %>
<%@ page import="pojo.StudyList" %>
<%@ page import="dao.StudyListImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%@include file="commons/header.jsp"%>
<%
    if(Username.equals("未登陆用户")){
        //如果是未登录用户，则返回登陆界面
        response.sendRedirect("./UnLoginIn.html");
    }
%>
<%
    //获取用户的学习清单
    List<StudyList> sl=new StudyListImpl().findQuery(email);
    //获取总共有多少条信息
    int length=sl.size();
%>
<center><h1><%=Username%>,您的学习清单如下</h1></center><hr>
<div class="panel panel-default">
    <%
        if(length==0){
            //如果长度为0，提示用户未添加任何学习清单
        }
    %>
    <div class="panel-body">
        Basic panel example
    </div>
</div>
<%@include file="commons/footer.jsp"%>
</body>
</html>
