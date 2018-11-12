package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("/findByPage")
    public @ResponseBody Map<String,Object>findByPage(Integer page,Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        //当前页数据rows:
        List<Course> emps = courseService.findByPage(page, rows);
        //总记录数
        Long totals = courseService.findTotals();
        results.put("total",totals);
        results.put("rows",emps);
        return results;
    }

    @RequestMapping("/add")
    public @ResponseBody Map<String,Object> save(Course course){
        System.out.println("111111");
        System.out.println(course);
        Map<String,Object> map=new HashMap<String, Object>();
        try {
            courseService.add(course);
            map.put("success",true);
        }catch (Exception e){
            map.put("success",false);
            String message = e.getMessage();
            map.put("message",message);
        }
        return map;
    }
    @RequestMapping("delete")
    public @ResponseBody void delete(String id){
        courseService.remove(id);
    }
}
