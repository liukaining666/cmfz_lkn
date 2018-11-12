package com.baizhi.controller;

import com.baizhi.entity.Master;
import com.baizhi.service.MasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/master")
public class MasterController {
    @Autowired
    private MasterService masterService;
    @RequestMapping("/findByPage")
    public @ResponseBody Map<String,Object> selectByPage(Integer page, Integer rows){//@ResponseBody 用于json
        Map<String,Object> results = new HashMap<String,Object>();
        //当前页数据rows:
        List<Master> emps = masterService.findByPage(page, rows);
        //总记录数
        Long totals = masterService.findTotals();
        results.put("total",totals);
        results.put("rows",emps);
        return results;
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(MultipartFile filename,HttpServletRequest request,Master master){

        Map<String,Object> map=new HashMap<String, Object>();
        //获取上传路径  相对路径 files    获取绝对路径
       // String realPath = request.getSession().getServletContext().getRealPath("/file");
        //获取文件名
        String originalFilename = filename.getOriginalFilename();
        try {
            master.setHeadPic("/qq/img/lunbotu/"+originalFilename);
            masterService.add(master);
            map.put("success",true);
        }catch (Exception e){
            map.put("success",false);
            String message = e.getMessage();
            map.put("message",message);
        }
        return map;
    }

    @RequestMapping("/delete")
    public @ResponseBody void delete(String id){
        masterService.remove(id);
    }
    @RequestMapping("/update")
    public @ResponseBody void update(MultipartFile filename,Master master){
        System.out.println(master);
        String originalFilename = filename.getOriginalFilename();
        master.setHeadPic("/qq/img/lunbotu/"+originalFilename);
        masterService.motify(master);

    }
    @RequestMapping("/queryById")
    public @ResponseBody
    Master queryById(String id){
        return   masterService.findById(id);
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
