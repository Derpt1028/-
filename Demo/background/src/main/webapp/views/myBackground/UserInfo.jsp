<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户信息列表</title>
    <!--导入layui核心css，注意引入路径-->
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <style>
        .layui-table-cell { /*设置数据表格行的高度，如果不设置，可能导致图片显示不完整*/
            height: auto;
        }
    </style>
</head>
<body>
<%--定义数据表格头部工具栏，含两个带小图标的按钮--%>
<script type="text/html" id="toolbar">
    <div class="layui-btn-container">
        <button class="layui-btn  layui-btn-sm" lay-event="add" id="btnAdd">
            <i class="layui-icon layui-icon-form"></i>添加
        </button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del" id="btnDel">
            <i class="layui-icon layui-icon-delete"></i>删除选中项
        </button>
    </div>
</script>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <%--搜索框--%>
            <div style="margin: 10px;" class="layui-form">
                <div class="layui-inline">
                    <label class="layui-form-label">用户查找</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="keysno" id="keyuid" autocomplete="off" placeholder="请输入待搜索的用户邮箱">
                    </div>
                </div>
<%--                <div class="layui-inline">--%>
<%--                    <label class="layui-form-label">输入姓名</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input class="layui-input" name="keyname" id="keyname" autocomplete="off" placeholder="请输入待搜索的姓名">--%>
<%--                    </div>--%>
<%--                </div>--%>
                <button class="layui-btn" id="btnSearch"><i class="layui-icon"></i>搜索</button>
            </div>
            <%--定义表格容器--%>
            <table id="tbUser" lay-filter="tbUser"></table>
            <%--图片模板，在数据表格中，通过设置列templet的值为id--%>
            <script type="text/html" id="photo">
                <%--使用图像标签，d.pic为数据表格中设置列的field值，单击图片弹层显示原图 --%>
                <img src="<%=request.getContextPath()%>/uploadfile/{{d.photo}}" style="width: 48px;border:1px solid #cccccc;padding: 1px;cursor: pointer" onclick="showPic(this)"/>
            </script>
            <%--定义数据表格中每行的工具栏，包含【编辑】和【删除】两个按钮--%>
            <%--使用script包含工具栏，定义id为rowTool--%>
            <script type="text/html" id="rowTool">
                <a class="layui-btn layui-btn-xs" lay-event="edit">
                    <i class="layui-icon layui-icon-edit"></i>编辑
                </a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
                    <i class="layui-icon layui-icon-delete"></i>删除
                </a>
            </script>
        </div>
    </div>
</div>

<!--导入layui核心js，注意引入路径-->
<script src="../../layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['table'], function(){//使用layui表格组件
        var table = layui.table,$=layui.$;
        //执行表格渲染
        table.render({
            id:"userInfo"//设置基础参数id，后续多处会使用到此值
            ,elem: '#tbUser'//要渲染表格的id
            ,url: '../../FindServlet' //数据接口
            ,height: "full-100"//设置表格高度为浏览器高度-100像素
            , toolbar: '#toolbar' //开启头部工具栏，绑定上述定义的含两个按钮的工具栏
            ,cols: [[
                {type:'checkbox'}//复选框
                ,{field:'email', width:150, title: '用户邮箱', sort: true}
                ,{field:'password', width:150, title: '用户密码'}
                ,{field:'username', width:150, title: '用户名'}
                ,{field:'birthday', width:150, title: '用户生日'}
                ,{field:'nation', width:150, title: '用户国籍'}
                ,{field:'identityID', width:150, title: '用户身份证'}
                ,{field: 'lastLoginIn',width: 200,title: '用户上次登陆时间'}
                // ,{field:'imgURL',title: '图片',templet: '#photo'}//templet，绑定上述定义的img标签，通过templet属性指定图像的id值
                ,{title: '操作', align: "center",toolbar: '#rowTool',width: 150}//绑定上述定义的行工具栏，通过toolbar属性指定工具栏的id值
            ]]
            , limits: [5, 10, 15, 20, 25, 50, 100]//每页条数的选择项
            , limit: 10//每页显示的条数（默认：10）
            , page: true//开启分页
            , parseData: function (res) { //res为原始返回的数据，需要将其拆分成分页数据
                var result;
                if (this.page.curr) {//如果不是第1页
                    result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                } else {
                    result = res.data.slice(0, this.limit);//获取原始数据1-limit条数据
                }
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": result //解析数据列表
                }
            }
        });
        //触发表格头部按钮事件，【tbUser】是 table原始容器的属性 lay-filter="对应的值
        table.on('toolbar(tbUser)', function(obj){
            switch(obj.event){
                case 'add':
                    addUser();
                    break;
                case 'del':
                    delUser();
                    break;
            };
        });

        //定义弹层显示图片的函数
        window.showPic=function (e) {
            layer.open({//使用layui的弹层
                type:1,//弹层类型为页面风格
                title:"头像",//弹层标题
                skin: 'layui-layer-lan',//风格深蓝
                content:"<img style='padding:30px;width: 100%;'  src="+e.src+">"//弹层主体的内容
            });
        }
        // 点击【搜索】按钮事件，实现用户查询
        $('#btnSearch').click(function () {//点击搜索按钮
            var email = $('#keyuid').val()//获取搜索用户id文本框的值
            //按搜索条件重新加载表格，值”userinfo“为table.render中的基础参数id的值
            table.reload('userInfo', {
                //设定异步数据接口的额外参数,在servlet可用request.getParameter("下列键")获取值
                where: {
                    email: email,//设置键值对，可有多个
                }
                , page: {
                    curr: 1//重新从第 1 页开始
                }
            });
        })
        //定义表格头部【添加用户】函数
        window.addUser=function (){
            <%--window.open("add.jsp");//直接跳转--%>
            var index = layer.open({
                title: '添加用户信息',
                type: 2,//type为1 ，content显示的是纯文本内容，type为2，content为页面
                shade: 0.2,//阴影透明度
                shadeClose: true,
                area: ['90%', '90%'],//弹出层的大小
                offset: ['5%', 0],//弹出层的位置
                content: 'addUser.jsp',//弹出层的内容
                end: function () {
                    //弹出层结束后，刷新表格，参数userinfo即为基础参数id对应的值
                    table.reload('userInfo',{});
                    // location.reload();//弹出层结束后，刷新页面
                }
            });
        }
        //定义表格头部【删除指定用户】函数
        window.delUser=function () {
            //获取选中行，userInfo 即为table.render中定义的基础参数 id 对应的值
            var checkStatus = table.checkStatus('userInfo');
            var data = checkStatus.data;//获取选中行的数据
            var arrUid = [];//定义数组，存放选中行的用户Email
            if (data.length == 0) {
                layer.msg("未选则数据，请重新选择！")
            } else {
                data.forEach(function (data) {//遍历选中的行
                    arrUid.push(data.email);//将选中行的用户email存放在数组中
                });
                //弹层询问是否删除
                layer.confirm(
                    '真的删除Email为【' + arrUid.toString() + '】的记录吗？',
                    //点击确定，传递选择的用户ID和图片文件，执行删除行函数
                    function () {
                        delrow(arrUid);
                    });
            }
        };
        window.delrow=function (arrUid) {
            $.ajax({//ajax提交服务器处理
                url: '<%=request.getContextPath()%>/DelUserServlet',//获取了虚拟路径
                dataType: 'text',//返回的数据类型
                //定义传递给服务器处理的参数名和值
                data: {email: arrUid},
                //传递数组参数到Servlet时，必须设置为true，默认为false
                traditional: true,
                //服务器处理成功后的回调函数，返回数据存放在result变量中
                success: function (result) {
                    if (result == "true") {
                        //刷新数据表格，userinfo为table的基础参数id的值
                        table.reload('userinfo', {});
                        layer.msg('用户ID为' + JSON.stringify(arrUid) + '的记录删除成功！')
                    } else {
                        layer.msg('删除不成功！')
                    }
                }
            });
        }
        //监听数据表格行工具事件，【tbUser】是 table原始容器的属性 lay-filter="对应的值
        table.on('tool(tbUser)', function (obj) {
            var data = obj.data;//获取所点击行的数据
            var uid = data.email;//获取所点击行的用户Email
            if (obj.event === 'del') {
                layer.confirm(
                    '真的删除Email为【' + uid + '】的记录吗？',
                    function (index) {
                        delrow(uid);
                    });
            }
            if(obj.event === 'edit'){
                var index = layer.open({
                    title: '更改用户信息',
                    type: 2,//type为1 ，content显示的是纯文本内容，type为2，content为页面
                    shade: 0.2,//阴影透明度
                    shadeClose: true,
                    area: ['90%', '90%'],//弹出层的大小
                    offset: ['5%', 0],//弹出层的位置
                    content: 'UpdateUser.jsp?email='+data.email,//弹出层的内容
                    end: function () {
                        //弹出层结束后，刷新表格，参数userinfo即为基础参数id对应的值
                        table.reload('userInfo',{});
                        // location.reload();//弹出层结束后，刷新页面
                    }
                });
            }
        });

    });
</script>
</body>
</html>