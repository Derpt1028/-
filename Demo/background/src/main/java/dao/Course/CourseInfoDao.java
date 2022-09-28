package dao.Course;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import pojo.Course;
import pojo.UserInfo;

import java.util.List;

public interface CourseInfoDao {
    //插入课程信息
    @Insert("insert ignore into courseselect(CourseID,CourseName,CourseDescription,imageURL) values(#{CourseID},#{CourseName},#{CourseDescription},#{imageURL})")
    public int add(Course courseInfo);

    //查询所有用户
    @Select("select * from courseselect")
    public List<Course> findAll();

    //查询所有符合条件的用户(课程ID和课程名两个条件)
    @Select("select * from courseselect where CourseID like #{condition1} and CourseName like #{condition2}")
    public List<Course> findQuery(@Param("condition1") String condition1, @Param("condition2")String condition2);
}
