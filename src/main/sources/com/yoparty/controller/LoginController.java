package com.yoparty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/1.
 */
@Controller
public class LoginController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginSecurity(){
        return "login";
    }

    @RequestMapping("/ftl")
    public String ftl(Model model){
        String ss = "wdf";
        model.addAttribute("user", ss);
        return "hello";
    }

    @RequestMapping("findpassword")
    public String findPasswordPage(){
        return "findpassword";
    }
}
