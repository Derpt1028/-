package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.AbroadStudy;

import java.util.List;

/**
 * 申请出国留学服务的接口类
 */
public interface AbroadStudyDao {
    //新增一条申请
    @Insert("insert ignore into abroadstudy(identityID,Name,SchoolName,Result) values(#{identityID},#{Name},#{SchoolName},#{Result}) ")
    public int add(AbroadStudy abroadStudy);

    //修改申请信息
    @Update("update abroadstudy set identityID=#{identityID},Name=#{Name},SchoolName=#{SchoolName},Result=#{Result} where identityID=#{identityID} and SchoolName=#{SchoolName}")
    public int update(AbroadStudy abroadStudy);

    //查询所有申请信息
    @Select("select * from abroadstudy")
    public List<AbroadStudy> findAll();

    //查询所有符合条件的申请信息
    @Select("select * from abroadstudy where identityID like #{identityID}")
    public List<AbroadStudy> findQuery(String condition);
}
