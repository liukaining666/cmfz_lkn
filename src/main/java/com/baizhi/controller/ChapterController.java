package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.FileUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;
    @RequestMapping("/add")
    public @ResponseBody
    Map<String,Object> save(MultipartFile filename, String id, HttpServletRequest request, Chapter chapter) throws IOException {
        Map<String,Object> map=new HashMap<String, Object>();
        try {
            String path = FileUtil.saveFile(filename,"/qq/img/chapter/",request);
            System.out.println(path);
            String timeLength = FileUtil.AudioLength(path, request);
            System.out.println("时长为"+timeLength);
          // String originalFilename = filename.getOriginalFilename();
            String size = String.valueOf(FileUtil.AudioSize(path, request));
            System.out.println("大小"+size);
            chapter.setSize(size+"M");
            chapter.setDownPath(path);
            chapter.setDuration(timeLength);
            chapter.setZjid(id);
            chapterService.add(chapter);
            map.put("success",true);
        }catch (Exception e){
            System.out.println(e.getMessage());
            map.put("success",false);
            String message = e.getMessage();
            map.put("message",message);
        }
        return map;
    }




    @RequestMapping("/download")
    public void download(String filename,String openstyle,HttpServletRequest request, HttpServletResponse response) throws Exception {

        //获取文件的绝对路径
        String realPath = request.getSession().getServletContext().getRealPath(filename);
        System.out.println(realPath);
        //以文件输入流读取文件
        FileInputStream fis=new FileInputStream(new File(realPath));

        //设置响应头     openstyle设置的下载方式
        response.setHeader("content-disposition",openstyle+";filename="+ URLEncoder.encode(filename,"UTF-8"));
        //以响应写文件
        ServletOutputStream os = response.getOutputStream();
        IOUtils.copy(fis, os);
        IOUtils.closeQuietly(fis);
        IOUtils.closeQuietly(os);
    }
}
