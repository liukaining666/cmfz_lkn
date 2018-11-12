import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ChapterTest extends BaseTest{
    @Autowired
    private ChapterService chapterService;
    @Test
    public void test1(){
        Chapter chapter=new Chapter();
        chapter.setTitle("aa");
        chapter.setDuration("1");
        chapterService.add(chapter);
    }
}
