package controller.questionnaire;

import com.alibaba.fastjson.JSON;
import com.mysql.cj.Session;
import dao.QuestionnaireImpl;
import pojo.questionnaire;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * 获取用户调查问卷中的相关数据
 * */
@WebServlet("/QuestionnaireStatistics")
public class QuestionnaireStatistics extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //信息统计
        List<questionnaire> quest=new QuestionnaireImpl().findAll();
        List<Integer> edu= Arrays.asList(0,0,0,0,0);;//初始化问卷中的受教育程度
        List<Integer> age= Arrays.asList(0,0,0,0,0);;//初始化问卷中的年龄段
        List<Integer> majorSatisfaction= Arrays.asList(0,0,0,0,0);; //初始化专业满意度
        List<Integer> lifeSatisfaction= Arrays.asList(0,0,0,0,0);;//初始化生活满意度
        List<Integer> recommendation= Arrays.asList(0,0,0,0);;//初始化推荐程度

//        int edu1=0,edu2=0,edu3=0,edu4=0,edu5=0;
//        int age1=0,age2=0,age3=0,age4=0,age5=0;
//        int majorSatisfaction1=0,majorSatisfaction2=0,majorSatisfaction3=0,majorSatisfaction4=0,majorSatisfaction5=0;
//        int lifeSatisfaction1=0,lifeSatisfaction2=0,lifeSatisfaction3=0,lifeSatisfaction4=0,lifeSatisfaction5=0;
//        int recommendation1=0,recommendation2=0,recommendation3=0,recommendation4=0;
        if(quest!=null&&quest.size()>0){
            for (questionnaire i:quest) {
                //获取受教育程度的数据
                if(i.getEducation().equals("高中")){
                    int edu1=edu.get(0)+1;
                    edu.set(0,edu1);
                }else if(i.getEducation().equals("大专")){
                    int edu2=edu.get(1)+1;
                    edu.set(1,edu2);
                }else if(i.getEducation().equals("本科")){
                    int edu3=edu.get(2)+1;
                    edu.set(2,edu3);
                }else if(i.getEducation().equals("硕士研究生")){
                    int edu4=edu.get(3)+1;
                    edu.set(3,edu4);
                }else{
                    int edu5=edu.get(4)+1;
                    edu.set(4,edu5);
                }
                //获取年龄段的数据
                if(i.getAge().equals("18岁以下")){
                    int age1=age.get(0)+1;
                    age.set(0,age1);
                    age1++;
                }else if(i.getAge().equals("18-25岁")){
                    int age2=age.get(1)+1;
                    age.set(1,age2);
                }else if(i.getAge().equals("26-30岁")){
                    int age3=age.get(2)+1;
                    age.set(2,age3);
                }else if(i.getAge().equals("31-35岁")){
                    int age4=age.get(3)+1;
                    age.set(3,age4);
                }else {
                    int age5=age.get(4)+1;
                    age.set(4,age5);
                }
                //获取专业满意度的数据
                if(i.getMajorSatisfaction().equals("非常不满意")){
                    int majorSatisfaction1=majorSatisfaction.get(0)+1;
                    majorSatisfaction.set(0,majorSatisfaction1);
                }else if(i.getMajorSatisfaction().equals("不满意")){
                    int majorSatisfaction2=majorSatisfaction.get(1)+1;
                    majorSatisfaction.set(1,majorSatisfaction2);
                }else if(i.getMajorSatisfaction().equals("一般")){
                    int majorSatisfaction3=majorSatisfaction.get(2)+1;
                    majorSatisfaction.set(2,majorSatisfaction3);
                }else if(i.getMajorSatisfaction().equals("比较满意")){
                    int majorSatisfaction4=majorSatisfaction.get(3)+1;
                    majorSatisfaction.set(3,majorSatisfaction4);
                }else{
                    int majorSatisfaction5=majorSatisfaction.get(4)+1;
                    majorSatisfaction.set(4,majorSatisfaction5);
                }
                //获取生活满意度的数据
                if(i.getLifeSatisfaction().equals("非常不满意")){
                    int lifeSatisfaction1=lifeSatisfaction.get(0)+1;
                    lifeSatisfaction.set(0,lifeSatisfaction1);
                }else if(i.getLifeSatisfaction().equals("不满意")){
                    int lifeSatisfaction2=lifeSatisfaction.get(1)+1;
                    lifeSatisfaction.set(1,lifeSatisfaction2);
                }else if(i.getLifeSatisfaction().equals("一般")){
                    int lifeSatisfaction3=lifeSatisfaction.get(2)+1;
                    lifeSatisfaction.set(2,lifeSatisfaction3);
                }else if(i.getLifeSatisfaction().equals("比较满意")){
                    int lifeSatisfaction4=lifeSatisfaction.get(3)+1;
                    lifeSatisfaction.set(3,lifeSatisfaction4);
                }else{
                    int lifeSatisfaction5=lifeSatisfaction.get(4)+1;
                    lifeSatisfaction.set(4,lifeSatisfaction5);
                }
                //获取推荐程度的数据
                if(i.getRecommendation().equals("推荐报考本校本专业")){
                    int recommendation1=recommendation.get(0)+1;
                    recommendation.set(0,recommendation1);
                }else if(i.getRecommendation().equals("推荐报考其他学校本专业")){
                    int recommendation2=recommendation.get(1)+1;
                    recommendation.set(1,recommendation2);
                }else if(i.getRecommendation().equals("推荐报考本校其他专业")){
                    int recommendation3=recommendation.get(2)+1;
                    recommendation.set(2,recommendation3);
                }else{
                    int recommendation4=recommendation.get(3)+1;
                    recommendation.set(3,recommendation4);
                }
            }
            HashMap<String,List> map=new HashMap<>();
            map.put("age",age);
            map.put("edu",edu);
            map.put("majorSatisfaction",majorSatisfaction);
            map.put("lifeSatisfaction",lifeSatisfaction);
            map.put("recommendation",recommendation);
            response.getWriter().write(JSON.toJSONString(map));
        }
    }
}
