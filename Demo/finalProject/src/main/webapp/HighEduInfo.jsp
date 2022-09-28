<%@ page import="pojo.UserInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page import="pojo.EduInfo" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>高等教育信息</title>
</head>
<body>
<%--header标签--%>
<%@include file="commons/header.jsp"%>
<%
    //先通过传过来的Email获取该用户的身份证
    List<UserInfo> userinfos = new UserInfoImpl().findQuery(email);
    String uIdentity=userinfos.get(0).getIdentityID();
    EduInfo uInfo=new EduInfo();//初始化EduInfo对象
    if(uIdentity==null||uIdentity.equals("null")){
        //如果得不到用户的身份证信息,提示用户先绑定身份证信息
        response.sendRedirect("FindNoID.html");
    }else{
        //通过得到的身份证信息来得到特定的受教育信息
        List<EduInfo> eduInfos=new UserInfoImpl().findQueryOfEduInfo(uIdentity);
        //判断用户身份证信息数据库是否存在
        if(eduInfos==null||eduInfos.size()==0){
            //如果不存在则跳转到相应的提示页面
            response.sendRedirect("NoData.jsp");
        }else{
            //如果存在则归为存在
            uInfo=eduInfos.get(0);
        }
    }


%>


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
    <div class="col-lg-9" >
        <div class="panel panel-default" >
            <div class="panel-body" id="info">
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">身份证:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getIdentityID()%></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">学历:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getDegree()%></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">毕业院校:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getSchool()%></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">姓名:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getName()%></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">学习形式:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getStudyType()%></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">学制:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getStudyTime()%></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 50px" class="col-lg-12">
                    <span class="col-lg-4">专业:</span><span class="col-lg-8" style="padding-left: 30px"><%=uInfo.getMajor()%></span>
                </div>
                <!--留一行用于打印时添加认证图片-->
                <img id="authentication" src="resource/authentication.png" style="height: 100px;width: 100px;float: right">
            </div>
        </div>
        <div><center><button type="button" class="btn btn-success" style="width: 15%" id="print">打印</button></center></div>
<%--        <div id="test"><button>test</button></div>--%>
    </div>
</div>
<script>
    $("#print").click(function (){
        // $("#authentication").attr('src',"resource/authentication.png");
        //（1）首先获得元素的html内容（这里建议如果有样式最好是用内联样式的方式）
        var newstr = document.getElementById("info").innerHTML;//得到需要打印的元素HTML
        //（2）保存当前页面的整个html，因为window.print()打印操作是打印当前页的所有内容，所以先将当前页面保存起来，之后便于恢复。
        var oldstr = document.body.innerHTML;//保存当前页面的HTML
        //（3）把当前页面替换为打印内容HTML
        document.body.innerHTML = newstr;
        //（4）执行打印操作
        window.print();
        //（5）还原当前页面
        document.body.innerHTML = oldstr;
        // (6) 刷新当前页面
        location.reload();
    })
    // $("#test").click(function (){
    //     $("#authentication").attr('src',"resource/authentication.png");
    // })
</script>
<%--footer标签--%>
<%@include file="commons/footer.jsp"%>
</body>
</html>
