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
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <title>中国高等教育网</title>
    <!--导入css-->
    <link rel="stylesheet" href="project.css">
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">其他同学的链接<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="http://120.24.168.75/homework/home_1.html" target="_blank">刘宇阳同学的链接</a></li>
                        <li><a href="http://124.221.127.163/project/html/html2.html" target="_blank">林茂林同学的链接</a></li>
                        <li><a href="http://124.223.198.233:8080/zzw/index">周梓文同学的链接</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>

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
                <!--用模态框设置登陆注册界面-->
                <!--登陆界面-->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    登陆
                </button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2 class="modal-title" id="exampleModalLabel">登陆</h2>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <%
                                    String Email="";//初始化Email，方便后续存在input里的Value里
                                    String Password="";//初始化Password，方便后续存在input里的Value里
                                    //得到cookie，判断是否有记住我的Cookie
                                    Cookie[] cookies=request.getCookies();
                                    boolean EmailFlag=false;//设置一个标志，代表找到了需要的Cookie
                                    boolean PasswordFlag=false;//设置一个标志，代表找到了需要的Cookie
                                    if(cookies!=null) {
                                        for (Cookie cookie : cookies) {
                                            if (cookie.getName().equals("rememberEmail") && !EmailFlag) {
                                                Email = cookie.getValue();
                                                EmailFlag = true;
                                            }
                                            if (cookie.getName().equals("rememberPassword") && !PasswordFlag) {
                                                Password = cookie.getValue();
                                                PasswordFlag = true;
                                            }
                                            if (EmailFlag && PasswordFlag) {
                                                break;
                                            }
                                        }
                                    }
                                %>
                                <!--登陆表单-->
                                <form class="form-horizontal" action="UserLoginIn" method="post">
                                    <div class="form-group" id="email">
                                        <label for="inputEmail3" class="col-sm-2 control-label">邮件地址</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputEmail3" placeholder="邮件地址" name="email" value=<%=Email%>>
                                        </div>
                                    </div>
                                    <div class="form-group" id="password">
                                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="inputPassword3" placeholder="密码" name="password" value=<%=Password%>>
                                        </div>
                                    </div>
                                    <div class="form-group" id="remember">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="rememberMe"> 记住我
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group" id="login">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">登陆</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


                <!--注册界面-->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1">
                    注册
                </button>
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2 class="modal-title" id="exampleModalLabel1">注册</h2>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!--注册表单-->
                                <form class="form-horizontal" action="UserRegister" method="post" id="registerForm">
                                    <div class="form-group" id="email1">
                                        <label for="inputEmail3" class="col-sm-2 control-label">邮件地址</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputEmail31" placeholder="邮件地址" name="email">
                                        </div>
                                    </div>
                                    <div class="form-group" id="password1">
                                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="inputPassword31" placeholder="密码" name="password">
                                        </div>
                                    </div>
                                    <div class="form-group" id="name">
                                        <label for="username" class="col-sm-2 control-label">用户名</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="username" placeholder="用户名" name="username">
                                        </div>
                                    </div>
                                    <div class="form-group" id="birthday">
                                        <label  class="col-sm-2 control-label">出生日期</label>
                                        <div class="col-sm-10">
                                            <input type="date" class="form-control" id="userBirthday" placeholder="出生日期" name="birthday">
                                        </div>
                                    </div>
                                    <div class="form-group" id="login1">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">注册</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--轮播图 图片统一尺寸1434 500-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="resource/HelloNewTerm.png" alt="新学期">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <a href="https://cet.neea.edu.cn/html1/category/16093/1124-1.htm" target="_blank">
                <img src="resource/CET.png" alt="CET">
            </a>
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item" >
            <a href="#">
                <img src="resource/politicy1.png" alt="党的建设">
            </a>
            <div class="carousel-caption">
                <h1>思想建党，理论建党</h1>
            </div>
        </div>
        <div class="item" >
            <a href="https://www.chsi.com.cn/en/news/202202/20220224/2168638851.html" target="_blank">
                <img src="resource/picture1.png" alt="学信网英文页面">
            </a>
            <div class="carousel-caption">

            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!--内容体-->
<div class="container">
    <div class="row">
        <!--左边占8格-->
        <div class="col-lg-8 news_left">
            <!--图文-->
            <div class="row">
                <div class="col-lg-12">
                    <p class="newsTitle"><i class="fa fa-hand-o-right"></i> 聚焦热点</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 news">
                    <div class="card mb-3 newsBody">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <a href="https://yz.chsi.com.cn/kyzx/zt/kyfs2022.shtml" target="_blank">
                                    <img src="resource/kaoyan.png" alt="...">
                                </a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h2 class="card-title">考研分数查询</h2>
                                    <p class="card-text">2022年考研初试成绩2月21日起陆续公布。本网会及时转发2022年考研初试成绩查询信息，考生可点击招生单位所在省查询。教育部发布《2022年全国硕士生招生考试考生进入复试的初试成绩基本要求》后，本网将第一时间转发，请关注。</p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 news">
                    <div class="card mb-3 newsBody">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <a href="https://yz.chsi.com.cn/zsml/zyfx_search.jsp" target="_blank">
                                    <img src="resource/kaoyan2.png" alt="...">
                                </a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h2 class="card-title">硕士专业目录</h2>
                                    <p class="card-text">权威的硕士专业目录查询</p>
                                    <p class="card-text"><small class="text-muted">Last updated 5 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 news">
                    <div class="card mb-3 newsBody">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <a href="https://www.gfbzb.gov.cn/" target="_blank">
                                    <img src="resource/army.png" alt="...">
                                </a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h2 class="card-title">响应国家号召，积极入伍</h2>
                                    <p class="card-text">响应国家号召，积极入伍</p>
                                    <p class="card-text"><small class="text-muted">Last updated 7 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <div class="col-lg-4">
            <div class="row">
                <!--其他链接-->
                <div class="list-group">
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        <i class="fa fa-camera-retro"></i> 新闻速递
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="collapse.in" id="collapseExample">
                    <a href="https://gaokao.chsi.com.cn/gkxx/ksbd/202202/20220223/2168460431.html" target="_blank">
                        <button type="button" class="list-group-item list-group-item-action">3月高考热点：各省高招规定陆续公布、高考体检、强基计划招生启动、体育类专业统考</button>
                    </a>
                    <a href="https://gaokao.chsi.com.cn/gkxx/zt/syljs.shtml" target="_blank">
                        <button type="button" class="list-group-item list-group-item-action">专题：深入推进新一轮“双一流”建设</button>
                    </a>
                    <a href="https://gaokao.chsi.com.cn/z/gkbmfslq/zszc.jsp" target="_blank">
                        <button type="button" class="list-group-item list-group-item-action">2022年高考招生政策及照顾政策汇总</button>
                    </a>
                    <a href="https://yz.chsi.com.cn/kyzx/zcdh/202203/20220311/2172250823.html" target="_blank">
                        <button type="button" class="list-group-item list-group-item-action">2022年第3次全国教育系统疫情防控工作视频调度会议召开</button>
                    </a>
                </div>
            </div>

            <!--播放视频-->
            <br><br>
            <div class="row">
                <video width="100%" height=auto controls>
                    <source src="resource/qhdxxcp.mp4" type="video/mp4">
                    当前浏览器不支持播放视频
                </video>
            </div>

        </div>
    </div>
</div>

<div class="container">
    <!--分页-->
    <div class="row">
        <div class="col-lg-12 paging">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="project.html">1</a></li>
                    <li class="page-item disabled" ><span class="page-link " href="#">2</span></li>
                    <li class="page-item disabled" ><span class="page-link " href="#">3</span></li>
                    <li class="page-item disabled" ><span class="page-link " href="#">4</span></li>
                    <li class="page-item disabled" ><span class="page-link " href="#">5</span></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!--footer-->
<footer class="container-fluid footer1">
    <div class="container">
        <div class="row">
            <!--关于我们-->
            <div class="col-lg-6 footer-left">
                <div class="row">
                    <h5 style="border-bottom: gray  1px solid">关于我们</h5>
                </div>
                <div class="row">
                    <p>主办单位：<a href="https://chesicc.chsi.com.cn/" target="_blank">教育部学生服务与素质发展中心</a>（原全国高等学校学生信息咨询与就业指导中心）</p>
                </div>
                <div class="row">
                    <p>客服热线：010-67410388</p>
                </div>
                <div class="row">
                    <p>客服邮箱：kefu#chsi.com.cn（将#替换为@）</p>
                </div>
                <div class="row">
                    <p>京ICP备19004913号-1</p>
                </div>
                <div class="row">
                    <p>京公网安备11010202009747号</p>
                </div>
            </div>

            <!--友情链接-->
            <div class="col-lg-6 footer-right">
                <div class="row">
                    <h5 style="border-bottom: gray  1px solid">友情连接</h5>
                </div>
                <div class="row">
                    <!--第一列-->
                    <div class="col-lg-3">
                        <div class="row">
                            <a href="http://www.moe.gov.cn/" target="_blank">中华人民共和国教育部</a>
                        </div>
                        <div class="row">
                            <a href="http://www.moe.gov.cn/s78/A15/" target="_blank">教育部高校学生司</a>
                        </div>
                        <div class="row">
                            <a href="https://www.cedf.org.cn/" target="_blank">中国教育发展基金会</a>
                        </div>
                        <div class="row">
                            <a href="https://jsjjh.chsi.com.cn/" target="_blank">中国教师发展基金会</a>
                        </div>
                        <div class="row">
                            <a href="http://www.xszz.cee.edu.cn/" target="_blank">全国学生资助管理中心</a>
                        </div>
                    </div>
                    <!--第二列-->
                    <div class="col-lg-3">
                        <div class="row">
                            <a href="http://edu.people.com.cn/" target="_blank">人民网教育</a>
                        </div>
                        <div class="row">
                            <a href="https://www.gotopku.cn/" target="_blank">北京大学</a>
                        </div>
                        <div class="row">
                            <a href="https://www.ruc.edu.cn/" target="_blank">中国人民大学</a>
                        </div>
                        <div class="row">
                            <a href="https://join-tsinghua.edu.cn/" target="_blank">清华大学</a>
                        </div>
                        <div class="row">
                            <a href="https://zhaosheng.ustb.edu.cn/" target="_blank">北京科技大学</a>
                        </div>
                    </div>
                    <!--第三列-->
                    <div class="col-lg-3">
                        <div class="row">
                            <a href="https://admission.bit.edu.cn/" target="_blank">北京理工大学</a>
                        </div>
                        <div class="row">
                            <a href="https://www.buct.edu.cn/main.htm" target="_blank">北京化工大学</a>
                        </div>
                        <div class="row">
                            <a href="http://www.buaa.edu.cn/" target="_blank">北京航空航天大学</a>
                        </div>
                        <div class="row">
                            <a href="http://www.neu.edu.cn/" target="_blank">东北大学</a>
                        </div>
                        <div class="row">
                            <a href="https://zsb.nwpu.edu.cn/" target="_blank">西北工业大学</a>
                        </div>
                    </div>
                    <!--第四列-->
                    <div class="col-lg-3">
                        <div class="row">
                            <a href="https://www.hsehome.com/" target="_blank">安全家-安全知识社区</a>
                        </div>
                        <div class="row">
                            <a href="http://www.gaes.gov.mo/chinaenroll/gb/home.html" target="_blank">澳门高校招收内地学生</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row company">
        Copyright © 2022 中国高等教育网 Inc. 保留所有权利。
        <a href="#">隐私政策</a> |
        <a href="#">使用条款</a> |
        <a href="#">销售政策</a> |
        <a href="#">网站地图</a> |
        <a href="#">法律信息</a>
    </div>
</footer>

<!--JS代码-->
<script>
    $(function () {
        $('#registerForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 18,
                            message: '用户名长度必须在2到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址格式有误'
                        }
                    }
                },
                password:{
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 12,
                            message: '密码长度必须在6到12位之间'
                        },
                        regexp: {
                            regexp:  /^[a-zA-Z0-9]+$/,
                            message: '密码只能包含大写、小写、数字'
                        }
                    }
                }
            }
        });
    });

    //彩蛋触发(小恐龙游戏,依次按egg触发)
    var flag=0;//设置一个计数器，用于判断是否按顺序触发键盘事件
    $(document).keydown(function(event){
        if(event.keyCode == 69&&flag==0){
            // 第一次按下e
            flag=1;
        }
    });
    $(document).keydown(function(event){
        if(event.keyCode == 71&&flag==1){
            // 第二次按下g
            flag=2;
        }else if(event.keyCode == 71&&flag==2){
            // 第三次按下g
            flag=0;
            open("painted_eggshell.html");
        }
    });
    $(document).keydown(function(event){
        if(event.keyCode != 69&&event.keyCode!=71){
            // 按下的顺序不对
            flag=0;
        }
    });

</script>
</body>
</html>
