package pojo;


import java.util.Date;

public class UserInfo {
    //用户类，用于获取用户信息(待完善)
    private String email;//用户id信息
    private String password;//用户密码
    private String username;//用户身份证信息
    private String birthday;//用户生日（可以在该日期推送不同内容）
    private String nation;//用户国籍
    private String identityID;//用户身份证号码
    private String lastLoginIn;//用户上次登陆的时间

    public UserInfo(){}
    public UserInfo(String email,String password,String username,String birthday,String nation,String identityID){
        this.email=email;//用户id信息
        this.password=password;//用户密码
        this.username=username;//用户身份证信息
        this.birthday=birthday;//用户生日（可以在该日期推送不同内容）
        this.nation=nation;//用户国籍
        this.identityID=identityID;//用户身份证号码
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getIdentityID() {
        return identityID;
    }

    public void setIdentityID(String identityID) {
        this.identityID = identityID;
    }

    public String getLastLoginIn() {
        return lastLoginIn;
    }

    public void setLastLoginIn(String lastLoginIn) {
        this.lastLoginIn = lastLoginIn;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", birthday=" + birthday +
                ", nation='" + nation + '\'' +
                ", identityID='" + identityID + '\'' +
                '}';
    }
}
