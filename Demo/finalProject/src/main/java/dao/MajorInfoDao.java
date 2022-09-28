package dao;

import org.apache.ibatis.annotations.Select;
import pojo.major;

import java.util.List;

/**
 * 专业信息数据接口，用于访问存放专业信息的数据库
 * */
public interface MajorInfoDao {
    //查询所有符合条件的专业信息
    @Select("select * from major where number like #{condition}")
    public List<major> findQueryOfMajorInfo(int condition);
}
