package dao.Course;

import dao.DatabaseConnection;
import pojo.Course;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class getCourseInfo implements CourseDao {
    private List<Course> list = new ArrayList<>();
    @Override
    public List<Course> getCourseInfo() {
        DatabaseConnection dc=new DatabaseConnection();
        Connection cc=dc.getConnection();
        //创造执行环境
        try {
            Statement statement=cc.createStatement();
            ResultSet result=statement.executeQuery("select * from courseselect");
            while (result.next()){
                String CN=result.getString("CourseName");//数据库获取课程名
                String CD=result.getString("CourseDescription");//数据库获取课程描述
                String ImgURL=result.getString("imageURL");//数据库获取课程图片的URL地址
                int CI= result.getInt("CourseId");//得到课程ID
                Course c=new Course(CI,CN,CD,ImgURL);
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
