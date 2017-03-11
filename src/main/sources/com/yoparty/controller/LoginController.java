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
    @RequestMapping(value = "/yoparty/login", method = RequestMethod.GET)
    public String loginSecurity(){
        return "login";
    }

    @RequestMapping("/ftl")
    public String ftl(Model model){
        String ss = "wdf";
        model.addAttribute("user", ss);
        return "hello";
    }

//    @RequestMapping(value = "/login", method = RequestMethod.GET)
//    public String loginGet(@RequestParam(value = "error", required = false) Integer error) {
//        if (null != error) {
//            System.out.println(error);
//            return "login_" + error;
//        } else
//            return "login";
//    }

//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String loginPost(HttpServletRequest request) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("form_username");
//        //查询用户名是否存在
//        boolean isExist = true;
//        if (!isExist)
//            return "redirect:login?error=1001";
//        else {
//            //存数据库
//            System.out.println(password);
//            System.out.println(username);
//        }
//        return "redirect:index";
//    }
}
