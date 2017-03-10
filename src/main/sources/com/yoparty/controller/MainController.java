package com.yoparty.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
@Controller
public class MainController {
    @RequestMapping(value = {"/main","/"}, method = RequestMethod.GET)
    public String getMain(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        User user = (User) auth.getPrincipal();
        if(auth instanceof AnonymousAuthenticationToken){
            model.addAttribute("isRegister", true);
        }else{
            model.addAttribute("isRegister", false);
        }
        return "main";
    }

//    @RequestMapping(value = "/main", method = RequestMethod.POST)
//    public String main1(){
//        return "main";
//    }
}
