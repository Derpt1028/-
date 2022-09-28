<%@ page import="java.net.URLDecoder" %>
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
    <%--导入表单验证的bootstrap插件--%>
    <link href="BootStrap/css/bootstrapValidator.min.css" rel="stylesheet">
    <script src="BootStrap/js/bootstrapValidator.min.js"></script>
    <!--引用图标-->
    <link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
    <title>中国高等教育网</title>
    <!--导入css-->
    <link rel="stylesheet" href="./UserPage1.css">
    <!--导入外部图标-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default" id="navigationBar">
    <div class="container-fluid">
        <!-- 品牌图标-->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="project.jsp"><img alt="Brand" src="resource/Brand.png" id="brand"></a>
        </div>

        <!--一些组件-->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="https://gaokao.chsi.com.cn/" target="_blank">阳光高考 <span class="sr-only">(current)</span></a></li>
                <li ><a href="https://www.gfbzb.gov.cn/" target="_blank">全国征兵网</a></li>
                <li ><a href="https://yz.chsi.com.cn/" target="_blank">研招</a></li>
                <li ><a href="https://www.gatzs.com.cn/" target="_blank">港澳台招生</a></li>
                <li ><a href="https://www.chsi.com.cn/" target="_blank">学职平台</a></li>
                <li ><a href="https://www.cnki.net/" target="_blank">中国知网</a></li>

                <!--其他同学的链接-->
                <%--                <li class="dropdown">--%>
                <%--                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">其他同学的链接<span class="caret"></span></a>--%>
                <%--                    <ul class="dropdown-menu">--%>
                <%--                        <li><a href="http://120.24.168.75/homework/home_1.html" target="_blank">刘宇阳同学的链接</a></li>--%>
                <%--                        <li><a href="http://124.221.127.163/project/html/html2.html" target="_blank">林茂林同学的链接</a></li>--%>
                <%--                        <li><a href="http://124.223.198.233:8080/zzw/index">周梓文同学的链接</a></li>--%>
                <%--                        <li role="separator" class="divider"></li>--%>
                <%--                        <li><a href="#">Separated link</a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>

                <!--下拉条-->
                <!--                    <li class="dropdown">-->
                <!--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">下拉条 <span class="caret"></span></a>-->
                <!--                        <ul class="dropdown-menu">-->
                <!--                            <li><a href="#">Action</a></li>-->
                <!--                            <li><a href="#">Another action</a></li>-->
                <!--                            <li><a href="#">Something else here</a></li>-->
                <!--                            <li role="separator" class="divider"></li>-->
                <!--                            <li><a href="#">Separated link</a></li>-->
                <!--                            <li role="separator" class="divider"></li>-->
                <!--                            <li><a href="#">One more separated link</a></li>-->
                <!--                        </ul>-->
                <!--                    </li>-->
            </ul>
            <!--                    搜索栏-->
            <!--                <form class="navbar-form navbar-left" id="search">-->
            <!--                    <div class="form-group">-->
            <!--                        <input type="text" class="form-control" placeholder="Search">-->
            <!--                    </div>-->
            <!--                    <button type="submit" class="btn btn-default">提交</button>-->
            <!--                </form>-->


            <ul class="nav navbar-nav navbar-right">
                <button type="button" class="btn btn-primary" style="margin-left: 25px;margin-bottom: 5px">
                    <a href="quitLoginIn" style="color: white">退出登陆</a>
                </button>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>
