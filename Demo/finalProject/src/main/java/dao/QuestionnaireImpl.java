package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.questionnaire;
import utils.MybatisUtils;

public class QuestionnaireImpl implements QuestionnaireDao{
    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    QuestionnaireDao mapper = sqlSession.getMapper(QuestionnaireDao.class);
    @Override
    public int add(questionnaire quest) {
        //第三步：调用新增方法
        int n = mapper.add(quest);
        //第四步:提交事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }
}
