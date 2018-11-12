package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public @ResponseBody String login(User user){
        User user1 = userService.find(user);
        if(user1==null){
            return "错误";
        }else  return "对了";
    }
    @RequestMapping("/update")
    public @ResponseBody void update(User user){
        userService.motify(user);
    }

    @RequestMapping("/regist")
    public @ResponseBody String regist(User user){
        try {
            userService.add(user);
            return "啊啊啊";
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "sss"; }
}
