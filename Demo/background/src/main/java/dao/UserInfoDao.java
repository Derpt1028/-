package dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.UserInfo;

import java.util.List;

public interface UserInfoDao {

    //插入用户信息
    @Insert("insert ignore into user(email,password,username,birthday,nation,identityID) values(#{email},#{password},#{username},#{birthday},#{nation},#{identityID}) ")
    public int add(UserInfo userInfo);

    //修改用户信息
    @Update("update user set email=#{email},password=#{password},username=#{username},birthday=#{birthday},nation=#{nation},identityID=#{identityID} where email=#{email}")
    public int update(UserInfo userInfo);

    //查询所有用户
    @Select("select * from user")
    public List<UserInfo> findAll();

    //查询所有符合条件的用户
    @Select("select * from user where email like #{condition}")
    public List<UserInfo> findQuery(String condition);

    //查询所有符合条件的用户
    @Select("select * from user where identityID like #{condition}")
    public List<UserInfo> findQueryById(String condition);

    //删除用户
    @Delete("delete from user where email = #{email}")
    public int delete(String email);
}
