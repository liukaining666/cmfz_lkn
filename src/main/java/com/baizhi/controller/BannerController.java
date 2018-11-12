package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    @RequestMapping("/findByPage")
    public @ResponseBody Map<String,Object> selectByPage(Integer page, Integer rows,HttpServletRequest request){//@ResponseBody 用于json
        Map<String,Object> results = new HashMap<String,Object>();
        //当前页数据rows:
        List<Banner> emps = bannerService.findByPage(page, rows);
        request.getSession().setAttribute("banner",emps);
        //总记录数
        Long totals = bannerService.findTotals();
        results.put("total",totals);
        results.put("rows",emps);
        return results;
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(MultipartFile filename,HttpServletRequest request,Banner banner) throws IOException {

        Map<String,Object> map=new HashMap<String, Object>();
        //获取上传路径  相对路径 files    获取绝对路径
        String realPath = request.getSession().getServletContext().getRealPath("/qq/img/lunbotu");
        //获取文件名
        String originalFilename = filename.getOriginalFilename();
        filename.transferTo(new File(realPath,originalFilename));
        try {
            banner.setLujing("/qq/img/lunbotu/"+originalFilename);
            bannerService.add(banner);
            map.put("success",true);
        }catch (Exception e){
            map.put("success",false);
            String message = e.getMessage();
            map.put("message",message);
        }
        return map;
    }

    @RequestMapping("/delete")
    public  void delete(String id){
        bannerService.remove(id);
    }
    @RequestMapping("/update")
    public @ResponseBody void update(MultipartFile filename,Banner banner){
        System.out.println(banner);
        String originalFilename = filename.getOriginalFilename();
        banner.setLujing("/qq/img/lunbotu/"+originalFilename);
        bannerService.motify(banner);

    }
    @RequestMapping("/queryById")
    public @ResponseBody Banner queryById(String id){
        return   bannerService.findById(id);
    }

   /* @Controller
    @RequestMapping("/file")
    public class Fileupload {
        @RequestMapping("/upload")
        public String upload(MultipartFile filename, HttpServletRequest request) throws IOException {
            //获取上传路径  相对路径 files    获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath("/file");
            //上传
            filename.transferTo(new File( realPath,filename.getOriginalFilename()));
            return "index";
        }*/
}
