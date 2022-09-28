package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.StudyList;
import pojo.UserInfo;
import utils.MybatisUtils;

import java.util.List;

public class StudyListImpl implements StudyListDao {
    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    StudyListDao mapper = sqlSession.getMapper(StudyListDao.class);

    @Override
    public int add(StudyList studyList) {
        //第三步：调用新增方法
        int n = mapper.add(studyList);
        //第四步:提交事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }

    @Override
    public List<StudyList> findAll() {
        //第三步：调用方法，得到查询结果
        List<StudyList> studyList = mapper.findAll();
        sqlSession.close();
        return studyList;
    }

    @Override
    public List<StudyList> findQuery(String condition) {
        //第三步：调用方法，得到查询结果
        List<StudyList> studyList = mapper.findQuery(condition);
        sqlSession.close();
        return studyList;
    }

    //根据用户email来删除信息
    @Override
    public int delete(String email,int CourseID){
        //第三步：调用删除方法
        int delete = mapper.delete(email,CourseID);
        sqlSession.commit();
        sqlSession.close();
        return delete;
    }
}
