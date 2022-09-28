<%@ page import="pojo.UserInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>
<body>
<%--header标签--%>
<%@include file="commons/header.jsp"%>
<!--代码-->
<%
    //根据一开始存入的email来获取用户信息
    List<UserInfo> userinfos = new UserInfoImpl().findQuery(email);
    UserInfo user=userinfos.get(0);
    //判断信息完整度(共六项信息)
    int info=0;
    String nation="";
    String id="";
    if(!user.getEmail().equals("")&&!user.getEmail().equals("null")){
        info++;
    }
    if(!user.getPassword().equals("")&&!user.getPassword().equals("null")){
        info++;
    }
    if(!user.getBirthday().equals("")&&!user.getBirthday().equals("null")){
        info++;
    }
    if(!user.getUsername().equals("")&&!user.getUsername().equals("null")){
        info++;
    }
    if(user.getNation()!=null){
        if(!user.getNation().equals("")&&!user.getNation().equals("null")){
            nation=user.getNation();
            info++;
        }
    }
    if(user.getIdentityID()!=null){
        if(!user.getIdentityID().equals("")&&!user.getIdentityID().equals("null")){
            id=user.getIdentityID();
            info++;
        }
    }

    float infoComplete;//表示信息完整度%
    DecimalFormat decimalFormat = new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足
    if(info==0){
        infoComplete=0;
    }else{
        infoComplete=(float) info/6*100;
    }
    String infoComplete1 = decimalFormat.format(infoComplete);//返回字符串
    String InfoComplete=infoComplete1+"%";//字符串信息来表示信息完成度

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
                    <div style="background: #eaeaea;padding-top: 2px;padding-bottom: 2px;border-radius: 7px">
                        <!--账号完成度信息-->
                        <h4>账号完成度：</h4>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: <%=InfoComplete%>" aria-valuenow=<%=infoComplete%> aria-valuemin="0" aria-valuemax="100"><%=InfoComplete%></div>
                        </div>
                        <h5>建议您完善高等教育网账号信息，以便于进行研招推免/统考、自主招生、兵役登记/应征报名、大创网等系统的相关操作。</h5>
                    </div>
                    <!--用户基本信息-->
                    <br>
                    <div style="border-bottom: 1px solid #eaeaea;border-top: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                        <span class="col-lg-4"><h4>用户邮箱:</h4></span><span class="col-lg-4"><h5><%=user.getEmail()%></h5></span><span class="col-lg-4"><h5></h5></span>
                    </div>
                    <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                        <span class="col-lg-4"><h4>密码:</h4></span><span class="col-lg-4"><h5><%=user.getPassword()%></h5></span><span class="col-lg-4"><a href="" class="edit"><h5>修改</h5></a></span>
                    </div>
                    <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                        <span class="col-lg-4"><h4>用户名:</h4></span><span class="col-lg-4"><h5><%=user.getUsername()%></h5></span><span class="col-lg-4"><a href="" class="edit"><h5>修改</h5></a></span>
                    </div>
                    <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                        <span class="col-lg-4"><h4>生日:</h4></span><span class="col-lg-4"><h5><%=user.getBirthday()%></h5></span><span class="col-lg-4"><a href="" class="edit"><h5>修改</h5></a></span>
                    </div>
                    <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                        <span class="col-lg-4"><h4>国籍:</h4></span><span class="col-lg-4"><h5><%=nation%></h5></span><span class="col-lg-4"><a href="" class="edit"><h5>修改</h5></a></span>
                    </div>
                    <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                        <span class="col-lg-4"><h4>身份证号码:</h4></span><span class="col-lg-4"><h5><%=id%></h5></span><span class="col-lg-4"><a href="" class="edit"><h5>修改</h5></a></span>
                    </div>

                </div>
            </div>
        </div>
    </div>



<%--footer标签--%>
<%@include file="commons/footer.jsp"%>
<!--JS代码-->
<script>
    $(".edit").click(function (){
        open("UpdateUserInfo.jsp?email="+"<%=user.getEmail()%>");
    })
</script>
</body>
</html>
