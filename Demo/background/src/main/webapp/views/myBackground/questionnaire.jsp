<%@ page import="pojo.questionnaire" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.QuestionnaireImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户问卷信息统计</title>
    <!-- 引入下载的 ECharts 文件 -->
    <script src="<%=request.getContextPath()%>/echarts.js"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <!--导入layui核心css，注意引入路径-->
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
</head>
<body>
    <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
    <div id="edu" style="width: 600px;height:400px;" class="layui-col-xs6"></div>
    <div id="age" style="width: 600px;height:400px;" class="layui-col-xs6"></div>
    <div id="majorSatisfaction" style="width: 600px;height:400px;" class="layui-col-xs6"></div>
    <div id="lifeSatisfaction" style="width: 600px;height:400px;" class="layui-col-xs6"></div>
    <div id="recommendation" style="width: 600px;height:400px;" class="layui-col-xs6"></div>


    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('edu'));
        var myChart2 = echarts.init(document.getElementById('age'));
        var myChart3 = echarts.init(document.getElementById('majorSatisfaction'));
        var myChart4 = echarts.init(document.getElementById('lifeSatisfaction'));
        var myChart5 = echarts.init(document.getElementById('recommendation'));
        $.getJSON(
            "<%=request.getContextPath()%>/QuestionnaireStatistics",
            {},
            (res)=>{
                // 指定图表的配置项和数据
                option1 = {
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['高中', '大专', '本科', '硕士研究生', '博士及以上']
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center',
                                emphasis: {
                                    show: true
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            },
                            data: [
                                { value: res.edu[0], name: '高中' },
                                { value: res.edu[1], name: '大专' },
                                { value: res.edu[2], name: '本科' },
                                { value: res.edu[3], name: '硕士研究生' },
                                { value: res.edu[4], name: '博士及以上' }
                            ]
                        }
                    ]
                };

                option2 = {
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['18岁以下', '18-25岁', '26-30岁', '31-35岁', '35岁以上']
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center',
                                emphasis: {
                                    show: true
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            },
                            data: [
                                { value: res.age[0], name: '18岁以下' },
                                { value: res.age[1], name: '18-25岁' },
                                { value: res.age[2], name: '26-30岁' },
                                { value: res.age[3], name: '31-35岁' },
                                { value: res.age[4], name: '35岁以上' }
                            ]
                        }
                    ]
                };

                option3 = {
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['非常不满意', '不满意', '一般', '比较满意', '满意']
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center',
                                emphasis: {
                                    show: true
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            },
                            data: [
                                { value: res.majorSatisfaction[0], name: '非常不满意' },
                                { value: res.majorSatisfaction[1], name: '不满意' },
                                { value: res.majorSatisfaction[2], name: '一般' },
                                { value: res.majorSatisfaction[3], name: '比较满意' },
                                { value: res.majorSatisfaction[4], name: '满意' }
                            ]
                        }
                    ]
                };

                option4 = {
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['非常不满意', '不满意', '一般', '比较满意', '满意']
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center',
                                emphasis: {
                                    show: true
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            },
                            data: [
                                { value: res.lifeSatisfaction[0], name: '非常不满意' },
                                { value: res.lifeSatisfaction[1], name: '不满意' },
                                { value: res.lifeSatisfaction[2], name: '一般' },
                                { value: res.lifeSatisfaction[3], name: '比较满意' },
                                { value: res.lifeSatisfaction[4], name: '满意' }
                            ]
                        }
                    ]
                };

                option5 = {
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['推荐报考本校本专业', '推荐报考其他学校本专业', '推荐报考本校其他专业', '推荐报考其他学校其他专业']
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center',
                                emphasis: {
                                    show: true
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            },
                            data: [
                                { value: res.recommendation[0], name: '推荐报考本校本专业' },
                                { value: res.recommendation[1], name: '推荐报考其他学校本专业' },
                                { value: res.recommendation[2], name: '推荐报考本校其他专业' },
                                { value: res.recommendation[3], name: '推荐报考其他学校其他专业' }
                            ]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart1.setOption(option1);
                myChart2.setOption(option2);
                myChart3.setOption(option3);
                myChart4.setOption(option4);
                myChart5.setOption(option5);


            }
        )




    </script>
</body>
</html>
