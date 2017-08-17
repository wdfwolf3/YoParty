package com.yoparty.controller;

import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/1.
 */
@Controller
public class LoginController {
    @Autowired
    private LoginStatusService loginStatusService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginSecurity(Model model) {
        if (loginStatusService.insertUserInformation(model)) {
            return "home";
        }
        return "login";
    }

    @RequestMapping("findpassword")
    public String findPasswordPage() {
        return "findpassword";
    }
}
