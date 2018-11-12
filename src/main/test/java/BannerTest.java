import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class BannerTest extends BaseTest{
    @Autowired
    private BannerService bannerService;
    @Test
    public void test1(){
        List<Banner> banners = bannerService.findByPage(1,2);
        for (Banner banner : banners) {
            System.out.println(banner);
        }
    }

    @Test
    public void test2(){
        Banner banner=new Banner();
        banner.setTitle("和尚6");
        banner.setLujing("/qq/js/1.jsp");
        banner.setTimes(new Date());
        banner.setStatus("q");
        banner.setDescs("轮播图6");
        bannerService.add(banner);
    }

    @Test
    public void test3(){
        Banner byId = bannerService.findById("1");
        System.out.println(byId);
    }
    @Test
    public void test4(){
        Banner banner=new Banner();
        banner.setId("1");
        banner.setDescs("1");
        banner.setLujing("1");
        banner.setTitle("1");
        banner.setStatus("1");
        bannerService.motify(banner);
    }
}
