import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class AlbumTest extends BaseTest{
    @Autowired
    private AlbumService albumService;
    @Test
    public void test1(){
        List<Album> all = albumService.findAll();
        for (Album album : all) {
            System.out.println(album);
        }
    }
    @Test
    public void test2(){
        Album byId = albumService.findById("1");
        System.out.println(byId);
    }

    @Test
    public void test3(){
        Album album=new Album();
        album.setId("4");
        album.setTitle("aa");
        album.setAuthor("灰姑凉");
        album.setCoverimg("sss");
        album.setPublishDate(new Date());
        albumService.add(album);
    }
}
