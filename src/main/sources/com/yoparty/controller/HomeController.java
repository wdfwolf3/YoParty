package com.yoparty.controller;

import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Homepage
 * 如果登录传入用户名和用户id，否则返回普通首页
 * <p>
 * Created by wdfwolf3 on 2017/3/6.
 */
@Controller
public class HomeController {
    @Autowired
    private LoginStatusService loginStatusService;

    @RequestMapping(value = {"/home", "/"}, method = RequestMethod.GET)
    public String getMain(Model model) {
        loginStatusService.insertUserInformation(model);
        return "home";
    }
}
