package service;

import dao.UserInfoDao;
import dao.UserInfoImpl;
import pojo.UserInfo;

import java.util.List;

public class UserInfoServiceImpl implements UserInfoService{
    UserInfoDao userInfoDao=new UserInfoImpl();

    @Override
    public List<UserInfo> findAll() {
        List<UserInfo> userall = userInfoDao.findAll();
        return userall;
    }

    @Override
    public List<UserInfo> findQuery(String condition) {
        return null;
    }
}