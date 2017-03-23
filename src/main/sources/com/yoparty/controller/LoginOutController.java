package com.yoparty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * Created by wdfwolf3 on 2017/3/23.
 */
@Controller
public class LoginOutController {
    @RequestMapping(value = "loginOut", method = RequestMethod.POST)
    public @ResponseBody
    String logout(HttpServletRequest request){
        Enumeration<String> em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        request.getSession().invalidate();
        return "success";
    }
}
