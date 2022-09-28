package dao;

import org.apache.ibatis.annotations.Insert;
import pojo.EduInfo;

/**
 * 学历信息数据库操作接口
 */
public interface EduInfoDao {
    //插入学历信息
    @Insert("insert ignore into eduinfo(identityID,degree,school,name,studyType,studyTime,major) values(#{identityID},#{degree},#{school},#{name},#{studyType},#{studyTime},#{major}) ")
    public int add(EduInfo eduInfo);
}
