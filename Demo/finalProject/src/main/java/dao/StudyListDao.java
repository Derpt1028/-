package dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import pojo.StudyList;

import java.util.List;

public interface StudyListDao {

    //插入用户信息
    @Insert("insert ignore into studylist(email,CourseID) values(#{email},#{CourseID}) ")
    public int add(StudyList studyList);

    //查询所有学习清单
    @Select("select * from studylist")
    public List<StudyList> findAll();

    //查询特定用户(通过email来进行查找)选择的学习清单
    @Select("select * from studylist where email like #{condition}")
    public List<StudyList> findQuery(String condition);

    //删除课程
    @Delete("delete from studylist where email=#{email} and CourseID=#{CourseID}")
    public int delete(@Param("email")String email, @Param("CourseID")int CourseID);
}
