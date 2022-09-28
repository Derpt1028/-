package pojo;

public class major {
    //专业信息类，用于访问专业表
    private int number;//专业编号
    private String majorName;//专业名称

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }
    public major(){};
    public major(int number,String majorName){
        this.number=number;
        this.majorName=majorName;
    }
}
