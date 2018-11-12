import com.baizhi.dao.MenuDao;
import com.baizhi.entity.Menu;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MenuTest extends BaseTest{
    @Autowired
    private MenuDao menuDao;
    @Test
    public void test1(){
        List<Menu> menus = menuDao.queryAll();
        for (Menu menu : menus) {
            System.out.println(menu);
        }
    }
}
