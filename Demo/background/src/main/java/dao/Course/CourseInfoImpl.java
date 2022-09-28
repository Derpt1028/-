package dao.Course;

import org.apache.ibatis.session.SqlSession;
import pojo.Course;
import utils.MybatisUtils;

import java.util.List;

public class CourseInfoImpl implements CourseInfoDao {
    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    CourseInfoDao mapper = sqlSession.getMapper(CourseInfoDao.class);

    @Override
    public int add(Course courseInfo) {
        //第三步：调用新增方法
        int n = mapper.add(courseInfo);
        //第四步:提交事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }

    @Override
    public List<Course> findAll() {
        //第三步：调用方法，得到查询结果
        List<Course> courseList = mapper.findAll();
        sqlSession.close();
        return courseList;
    }

    @Override
    public List<Course> findQuery(String condition1,String condition2) {
        //第三步：调用方法，得到查询结果
        List<Course> courseList = mapper.findQuery(condition1,condition2);
        sqlSession.close();
        return courseList;
    }
}
