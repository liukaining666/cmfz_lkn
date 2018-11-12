import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.NoSuchAlgorithmException;

public class UserTest extends BaseTest{
    @Autowired
    private UserService userService;
    @Test
    public void test1() throws NoSuchAlgorithmException {
        User user=new User();
        user.setUsername("000");
        user.setPassword("666");

        userService.add(user);
    }

    @Test
    public void tets2(){
        User user=new User();
        user.setUsername("1333");

        user.setPassword("12345");
        User user1 = userService.find(user);
        System.out.println(user1);
    }

    @Test
    public void test3(){
        User user=new User();
        user.setPassword("222");
        user.setPhoneNum("123");
        user.setUsername("aaa");
        userService.motify(user);
    }
}
