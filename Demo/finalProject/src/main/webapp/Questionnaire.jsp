<%@ page import="controller.QuestionnaireServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>调查问卷页面</title>
    <style>
        body{
            background-color: gray;
        }
        .index{
            margin: auto;
            width:920px;
            background-color: white;
            box-shadow:1px 1px 5px black;
            border: 1px solid gray;
            border-radius: 10px;
        }
        h1{
            color:orange;
            padding-top:30px;
            text-align:center;
        }
        form{
            padding-left: 100px;
            line-height:180%;
        }
        input{
            /*border-color: black;*/
            /*border-top-width:0px;*/
            /*border-right-width:0px;*/
            /*border-bottom-width:2px;*/
            /*border-left-width:0px;*/
        }
        #btn{
            background-color: #FFA500;
            color:white;
            padding:5px 10px;
            margin-left:320px;
            margin-top:16px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="index" style="margin-bottom: 10px;margin-top: 10px">
    <h1>高校学生跟踪调查问卷</h1>
    <hr color="orange" width="700px" />
    <form method="post" action="<%=request.getContextPath()%>/QuestionnaireServlet">
        <ol>
            <li>您的教育程度是？</li>
            <label><input type="radio" name="education" value="高中" required />&nbsp;&nbsp;高中&nbsp;&nbsp; </label>
            <label><input type="radio" name="education" value="大专" />&nbsp;&nbsp;大专&nbsp;&nbsp; </label>
            <label><input type="radio" name="education" value="本科" />&nbsp;&nbsp;本科&nbsp;&nbsp; </label>
            <label><input type="radio" name="education" value="硕士研究生" />&nbsp;&nbsp;硕士研究生&nbsp;&nbsp; </label>
            <label><input type="radio" name="education" value="博士及以上" />&nbsp;&nbsp;博士及以上 </label>
            <li>您的年龄段是？</li>
            <label><input type="radio" name="age" value="18岁以下" required />&nbsp;&nbsp;18岁以下&nbsp;&nbsp; </label>
            <label><input type="radio" name="age" value="18-25岁" />&nbsp;&nbsp;18-25岁&nbsp;&nbsp; </label>
            <label><input type="radio" name="age" value="26-30岁" />&nbsp;&nbsp;26-30岁&nbsp;&nbsp; </label>
            <label><input type="radio" name="age" value="31-35岁" />&nbsp;&nbsp;31-35岁&nbsp;&nbsp; </label>
            <label><input type="radio" name="age" value="35岁以上" />&nbsp;&nbsp;35岁以上 </label>
            <li>您对现阶段所学专业（学科）教学过程的满意度？</li>
            <label><input type="radio" name="majorSatisfaction" value="非常不满意" required />&nbsp;&nbsp;非常不满意&nbsp;&nbsp; </label>
            <label><input type="radio" name="majorSatisfaction" value="不满意" />&nbsp;&nbsp;不满意&nbsp;&nbsp; </label>
            <label><input type="radio" name="majorSatisfaction" value="一般" />&nbsp;&nbsp;一般 &nbsp;&nbsp; </label>
            <label><input type="radio" name="majorSatisfaction" value="比较满意" />&nbsp;&nbsp;比较满意&nbsp;&nbsp; </label>
            <label><input type="radio" name="majorSatisfaction" value="满意" />&nbsp;&nbsp;满意&nbsp;&nbsp; </label>
            <li>您对个人学习生活现状的整体满意度如何？</li>
            <label><input type="radio" name="lifeSatisfaction" value="非常不满意" required />&nbsp;&nbsp;非常不满意&nbsp;&nbsp; </label>
            <label><input type="radio" name="lifeSatisfaction" value="不满意" />&nbsp;&nbsp;不满意&nbsp;&nbsp; </label>
            <label><input type="radio" name="lifeSatisfaction" value="一般" />&nbsp;&nbsp;一般 &nbsp;&nbsp; </label>
            <label><input type="radio" name="lifeSatisfaction" value="比较满意" />&nbsp;&nbsp;比较满意&nbsp;&nbsp; </label>
            <label><input type="radio" name="lifeSatisfaction" value="满意" />&nbsp;&nbsp;满意&nbsp;&nbsp; </label>
            <li>是否推荐其他人报考现阶段所在学校或学科专业？</li>
            <label><input type="radio" name="recommendation" value="推荐报考本校本专业" required />&nbsp;&nbsp;推荐报考本校本专业&nbsp;&nbsp; </label>
            <label><input type="radio" name="recommendation" value="推荐报考其他学校本专业" />&nbsp;&nbsp;推荐报考其他学校本专业&nbsp;&nbsp; </label>
            <label><input type="radio" name="recommendation" value="推荐报考本校其他专业" />&nbsp;&nbsp;推荐报考本校其他专业 &nbsp;&nbsp; </label>
            <label><input type="radio" name="recommendation" value="推荐报考其他学校其他专业" />&nbsp;&nbsp;推荐报考其他学校其他专业&nbsp;&nbsp; </label>
            <li>您对现阶段学校教育教学改革、人才培养、管理服务水平等方面有何建议？</li>
            <label><input type="text" name="advice" style="width: 600px;height: 100px"></label>
        </ol>
        您的姓名&nbsp;&nbsp;<input type="text" name="username" required />
        &nbsp;&nbsp;您的专业&nbsp;&nbsp;<input type="text" name="major" required />
        &nbsp;&nbsp;联系电话&nbsp;&nbsp;<input type="tel" name="tele" required />
        <br />
        <button id="btn" type="submit">提交问卷</button>

    </form>
</div>
</body>
</html>

