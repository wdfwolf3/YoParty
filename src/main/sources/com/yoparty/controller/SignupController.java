package com.yoparty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/12.
 */
@Controller
public class SignupController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getSignup(){
        return "";
    }
}
