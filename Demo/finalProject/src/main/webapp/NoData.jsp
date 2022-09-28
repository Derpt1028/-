<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未找到相关信息</title>
</head>
<body>
<%--header标签--%>
<%@include file="commons/header.jsp"%>
<div class="container" style="margin-bottom: 50px">
    <div class="col-lg-4">
        <img src="resource/找不到了.png" alt="找不到了.jpg" class="img-circle">
    </div>
    <div class="col-lg-8" style="margin-top: 20px">
        <h1 style="color: gray">未找到指定身份证的教育信息</h1>
        <br>
        <a href="UserPage1.jsp?page=1"><h5>-点击返回主页面-</h5></a>
    </div>
</div>

<!--footer标签-->
<%@include file="commons/footer.jsp"%>

</body>
</html>
