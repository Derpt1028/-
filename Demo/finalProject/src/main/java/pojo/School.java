package pojo;

/**
 * 学校信息表，现阶段用于在教育信息表中随机生成用户的毕业高校
 * */
public class School {
    private int number;//学校编号
    private String schoolName;//学校名

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public School(){};
    public School(int number,String schoolName){
        this.number=number;
        this.schoolName=schoolName;
    }
}
