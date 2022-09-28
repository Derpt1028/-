package dao;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Random;

public class RandomData {
    public static void main(String[] args){
        //生成一万条随机数据
        int sum=1;
        while(sum<=10000){
            System.out.println("正在生成随机数据("+sum+"/10000)");
            Random ran=new Random();
            int flag=ran.nextInt(4)+6;//生成6到9中的随机整数
            double emailPart1=0;//邮箱地址的第一部分(数字)
            switch (flag){
                //根据flag的值生成对应位数的随机数值
                case 6:emailPart1=ran.nextDouble()*1000000;break;
                case 7:emailPart1=ran.nextDouble()*10000000;break;
                case 8:emailPart1=ran.nextDouble()*100000000;break;
                case 9:emailPart1=ran.nextDouble()*1000000000;break;
            }
            int emailNum=(int)emailPart1;
            int location=ran.nextInt(4);//设置邮箱地址
            String email=null;
            switch (location){
                case 0:email=""+emailNum+"@gmail.com";break;
                case 1:email=""+emailNum+"@qq.com";break;
                case 2:email=""+emailNum+"@163.com";break;
                case 3:email=""+emailNum+"@aliyun.com";break;
                default:email=""+emailNum+"@gdjyw.com";//否则设置为项目网站的地址（瞎编的）
            }

            //生成随机密码
            //密码的格式
            String basePassword = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#%&*_?";
            int flag2=ran.nextInt(7)+5;//生成5到11中的随机整数
            String password="";//初始化password
            for(int i=0;i<flag2;i++){
                password=password+basePassword.charAt(ran.nextInt(70));
            }

            //生成随机用户名(用英文算了）
            String name = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int flag3 = ran.nextInt(10)+5;//生成5到14位的用户名
            String username="";//初始化用户名
            for(int i=0;i<flag3;i++){
                username=username+name.charAt(ran.nextInt(62));
            }

            //生成随机生日
            Calendar calendar = Calendar.getInstance();
            int year = ran.nextInt(101)+(calendar.get(Calendar.YEAR)-100);//默认年龄最大只有100岁（希望大家长命百岁OVO）
            int month=ran.nextInt(12)+1;
            int day=1;
            if(month==4||month==6||month==9||month==11){
                //如果月份只有三十天的话，重新生成小于31天的day
                day=ran.nextInt(30)+1;
            }
            if(month==2){
                //如果是2月，只有28天或者29天
                if(year%4==0){
                    //闰年
                    day=ran.nextInt(29)+1;
                }else{
                    day=ran.nextInt(28)+1;
                }
            }
            String birthday=""+year+"-"+month+"-"+day;

            //数据库插入数据
            DatabaseConnection dc=new DatabaseConnection();
            Connection cc=dc.getConnection();
            //创造执行环境
            try {
                Statement statement=cc.createStatement();
                //先验证账号是否存在
                ResultSet result=statement.executeQuery("select * from user");
                boolean ifExists=false;//默认账号不存在
                while(result.next()){
                    if(result.getString("username").equals(email)){
                        //验证失败,账号存在
                        ifExists=true;
                    }
                }
                if(!ifExists){
                    //注册成功,插入数据
                    statement.executeUpdate("insert into user values ("+
                            "\'"+ email+"\'"
                            +",\'"+ password+"\'"
                            +",\'"+ username+"\'"
                            +",\'"+birthday+"\');");
                    sum++;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
