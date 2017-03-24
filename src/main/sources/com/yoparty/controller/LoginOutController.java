package com.yoparty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/**
 * Created by wdfwolf3 on 2017/3/23.
 */
@Controller
public class LoginOutController {
    @RequestMapping(value = "loginOut", method = RequestMethod.POST)
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Enumeration<String> em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        request.getSession().invalidate();
        PrintWriter out = response.getWriter();
        out.print("success");
        out.close();
    }
}
