import com.baizhi.entity.Master;
import com.baizhi.service.MasterService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MasterTest extends BaseTest{
    @Autowired
    private MasterService masterService;
    @Test
    public void test1(){
        List<Master> byPage = masterService.findByPage(1, 1);
        for (Master master : byPage) {
            System.out.println(master);
        }
    }
}
