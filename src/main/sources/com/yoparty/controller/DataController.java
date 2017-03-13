package com.yoparty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wdfwolf3 on 2017/3/8.
 */
@Controller
@RequestMapping("data")
public class DataController {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PartnerMapper partnerMapper;

    @RequestMapping(value = "/{name}/{type}", method = RequestMethod.GET)
    public String getData(@PathVariable("name") String name, @PathVariable("type") String type, Model model) {
        if ("basic".equals(type) || "security".equals(type)) {
            User user = userMapper.selectByName(name);
            model.addAttribute("user", user);
            return "data";
        } else if ("partner".equals(type)) {
//            List<Partner> partnerList = partnerMapper.selectByUserName(name);
//            model.addAttribute("partner", partnerList);
            return "data";
        }
        //抛出404，访问页面不存在
        return "";
    }

    @RequestMapping(value = "/{name}/{type}", method = RequestMethod.POST)
    public String postData(@PathVariable("name") String name, @PathVariable("type") String type,
                           HttpServletRequest httpServletRequest, Model model) {
        if ("basic".equals(type) || "security".equals(type)) {
            User user = userMapper.selectByName(name);
            //update user information

            model.addAttribute("user", user);
            return "data";
        } else if ("partner".equals(type)) {
//            List<Partner> partnerList = ;
//            for (Partner partner : partnerList){
            //update user information
            //            model.addAttribute("partner", partnerList);
            return "data";
        }
        //抛出404，访问页面不存在
        return"data";
    }
}

