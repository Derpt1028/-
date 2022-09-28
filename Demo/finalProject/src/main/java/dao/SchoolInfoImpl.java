package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.School;
import utils.MybatisUtils;

import java.util.List;

public class SchoolInfoImpl implements SchoolInfoDao{

    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    SchoolInfoDao mapper = sqlSession.getMapper(SchoolInfoDao.class);
    @Override
    public List<School> findQueryOfSchoolInfo(int condition) {
        //根据学校编号查找学校信息
        //第三步：调用方法，得到查询结果
        List<School> userList = mapper.findQueryOfSchoolInfo(condition);
        sqlSession.close();
        return userList;
    }
}
