package pojo;

public class EduInfo {
    //用户的教育信息类,由身份证信息作为唯一标识码
    private String identityID;//身份证号码
    private String degree;//学历
    private String school;//毕业院校
    private String name;//真实姓名
    private String studyType;//学习形式（如：普通全日制，其他）
    private int studyTime;//学制
    private String major;//专业

    public String getIdentityID() {
        return identityID;
    }

    public void setIdentityID(String identityID) {
        this.identityID = identityID;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudyType() {
        return studyType;
    }

    public void setStudyType(String studyType) {
        this.studyType = studyType;
    }

    public int getStudyTime() {
        return studyTime;
    }

    public void setStudyTime(int studyTime) {
        this.studyTime = studyTime;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public EduInfo(){};
    public EduInfo(String identityID,String degree,String school,String name,String studyType,int studyTime,String major){
        this.identityID=identityID;
        this.degree=degree;
        this.school=school;
        this.name=name;
        this.studyType=studyType;
        this.studyTime=studyTime;
        this.major=major;
    }
}
