<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学历认证</title>
</head>
<body>
<!--header标签-->
<%@include file="commons/header.jsp"%>
<div class="container" style="margin-bottom: 50px">
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
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-3"><h5>请输入查询信息的身份证:</h5></span><span class="col-lg-6"><h5><input id="id" type="text" style="width: 80%"></h5></span>
                    <span class="col-lg-3"><button type="button" id="submit1" class="btn btn-primary">确定</button></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--footer标签-->
<%@include file="commons/footer.jsp"%>

<script>
    $("#submit1").click(function (){
        close();
        open("EduIdentityInfo.jsp?id="+$("#id").val());
    })
</script>
</body>
</html>
