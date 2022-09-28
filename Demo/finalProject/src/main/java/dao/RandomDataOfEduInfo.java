package dao;

import pojo.EduInfo;

import java.util.Random;

public class RandomDataOfEduInfo {
    public static boolean AddDateToTable(EduInfo eduInfo){
        //调用插入数据库的操作，如果成功则返回true，否则返回false
        int result=new EduInfoImpl().add(eduInfo);
        if(result>0){
            return true;
        }else {
            return false;
        }
    }
    public static String RandomDataOfID(){
        //生成随机的身份证信息
        Random random=new Random();
        String Result=""+(random.nextInt(2000000000)+1);
        return Result;
    }
    public static String RandomDataOfDegree(){
        //生成随机的学历信息(中国的本科、硕士生、博士生的比例是36：4.2：1)
        Random random=new Random();
        int flag=random.nextInt(412)+1;//生成1到412的随机数据
        String result="";//初始化返回结果
        if(flag<=360){
            result="本科";
        }else if(flag<=402){
            result="硕士";
        }else{
            result="博士";
        }
        return result;
    }
    public static String RandomDataOfSchool(){
        Random random=new Random();
        int flag=random.nextInt(2756)+1;//数据表中共2756条数据
        String result=new SchoolInfoImpl().findQueryOfSchoolInfo(flag).get(0).getSchoolName();
        return result;
    }
    //产生指定范围的随机整数
    public static int getNum(int start, int end) {
        //Math.random()，生成0到1之间随机数，随机数可为0，不能取到1
        return (int) (Math.random() * (end - start + 1) + start);
    }
    /**
     * 返回中文姓名，并设置性别，思路如下：
     * 1.设置一个【姓】的字符串，随机从该字符串中取一个字符，得到姓名中的姓
     * 2.分别设置一个女性名和男性名的字符串
     * 3.随机性别，从女性名或男性名的字符串取一个字符，得到姓名中名的第一个字
     * 4.随机产生是否有姓名中名的第二个字，如果有则从女性名或男性名的字符串取一个字符
     * 5.将1、3、4产生的字符拼接成最后的随机姓名
     */
    //定义中文姓名中【姓】字符串，可修改
    private static String firstName = "赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常乐于时傅皮卞齐康伍余元卜顾孟平黄和穆萧尹姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈项祝董梁杜阮蓝闵席季麻强贾路娄危江童颜郭梅盛林刁钟徐邱骆高夏蔡田樊胡凌霍虞万支柯咎管卢莫经房裘缪干解应宗宣丁贲邓郁单杭洪包诸左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄魏加封芮羿储靳汲邴糜松井段富巫乌焦巴弓牧隗山谷车侯宓蓬全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎祖武符刘姜詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲台从鄂索咸籍赖卓蔺屠蒙池乔阴郁胥能苍双闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍却璩桑桂濮牛寿通边扈燕冀郏浦尚农温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎戈廖庚终暨居衡步都耿满弘匡国文寇广禄阙东殴殳沃利蔚越夔隆师巩厍聂晁勾敖融冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后江红游竺权逯盖益桓公万俟司马上官欧阳夏侯诸葛闻人东方赫连皇甫尉迟公羊澹台公冶宗政濮阳淳于仲孙太叔申屠公孙乐正轩辕令狐钟离闾丘长孙慕容鲜于宇文司徒司空亓官司寇仉督子车颛孙端木巫马公西漆雕乐正壤驷公良拓拔夹谷宰父谷粱晋楚阎法汝鄢涂钦段干百里东郭南门呼延归海羊舌微生岳帅缑亢况后有琴梁丘左丘东门西门商牟佘佴伯赏南宫墨哈谯笪年爱阳佟第五言福百家姓续";
    //定义中文姓名中女性【名】字符串，可修改
    private static String girl = "秀娟英华慧巧美娜静淑惠珠翠雅芝玉萍红娥玲芬芳燕彩春菊兰凤洁梅琳素云莲真环雪荣爱妹霞香月莺媛艳瑞凡佳嘉琼勤珍贞莉桂娣叶璧璐娅琦晶妍茜秋珊莎锦黛青倩婷姣婉娴瑾颖露瑶怡婵雁蓓纨仪荷丹蓉眉君琴蕊薇菁梦岚苑婕馨瑗琰韵融园艺咏卿聪澜纯毓悦昭冰爽琬茗羽希宁欣飘育滢馥筠柔竹霭凝晓欢霄枫芸菲寒伊亚宜可姬舒影荔枝思丽 ";
    //定义中文姓名中男性【名】字符串，可修改
    private static String boy = "伟刚勇毅俊峰强军平保东文辉力明永健世广志义兴良海山仁波宁贵福生龙元全国胜学祥才发武新利清飞彬富顺信子杰涛昌成康星光天达安岩中茂进林有坚和彪博诚先敬震振壮会思群豪心邦承乐绍功松善厚庆磊民友裕河哲江超浩亮政谦亨奇固之轮翰朗伯宏言若鸣朋斌梁栋维启克伦翔旭鹏泽晨辰士以建家致树炎德行时泰盛雄琛钧冠策腾楠榕风航弘";
    public static String name_sex = "";
    public static String getChineseName() {
        //随机从字符串firstName（姓）中产生一个随机整数
        int index = getNum(0, firstName.length() - 1);
        //根据上面的随机整数获取到对应的字符，即得到【姓】
        String first = firstName.substring(index, index + 1);
        //随机性别，0代表女，1代表男
        int sex = getNum(0, 1);
        //boy为男性名字符串
        String str = boy;
        int length = boy.length();
        if (sex == 0) {
            str = girl;//如果随机性别为0，则从女性名字符串girl中取名
            length = girl.length();
            name_sex = "女";
        } else {
            name_sex = "男";
        }
        index = getNum(0, length - 1);
        //名字的第1个字
        String second = str.substring(index, index + 1);
        //名字的第2字根据随机为有或没有
        int hasThird = getNum(0, 1);
        String third = "";
        if (hasThird == 1) {
            index = getNum(0, length - 1);
            third = str.substring(index, index + 1);
        }
        return first + second + third;
    }

    public static String RandomOfStudyType(){
        //随机生成学习形式
        Random random=new Random();
        int flag=random.nextInt(2)+1;//生成1到2的随机数
        if(flag==1){
            return "普通全日制";
        }else{
            return "其他";
        }
    }

    public static int RandomOfStudyTime(){
        //随机生成学制
        Random random=new Random();
        return random.nextInt(2)+4;//一般学制为4到5年
    }

    public static String RandomOfMajor(){
        Random random=new Random();
        int flag=random.nextInt(381)+1;//二级学科数据表中共381条数据
        String result=new MajorInfoImpl().findQueryOfMajorInfo(flag).get(0).getMajorName();
        return result;
    }
    public static void main(String[] args) {
        //生成total条高等信息教育随机数据
        int total=10000;//定义的生成高等教育信息数据的个数
        for(int i=0;i<total;){
            System.out.println("正在生成数据:("+(i+1)+"/"+total+")");
            String identityID;//身份证号码
            String degree;//学历
            String school;//毕业院校
            String name;//真实姓名
            String studyType;//学习形式（如：普通全日制，其他）
            int studyTime;//学制
            String major;//专业
            identityID=RandomDataOfID();//随机生成身份证信息
            degree=RandomDataOfDegree();//随机生成学历
            school=RandomDataOfSchool();//随机生成毕业院校
            name=getChineseName();//随机生成中文名
            studyType=RandomOfStudyType();//随机生成学习形式
            studyTime=RandomOfStudyTime();//随机生成学制
            major=RandomOfMajor();//随机生成专业
            if(AddDateToTable(new EduInfo(identityID,degree,school,name,studyType,studyTime,major))){
                //如果添加成功则i++
                i++;
            }
        }
    }
}
