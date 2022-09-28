package pojo;

public class StudyList {
    //用户的选课类
    private String email;//用户的邮箱
    private int CourseID;//课程ID

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int courseID) {
        CourseID = courseID;
    }

    public StudyList(){};
    public StudyList(String email,int CourseID){
        this.email=email;
        this.CourseID=CourseID;
    }

    @Override
    public String toString() {
        return "StudyList{" +
                "email='" + email + '\'' +
                ", CourseId=" + CourseID +
                '}';
    }
}
