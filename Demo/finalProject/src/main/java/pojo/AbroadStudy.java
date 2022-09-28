package pojo;

public class AbroadStudy {
    //出国留学申请类
    private String identityID;//申请的用户的身份证
    private String Name;//申请的用户的真实姓名
    private String SchoolName;//用户申请的学校名
    private String Result;//用户申请的结果(默认为待审批)

    public String getIdentityID() {
        return identityID;
    }

    public void setIdentityID(String identityID) {
        this.identityID = identityID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getSchoolName() {
        return SchoolName;
    }

    public void setSchoolName(String schoolName) {
        SchoolName = schoolName;
    }

    public String getResult() {
        return Result;
    }

    public void setResult(String result) {
        Result = result;
    }
    public AbroadStudy(){};
    public AbroadStudy(String identityID,String Name,String SchoolName,String Result){
        this.identityID=identityID;
        this.Name=Name;
        this.SchoolName=SchoolName;
        this.Result=Result;
    }
}
