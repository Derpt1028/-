package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import pojo.questionnaire;

import java.util.List;

/**
 * 调查问卷数据接口，用于访问存放问卷结果的数据库
 * */
public interface QuestionnaireDao {
    //插入用户信息
    @Insert("insert ignore into questionnaire(username,major,tele,education,age,majorSatisfaction,lifeSatisfaction,recommendation,advice) values(#{username},#{major},#{tele},#{education},#{age},#{majorSatisfaction},#{lifeSatisfaction},#{recommendation},#{advice}) ")
    public int add(questionnaire quest);

    //查询所有问卷信息
    @Select("select * from questionnaire")
    public List<questionnaire> findAll();
}
