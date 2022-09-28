package dao;

import org.apache.ibatis.annotations.Select;
import pojo.School;

import java.util.List;

/**
 * 学校信息的接口类，用于访问学校表中的数据
 * */
public interface SchoolInfoDao {
    //查询所有符合条件的学历信息
    @Select("select * from schoolinfo where number like #{condition}")
    public List<School> findQueryOfSchoolInfo(int condition);

}
