package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    public String login(Admin admin,String code, HttpServletRequest request){

        Admin login = adminService.findAll(admin);
        String validationCode = (String) request.getSession().getAttribute("validationCode");
        if(login!=null){
            if(validationCode.equals(code)){
                HttpSession session = request.getSession();
                session.setAttribute("admin",login);
                return "redirect:/qq/main/main.jsp";
            }else {
                return "redirect:/qq/login.jsp";
            }
        }else {
            return "redirect:/qq/login.jsp";
        }
    }
    @RequestMapping("/update")
    public @ResponseBody
    Map<String,Object> update(Admin admin, HttpServletRequest request){
        System.out.println(admin);
      //  Admin admin1 = (Admin) request.getSession().getAttribute("admin");
        Map<String,Object>result=new HashMap<String, Object>();
        try {
            adminService.motify(admin);
          
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return result;

    }
    @RequestMapping("/quit")
    public String quit(HttpServletRequest request){
        request.getSession().setAttribute("admin",null);
        return "redirect:/qq/login.jsp";
    }

    @RequestMapping("/queryById")
    public @ResponseBody void queryById(String id){
        System.out.println(id);
        adminService.findbyId(id);
    }
}
