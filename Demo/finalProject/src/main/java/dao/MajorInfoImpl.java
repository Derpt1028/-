package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.School;
import pojo.major;
import utils.MybatisUtils;

import java.util.List;

public class MajorInfoImpl implements MajorInfoDao{
    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    MajorInfoDao mapper = sqlSession.getMapper(MajorInfoDao.class);

    @Override
    public List<major> findQueryOfMajorInfo(int condition) {
        //根据专业编号查找学校信息
        //第三步：调用方法，得到查询结果
        List<major> userList = mapper.findQueryOfMajorInfo(condition);
        sqlSession.close();
        return userList;
    }
}
