<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>增加课程</title>
    <!--导入layui核心css，注意引入路径-->
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
</head>
<body>
<div style="padding: 20px;">
    <%--定义表单，使用样式【layui-form】，确保下拉框、单选框、多选框等layui组件样式显示正常--%>
    <form class="layui-form" id="frmAdd">
        <div class="layui-row">
            <div class="layui-col-sm8">
                <div class="layui-form-item">
                    <label class="layui-form-label">课程ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseId" id="CourseId" placeholder="请输入课程ID" class="layui-input" lay-verify="required">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程名</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseName" placeholder="请输入课程名" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程详情</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseDescription" placeholder="请输入课程详情" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" id="btnAdd">添加</button>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm4">
                <div class="layui-form-item" style="padding:0 10px;">
                    <%--图片预览标签，默认src为一张暂无图像的图片--%>
                    <img id="photo" style="width: 300px; border:1px solid #F0F0F0; padding: 5px;"  src="../../resource/NoPic.png">
                </div>
                <%--图片预览按钮--%>
                <button type="button" class="layui-btn" id="btnPreview">
                    <i class="layui-icon">&#xe67c;</i>预览图片
                </button>
                <%--图片上传按钮，处于隐藏状态--%>
                <button type="button" class="layui-btn" id="btnUpImg" style="display: none">真正上传图片</button>
            </div>
        </div>
    </form>
</div>
<!--导入layui核心js，注意引入路径-->
<script src="../../layuiadmin/layui/layui.js"></script>
<script>
    //使用layui的表单、日期、文件上传组件
    layui.use(['form', 'laydate', 'upload'], function () {
        var form = layui.form//定义layui的表单变量
            , $ = layui.jquery//定义layui的jquery变量
            , layer = layui.layer//定义layui的弹窗变量
            , upload = layui.upload//定义layui的文件上传组件变量
            , filesrc = "NoPic.png";//定义头像未上传的图片文件
        form.render();//渲染表单，有时日期框、单选框等不能正常显示样式时使用
        //单击【添加】按钮的事件
        $('#btnAdd').click(function () {
            if($('#photo')[0].src.indexOf('NoPic.png')>0){//如果没有选择头像图片
                addInfo();//将暂无图片.jpg文件名存入数据库
            }else{
                //触发隐藏的上传头像按钮，头像上传成功后，再执行数据库添加
                $('#btnUpImg').trigger('click');
            }
        });
        //图片上传
        upload.render({
            elem: '#btnPreview'//绑定【预览头像】按钮的id
            , url: "../../UploadFileServlet"//图片上传的Servlet
            ,auto:false//是否自动上传，默认为true
            ,bindAction:'#btnUpImg'//指向一个按钮触发上传，一般配合 auto: false,可将按钮设置为隐藏
            , field: 'photo'//设定文件域的字段名，在Servlet中通过request获取上传的文件名
            //选择文件后的回调函数
            , choose: function (obj) {
                //预读本地文件
                obj.preview(function (index, file, result) {
                    //将选择的结果result加载到上述定义的img标签的src属性，实现图片预览
                    $('#photo').attr('src', result);
                });
            }
            //上传完成后回调，res为服务器端返回的数据，数据为固定格式的json对象
            //格式：
            , done: function (res) {
                if (res.code!=1) { //如果上传失败
                    return layer.msg("图片上传失败，请重新上传！");//弹窗显示错误信息
                }
                //上传成功的一些操作
                filesrc = res.data.src;//获取返回的文件名
                addInfo();////自定义函数，作用是将上传成功的文件名保存到数据库
            }
        });
        //将用户输入的信息和上传的头像提交给服务器处理
        function addInfo(){
            //传递表单中所有组件的值和上传的文件名
            var formdata = $("#frmAdd").serialize() + "&filesrc=" + filesrc;
            $.ajax({
                url: '../../AddCourseServlet',//提交给谁处理
                data: formdata,//传递表单中所有组件的值和上传的文件名
                type: "post",//提交方式
                //提交成功回调函数，data为返回的数据
                success: function (data) {
                    if (data==="success") {//判断返回值
                        // layer.msg('用户信息添加成功', {icon: 1, time: 3000});
                        layer.msg('课程信息添加成功', {icon: 1, time: 1000}, function () {
                            //弹窗关闭后的回调函数，作用是关闭添加用户信息窗口，返回用户信息管理首页
                            // 先得到当前iframe层的索引
                            index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index); //再执行关闭
                        });
                    } else {
                        layer.msg('用户ID【'+$('#CourseId').val() + '】已存在，请重新输入！', {icon: 2, time: 3000});
                        $('#CourseId').focus();
                    }
                },
                error: function (er) {//提交失败的处理
                    alert(er.responseText);
                }
            });
        }
    })
</script>
</body>
</html>
