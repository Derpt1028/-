package pojo;

public class Course {
    //课程类，用于服务登陆后首页的添加课程
    private int CourseID;//课程id
    private String CourseName;//课程名
    private String CourseDescription;//课程描述
    private String imageURL;//课程图片URL


    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String courseName) {
        CourseName = courseName;
    }

    public String getCourseDescription() {
        return CourseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        CourseDescription = courseDescription;
    }

    public String getimageURL() {
        return imageURL;
    }

    public void setimageURL(String imgURL) {
        imageURL = imgURL;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int courseId) {
        CourseID = courseId;
    }


    public Course(){};
    public Course(int CourseId, String courseName, String courseDescription, String ImgURL){
        this.CourseID=CourseId;
        this.CourseName=courseName;
        this.CourseDescription=courseDescription;
        this.imageURL=ImgURL;
    }

    @Override
    public String toString() {
        return "Course{" +
                "CourseName='" + CourseName + '\'' +
                ", CourseDescription='" + CourseDescription + '\'' +
                '}';
    }
}
