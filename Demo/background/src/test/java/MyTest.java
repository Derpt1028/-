import dao.Course.CourseInfoImpl;
import dao.UserInfoImpl;
import org.junit.Test;
import pojo.Course;
import pojo.UserInfo;

import java.util.List;

public class MyTest {
    @Test
    //测试insert方法
    public void testInsert(){
        //调用实现类UserInfoImpl中的add方法，传递具体的值
        int add = new UserInfoImpl().add(new UserInfo("100086@gamil.com", "123", "12211", "2002-10-28", "中国大陆", "123"));
        //判断
        if (add>0){
            System.out.println("success");
        }else {
            System.out.println("fail");
        }
    }

    @Test
    public void testUpdate(){
        int update = new UserInfoImpl().update(new UserInfo("test", "test111", "test", "0", "test", "test"));
        if (update>0){
            System.out.println("success");
        }else {
            System.out.println("fail");
        }
    }

    @Test
    public void testFindQuery(){
        String key2="Admin";
        key2="%" + key2 + "%";
        System.out.println(key2);
        List<UserInfo> userinfos = new UserInfoImpl().findQuery(key2);
        System.out.println(userinfos.get(0).getEmail());

    }

    @Test
    public void testDelete(){
        int delete = new UserInfoImpl().delete("test");
        if (delete>0){
            System.out.println("success");
        }else {
            System.out.println("fail");
        }
    }

    @Test
    //测试insert方法
    public void testInsert2(){
        //调用实现类UserInfoDaoImpl中的add方法，传递具体的值
        int add = new CourseInfoImpl().add(new Course(13, "test", "test", "test"));
        //判断
        if (add>0){
            System.out.println("success");
        }else {
            System.out.println("fail");
        }
    }

    @Test
    //测试通过用户id查找信息
    public void test3(){
        List<UserInfo> result=new UserInfoImpl().findQueryById("1234");
        System.out.println(result);

    }
}
