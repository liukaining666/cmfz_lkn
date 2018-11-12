import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminTest extends BaseTest{
    @Autowired
    private AdminService adminService;
    @Test
    public void test1(){
        Admin admin=new Admin();
        admin.setUsername("lkn");
        admin.setPassword("1");
        Admin login = adminService.findAll(admin);
        System.out.println(login);
    }

    @Test
    public void test2(){
        Admin admin=new Admin();
        admin.setId("1");
        admin.setPassword("22");
        adminService.motify(admin);
    }

    @Test
    public void test3(){
        Admin admin = adminService.findbyId("1");
        System.out.println(admin);
    }
}
