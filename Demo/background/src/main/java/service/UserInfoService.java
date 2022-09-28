package service;

import pojo.UserInfo;

import java.util.List;

public interface UserInfoService {
    public List<UserInfo> findAll();
    public List<UserInfo> findQuery(String condition);
}
