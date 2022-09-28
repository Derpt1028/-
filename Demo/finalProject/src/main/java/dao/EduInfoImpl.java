package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.EduInfo;
import utils.MybatisUtils;

public class EduInfoImpl implements EduInfoDao{
    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    EduInfoDao mapper = sqlSession.getMapper(EduInfoDao.class);
    @Override
    public int add(EduInfo eduInfo) {
        //第三步：调用新增方法
        int n = mapper.add(eduInfo);
        //第四步:提交事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }

}
