package com.yoparty.controller;

import com.yoparty.bean.User;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Homepage
 * 如果登录传入用户名和用户id，否则返回普通首页
 *
 * Created by wdfwolf3 on 2017/3/6.
 */
@Controller
public class HomeController {
    @RequestMapping(value = {"/home","/"}, method = RequestMethod.GET)
    public String getMain(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth instanceof AnonymousAuthenticationToken){
            User user = (User) auth.getPrincipal();
            model.addAttribute("username", user.getPetname());
            model.addAttribute("loginUid", user.getId());
            return "homelogin";
        }else{
            return "home";
        }
    }
}
