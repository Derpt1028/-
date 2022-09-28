<%@ page import="pojo.UserInfo" %>
<%@ page import="dao.UserInfoImpl" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息更改页</title>
</head>
<body>
<%
    String email="";
    if(request.getParameter("email")!=null){
        email=request.getParameter("email");
    }
    //通过调用dao层方法获取指定搜索条件的用户信息列表
    List<UserInfo> userList= new UserInfoImpl().findQuery(email);
    UserInfo user=userList.get(0);
    String nation="";
    String id="";
    if(user.getNation()!=null&&!user.getNation().equals("null")&&!user.getNation().equals("")){
        nation=user.getNation();
    }
    if(user.getIdentityID()!=null&&!user.getIdentityID().equals("null")&&!user.getIdentityID().equals("")){
        id=user.getIdentityID();
    }
%>
<!--header标签-->
<%@include file="commons/header2.jsp" %>
<div class="container">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>用户邮箱:</h4></span><span class="col-lg-8"><h5><%=user.getEmail()%></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>密码:</h4></span><span class="col-lg-8"><h5> <input type="text" style="width: 60%;height: 30px" name="psw" id="psw" value=<%=user.getPassword()%>></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>用户名:</h4></span><span class="col-lg-8"><h5><input type="text" style="width: 60%;height: 30px" name="username" id="name" value=<%=user.getUsername()%>></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>生日:</h4></span><span class="col-lg-8"><h5><input type="date" name="age" id="birthday" value=<%=user.getBirthday()%>></h5></span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>国籍:</h4></span>
                    <span class="col-lg-8">
                        <h5>
                            <select id="nation">
                            <option selected disabled><%=nation%></option>

                            <option value="中国大陆">中国大陆</option>

                            <option value="沙特阿拉伯">沙特阿拉伯</option>

                            <option value="土库曼斯坦">土库曼斯坦</option>

                            <option value="卡塔尔">卡塔尔</option>

                            <option value="尼泊尔">尼泊尔</option>

                            <option value="哈萨克斯坦">哈萨克斯坦</option>

                            <option value="菲律宾">菲律宾</option>

                            <option value="台湾">台湾</option>

                            <option value="布基纳法索">布基纳法索</option>

                            <option value="伊朗">伊朗</option>

                            <option value="哥斯达黎加">哥斯达黎加</option>

                            <option value="厄立特里亚">厄立特里亚</option>

                            <option value="古巴">古巴</option>

                            <option value="多米尼加共和国">多米尼加共和国</option>

                            <option value="墨西哥">墨西哥</option>

                            <option value="尼加拉瓜">尼加拉瓜</option>

                            <option value="巴拿马">巴拿马</option>

                            <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                            <option value="萨尔瓦多">萨尔瓦多</option>

                            <option value="英属维尔京群岛">英属维尔京群岛</option>

                            <option value="波多黎各">波多黎各</option>

                            <option value="美属维尔京群岛">美属维尔京群岛</option>

                            <option value="圣多美和普林西比">圣多美和普林西比</option>

                            <option value="安圭拉(英)">安圭拉(英)</option>

                            <option value="圣卢西亚">圣卢西亚</option>

                            <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                            <option value="荷属安德列斯">荷属安德列斯</option>

                            <option value="瓜德罗普">瓜德罗普</option>

                            <option value="洪都拉斯">洪都拉斯</option>

                            <option value="危地马拉">危地马拉</option>

                            <option value="格鲁吉亚">格鲁吉亚</option>

                            <option value="亚美尼亚">亚美尼亚</option>

                            <option value="阿塞拜疆">阿塞拜疆</option>

                            <option value="安哥拉">安哥拉</option>

                            <option value="白俄罗斯">白俄罗斯</option>

                            <option value="俄罗斯联邦">俄罗斯联邦</option>

                            <option value="乌克兰">乌克兰</option>

                            <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                            <option value="匈牙利">匈牙利</option>

                            <option value="冰岛">冰岛</option>

                            <option value="马耳他">马耳他</option>

                            <option value="摩纳哥">摩纳哥</option>

                            <option value="挪威">挪威</option>

                            <option value="罗马尼亚">罗马尼亚</option>

                            <option value="利比亚">利比亚</option>

                            <option value="圣马力诺">圣马力诺</option>

                            <option value="瑞典">瑞典</option>

                            <option value="瑞士">瑞士</option>

                            <option value="爱沙尼亚">爱沙尼亚</option>

                            <option value="拉脱维亚">拉脱维亚</option>

                            <option value="立陶宛">立陶宛</option>

                            <option value="摩尔多瓦">摩尔多瓦</option>

                            <option value="土耳其">土耳其</option>

                            <option value="斯洛文尼亚">斯洛文尼亚</option>

                            <option value="捷克共和国">捷克共和国</option>

                            <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                            <option value="斯洛伐克">斯洛伐克</option>

                            <option value="马其顿">马其顿</option>

                            <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                            <option value="梵蒂冈城国">梵蒂冈城国</option>

                            <option value="荷兰">荷兰</option>

                            <option value="克罗地亚">克罗地亚</option>

                            <option value="希腊">希腊</option>

                            <option value="爱尔兰">爱尔兰</option>

                            <option value="比利时">比利时</option>

                            <option value="塞浦路斯">塞浦路斯</option>

                            <option value="塞卜泰">塞卜泰</option>

                            <option value="丹麦">丹麦</option>

                            <option value="英国">英国</option>

                            <option value="德国">德国</option>

                            <option value="法国">法国</option>

                            <option value="意大利">意大利</option>

                            <option value="卢森堡">卢森堡</option>

                            <option value="葡萄牙">葡萄牙</option>

                            <option value="波兰">波兰</option>

                            <option value="西班牙">西班牙</option>

                            <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                            <option value="津巴布韦">津巴布韦</option>

                            <option value="安道尔">安道尔</option>

                            <option value="列支敦士登">列支敦士登</option>

                            <option value="塞黑">塞黑</option>

                            <option value="奥地利">奥地利</option>

                            <option value="保加利亚">保加利亚</option>

                            <option value="芬兰">芬兰</option>

                            <option value="直布罗陀">直布罗陀</option>

                            <option value="多米尼克">多米尼克</option>

                            <option value="百慕大">百慕大</option>

                            <option value="加拿大">加拿大</option>

                            <option value="几内亚">几内亚</option>

                            <option value="美国">美国</option>

                            <option value="格陵兰">格陵兰</option>

                            <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                            <option value="汤加">汤加</option>

                            <option value="澳大利亚">澳大利亚</option>

                            <option value="库克群岛">库克群岛</option>

                            <option value="瑙鲁">瑙鲁</option>

                            <option value="新喀里多尼亚">新喀里多尼亚</option>

                            <option value="瓦努阿图">瓦努阿图</option>

                            <option value="所罗门群岛">所罗门群岛</option>

                            <option value="塞拉利昂">塞拉利昂</option>

                            <option value="萨摩亚">萨摩亚</option>

                            <option value="图瓦卢">图瓦卢</option>

                            <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                            <option value="马绍尔群岛">马绍尔群岛</option>

                            <option value="基里巴斯">基里巴斯</option>

                            <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                            <option value="新西兰">新西兰</option>

                            <option value="斐济">斐济</option>

                            <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                            <option value="帕劳共和国">帕劳共和国</option>

                            <option value="喀麦隆">喀麦隆</option>

                            <option value="留尼汪">留尼汪</option>

                            <option value="土阿莫土群岛">土阿莫土群岛</option>

                            <option value="土布艾群岛">土布艾群岛</option>

                            <option value="社会群岛">社会群岛</option>

                            <option value="马克萨斯群岛">马克萨斯群岛</option>

                            <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                            <option value="盖比群岛">盖比群岛</option>

                            <option value="诺福克岛">诺福克岛</option>

                            <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                            <option value="智利">智利</option>

                            <option value="哥伦比亚">哥伦比亚</option>

                            <option value="加蓬">加蓬</option>

                            <option value="法属圭亚那">法属圭亚那</option>

                            <option value="圭亚那">圭亚那</option>

                            <option value="库腊索岛">库腊索岛</option>

                            <option value="巴拉圭">巴拉圭</option>

                            <option value="秘鲁">秘鲁</option>

                            <option value="苏里南">苏里南</option>

                            <option value="委内瑞拉">委内瑞拉</option>

                            <option value="乌拉圭">乌拉圭</option>

                            <option value="厄瓜多尔">厄瓜多尔</option>

                            <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                            <option value="加纳">加纳</option>

                            <option value="阿鲁巴岛">阿鲁巴岛</option>

                            <option value="巴哈马">巴哈马</option>

                            <option value="巴巴多斯">巴巴多斯</option>

                            <option value="开曼群岛">开曼群岛</option>

                            <option value="格林纳达">格林纳达</option>

                            <option value="萨巴">萨巴</option>

                            <option value="海地">海地</option>

                            <option value="牙买加">牙买加</option>

                            <option value="马提尼克">马提尼克</option>

                            <option value="蒙特塞拉特">蒙特塞拉特</option>

                            <option value="坦桑尼亚">坦桑尼亚</option>

                            <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                            <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                            <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                            <option value="英属维尔京群岛">英属维尔京群岛</option>

                            <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                            <option value="圣马丁岛">圣马丁岛</option>

                            <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                            <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                            <option value="阿根廷">阿根廷</option>

                            <option value="伯利兹">伯利兹</option>

                            <option value="马里">马里</option>

                            <option value="玻利维亚">玻利维亚</option>

                            <option value="巴西">巴西</option>

                            <option value="博内尔">博内尔</option>

                            <option value="圣卢西亚">圣卢西亚</option>

                            <option value="索马里">索马里</option>

                            <option value="毛里塔尼亚">毛里塔尼亚</option>

                            <option value="乌干达">乌干达</option>

                            <option value="乍得">乍得</option>

                            <option value="马约特岛">马约特岛</option>

                            <option value="贝宁">贝宁</option>

                            <option value="科摩罗">科摩罗</option>

                            <option value="博茨瓦那">博茨瓦那</option>

                            <option value="塞内加尔">塞内加尔</option>

                            <option value="斯威士兰">斯威士兰</option>

                            <option value="几内亚(比绍)">几内亚(比绍)</option>

                            <option value="民主刚果">民主刚果</option>

                            <option value="中非共和国">中非共和国</option>

                            <option value="莱索托">莱索托</option>

                            <option value="刚果">刚果</option>

                            <option value="南非">南非</option>

                            <option value="马达加斯加">马达加斯加</option>

                            <option value="利比里亚">利比里亚</option>

                            <option value="突尼斯">突尼斯</option>

                            <option value="赞比亚">赞比亚</option>

                            <option value="尼日尔">尼日尔</option>

                            <option value="西撒哈拉">西撒哈拉</option>

                            <option value="多哥">多哥</option>

                            <option value="纳米比亚">纳米比亚</option>

                            <option value="莫桑比克">莫桑比克</option>

                            <option value="梅利利亚">梅利利亚</option>

                            <option value="埃塞俄比亚">埃塞俄比亚</option>

                            <option value="卢旺达">卢旺达</option>

                            <option value="摩洛哥">摩洛哥</option>

                            <option value="马拉维">马拉维</option>

                            <option value="尼日利亚">尼日利亚</option>

                            <option value="佛得角">佛得角</option>

                            <option value="布隆迪">布隆迪</option>

                            <option value="阿尔及利亚">阿尔及利亚</option>

                            <option value="吉布提">吉布提</option>

                            <option value="加那利群岛">加那利群岛</option>

                            <option value="冈比亚">冈比亚</option>

                            <option value="赤道几内亚">赤道几内亚</option>

                            <option value="塞舌尔">塞舌尔</option>

                            <option value="苏丹">苏丹</option>

                            <option value="肯尼亚">肯尼亚</option>

                            <option value="新加坡">新加坡</option>

                            <option value="韩国">韩国</option>

                            <option value="叙利亚">叙利亚</option>

                            <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                            <option value="巴林">巴林</option>

                            <option value="日本">日本</option>

                            <option value="约旦">约旦</option>

                            <option value="越南">越南</option>

                            <option value="科特迪瓦">科特迪瓦</option>

                            <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                            <option value="泰国">泰国</option>

                            <option value="斯里兰卡">斯里兰卡</option>

                            <option value="阿联酋">阿联酋</option>

                            <option value="老挝">老挝</option>

                            <option value="阿富汗">阿富汗</option>

                            <option value="中国澳门">中国澳门</option>

                            <option value="塔吉克斯坦">塔吉克斯坦</option>

                            <option value="朝鲜">朝鲜</option>

                            <option value="巴勒斯坦">巴勒斯坦</option>

                            <option value="埃及">埃及</option>

                            <option value="中国香港">中国香港</option>

                            <option value="伊拉克">伊拉克</option>

                            <option value="黎巴嫩">黎巴嫩</option>

                            <option value="科威特">科威特</option>

                            <option value="文莱">文莱</option>

                            <option value="马尔代夫">马尔代夫</option>

                            <option value="印度尼西亚">印度尼西亚</option>

                            <option value="以色列">以色列</option>

                            <option value="蒙古">蒙古</option>

                            <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                            <option value="毛里求斯">毛里求斯</option>

                            <option value="阿曼">阿曼</option>

                            <option value="印度">印度</option>

                            <option value="缅甸">缅甸</option>

                            <option value="马来西亚">马来西亚</option>

                            <option value="东帝汶">东帝汶</option>

                            <option value="也门共和国">也门共和国</option>

                            <option value="不丹">不丹</option>

                            <option value="柬埔寨">柬埔寨</option>

                            <option value="巴基斯坦">巴基斯坦</option>

                            <option value="孟加拉国">孟加拉国</option>
                        </select>
                        </h5>
                    </span>
                </div>
                <div style="border-bottom: 1px solid #eaeaea;height: 60px" class="col-lg-12">
                    <span class="col-lg-4"><h4>身份证号码:</h4></span><span class="col-lg-8"><h5><input type="text" style="width: 60%;height: 30px" name="userid" id="id" value=<%=id%>></h5></span>
                </div>
            </div>
        </div>
        <center><button type="button" class="btn btn-info" id="submit" style="width: 180px;margin-bottom: 5px">提交</button></center>

    </div>
</div>

<%--footer标签--%>
<%@include file="commons/footer.jsp"%>

<script>
    $("#submit").click(function (){
        //用ajax提交表单数据到Servlet
        var nation;
        if($("#nation").val()==null){
            nation="<%=user.getNation()%>";
        }else{
            nation=$("#nation").val();
        }
        $.ajax({
            type:"post",
            url:"UpdateUserServlet",
            data:{
                email:"<%=user.getEmail()%>",
                password:$("#psw").val(),
                username:$("#name").val(),
                birthday:$("#birthday").val(),
                nation:nation,
                id:$("#id").val()
            },
            //提交成功回调函数，data为返回的数据
            success: function (data) {
                if (data==="success") {//判断返回值
                    alert("用户信息更改成功");
                    close();
                    open("MyCenter.jsp");
                } else {
                    alert("用户信息更改失败");
                    close();
                    open("MyCenter.jsp");
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
