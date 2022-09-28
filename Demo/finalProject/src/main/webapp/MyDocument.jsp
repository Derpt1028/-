<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人档案</title>
</head>
<body>
<%--header标签--%>
<%@include file="commons/header.jsp"%>

    <div class="container">
        <div class="col-lg-12" style="margin-bottom: 10px">
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="HighEduInfo.jsp?email="+<%=email%> target="_blank"><button type="button" class="btn btn-success" style="width: 33%"><i class="bi bi-mortarboard"></i>高等教育信息</button></a>
                    <a href="EduIdentity.jsp"><button type="button" class="btn btn-success" style="width: 33%"><i class="bi bi-book-fill"></i>学历认证</button></a>
                    <a href="https://xz.chsi.com.cn/survey/index.action" target="_blank"><button type="button" class="btn btn-success" style="width: 33%"><i class="bi bi-check-circle"></i>个人测评</button></a>
                </div>
            </div>
           </div>
    </div>

<%@include file="Questionnaire.jsp"%>


<%--footer标签--%>
<%@include file="commons/footer.jsp"%>


</body>
</html>
