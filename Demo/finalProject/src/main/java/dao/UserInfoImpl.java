package dao;

import org.apache.ibatis.session.SqlSession;
import pojo.EduInfo;
import pojo.UserInfo;
import utils.MybatisUtils;

import java.util.List;

public class UserInfoImpl implements UserInfoDao{

    //第一步：获取sqlSession对象
    SqlSession sqlSession = MybatisUtils.getSqlSession();
    //第二步：利用getMapper方法，执行sql语句
    UserInfoDao mapper = sqlSession.getMapper(UserInfoDao.class);
    @Override
    public int add(UserInfo userInfo) {
        //第三步：调用新增方法
        int n = mapper.add(userInfo);
        //第四步:提交事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }

    @Override
    public int addWhenRegister(UserInfo userInfo) {
        //第三步：调用新增方法
        int n = mapper.addWhenRegister(userInfo);
        //第四步:提交事物，增、删、改必须提交事物
        sqlSession.commit();
        //第五步：关闭
        sqlSession.close();
        return n;
    }

    @Override
    public int update(UserInfo userinfo) {
        //第三步：调用更新方法
        int update = mapper.update(userinfo);
        sqlSession.commit();
        sqlSession.close();
        return update;
    }

    @Override
    public List<UserInfo> findAll() {
        //第三步：调用方法，得到查询结果
        List<UserInfo> userList = mapper.findAll();
        sqlSession.close();
        return userList;
    }

    @Override
    public List<UserInfo> findQuery(String condition) {
        //第三步：调用方法，得到查询结果
        List<UserInfo> userList = mapper.findQuery(condition);
        sqlSession.close();
        return userList;
    }

    //根据用户email来删除信息
    @Override
    public int delete(String uid){
        //第三步：调用删除方法
        int delete = mapper.delete(uid);
        sqlSession.commit();
        sqlSession.close();
        return delete;
    }

    //查询所有学历信息
    @Override
    public List<EduInfo> findAllEduInfo() {
        List<EduInfo> eduInfoList=mapper.findAllEduInfo();
        sqlSession.close();
        return  eduInfoList;
    }

    //根据身份证信息来查找学历信息
    @Override
    public List<EduInfo> findQueryOfEduInfo(String condition) {
        List<EduInfo> eduInfoList=mapper.findQueryOfEduInfo(condition);
        sqlSession.close();
        return  eduInfoList;
    }

    @Override
    public List<UserInfo> findQueryById(String condition) {
        //第三步：调用方法，得到查询结果
        List<UserInfo> userList = mapper.findQueryById(condition);
        sqlSession.close();
        return userList;
    }

    @Override
    public int updateLastLoginIn(String condition1,String condition2) {
        //第三步：调用更新方法
        int update = mapper.updateLastLoginIn(condition1,condition2);
        sqlSession.commit();
        sqlSession.close();
        return update;
    }

}
