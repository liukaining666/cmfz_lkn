package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    @RequestMapping("/findAll")
    public @ResponseBody List<Album>findAll(HttpServletRequest request){
        List<Album> all = albumService.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("album",all);
        return all;
    }
    @RequestMapping("/findById")
    public @ResponseBody Album findById(String id){
        System.out.println(id);
        Album byId = albumService.findById(id);
        return  byId;
    }
    @RequestMapping("/add")
    public @ResponseBody Map<String,Object> save(MultipartFile filename, HttpServletRequest request, Album album) throws IOException {
        System.out.println(album);
        Map<String,Object> map=new HashMap<String, Object>();
        //获取上传路径  相对路径 files    获取绝对路径
         String realPath = request.getSession().getServletContext().getRealPath("/qq/img/lunbotu");
        //获取文件名
        String originalFilename = filename.getOriginalFilename();
        System.out.println(originalFilename);
        filename.transferTo(new File(realPath,originalFilename));
        try {
            System.out.println("成功");
            album.setCoverimg("/qq/img/lunbotu/"+originalFilename);
            albumService.add(album);
            map.put("success",true);
        }catch (Exception e){
            System.out.println(e.getMessage());
            map.put("success",false);
            String message = e.getMessage();
            map.put("message",message);
        }
        return map;
    }
}
