package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    String driver="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/finalproject";
    String user="root";
    String password="20021028";
    public Connection getConnection() {
        Connection conn=null;
        try {
            //这两句话会抛异常！
            Class.forName(driver);//加载驱动
            conn=DriverManager.getConnection(url,user,password); //和数据库建立连接
        } catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();  //异常处理不明白，就按照这么写了
        }
        return conn;  //方法要记得返回一个连接对象
    }

    public static void main(String[] args) throws SQLException {   //cc.close()的异常在这里抛出去了
        DatabaseConnection dc=new DatabaseConnection();  //创建这个类的对象 测试下 数据库连接成功没
        Connection cc=dc.getConnection();
        System.out.println(cc);
        cc.close();
    }
}
