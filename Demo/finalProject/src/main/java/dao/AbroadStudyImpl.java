package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.AbroadStudy;
import utils.MybatisUtils;

import java.util.List;

/**
 * 申请留学类的实现类
 */
public class AbroadStudyImpl implements AbroadStudyDao{

    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    AbroadStudyDao mapper = sqlSession.getMapper(AbroadStudyDao.class);

    //新增一条信息记录
    @Override
    public int add(AbroadStudy abroadStudy) {
        //第三步：调用新增方法
        int n = mapper.add(abroadStudy);
        //第四步:提交是事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }

    //更改记录信息(一般调用此操作时改变Result里的值)
    @Override
    public int update(AbroadStudy abroadStudy) {
        //第三步：调用更新方法
        int update = mapper.update(abroadStudy);
        sqlSession.commit();
        sqlSession.close();
        return update;
    }

    @Override
    public List<AbroadStudy> findAll() {
        //第三步：调用方法，得到查询结果
        List<AbroadStudy> userList = mapper.findAll();
        sqlSession.close();
        return userList;
    }

    @Override
    public List<AbroadStudy> findQuery(String condition) {
        //第三步：调用方法，得到查询结果
        List<AbroadStudy> userList = mapper.findQuery(condition);
        sqlSession.close();
        return userList;
    }

}
