package pojo;

public class questionnaire {
    //调查问卷类，用于存放调查问卷结果
    String username;//用户姓名
    String major;//用户专业
    String tele;//联系方式
    String education;//受教育程度
    String age;//年龄
    String majorSatisfaction;//专业满意度
    String lifeSatisfaction;//生活满意度
    String recommendation;//推荐意志
    String advice;//建议

    public questionnaire(String username, String major, String tele, String education, String age, String majorSatisfaction, String lifeSatisfaction, String recommendation, String advice) {
        this.username = username;
        this.major = major;
        this.tele = tele;
        this.education = education;
        this.age = age;
        this.majorSatisfaction = majorSatisfaction;
        this.lifeSatisfaction = lifeSatisfaction;
        this.recommendation = recommendation;
        this.advice = advice;
    }

    public questionnaire() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getMajorSatisfaction() {
        return majorSatisfaction;
    }

    public void setMajorSatisfaction(String majorSatisfaction) {
        this.majorSatisfaction = majorSatisfaction;
    }

    public String getLifeSatisfaction() {
        return lifeSatisfaction;
    }

    public void setLifeSatisfaction(String lifeSatisfaction) {
        this.lifeSatisfaction = lifeSatisfaction;
    }

    public String getRecommendation() {
        return recommendation;
    }

    public void setRecommendation(String recommendation) {
        this.recommendation = recommendation;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    @Override
    public String toString() {
        return "questionnaire{" +
                "username='" + username + '\'' +
                ", major='" + major + '\'' +
                ", tele='" + tele + '\'' +
                ", education='" + education + '\'' +
                ", age='" + age + '\'' +
                ", majorSatisfaction='" + majorSatisfaction + '\'' +
                ", lifeSatisfaction='" + lifeSatisfaction + '\'' +
                ", recommendation='" + recommendation + '\'' +
                ", advice='" + advice + '\'' +
                '}';
    }
}
