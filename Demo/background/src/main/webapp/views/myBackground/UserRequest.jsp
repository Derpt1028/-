<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户访问分布图</title>
</head>
<body>
<!-- 图书统计 -->
<div class="row" id="hh">
    <div class="container">
        <canvas id="canvas" width="1300" height="650"></canvas>
        <script src="../js/sChart.js"></script>
        <script>
            var data = [
                {xAxis:'0',value:14}, //{xAxis:横轴名称,value:数值} 竖轴的数大小随各个的数值自动变化
                {xAxis:'1',value:149},
                {xAxis:'2',value:326},
                {xAxis:'3',value:117},
                {xAxis:'4',value:97},
                {xAxis:'5',value:30},
                {xAxis:'6',value:470},
                {xAxis:'7',value:970},
                {xAxis:'8',value:1970},
                {xAxis:'9',value:2970},
                {xAxis:'10',value:5970},
                {xAxis:'11',value:3970},
                {xAxis:'12',value:2970},
                {xAxis:'13',value:5000},
                {xAxis:'14',value:4700},
                {xAxis:'15',value:3970},
                {xAxis:'16',value:3400},
                {xAxis:'17',value:2370},
                {xAxis:'18',value:1970},
                {xAxis:'19',value:1570},
                {xAxis:'20',value:1470},
                {xAxis:'21',value:1070},
                {xAxis:'22',value:570},
                {xAxis:'23',value:370},
                {xAxis:'24',value:170},
            ]
            var chart = new sBarChart('canvas',data,{
                title: '用户访问流量统计',
                bgColor: '#829dba',
                titleColor: '#ffffff',      // 标题颜色
                titlePosition: 'top',       // 标题位置
                fillColor: '#72f6ff',       // 柱状填充色
                axisColor: '#eeeeee',       // 坐标轴颜色
                contentColor: '#bbbbbb'     // 内容横线颜色
            });
        </script>
    </div>
</div>
</body>
</html>
