package com.yoparty.controller;

import com.alibaba.fastjson.JSON;
import com.yoparty.mapper.UserMapper;
import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by wdfwolf3 on 2017/3/8.
 */
@Controller
@RequestMapping("user_info")
public class UserInfoController {
    @Autowired
    private LoginStatusService loginStatusService;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = "/personalEdit/companys", method = RequestMethod.GET)
    public String getInfoPartners(Model model){
        if(loginStatusService.insertUserInformation(model)){
            model.addAttribute("infoType", "companys");
            return "user_info";
        }
        return "login";
    }

    @RequestMapping(value = "/personalEdit/basic", method = RequestMethod.GET)
    public String getInfoBasic(Model model){
        if(loginStatusService.insertUserInformation(model)){
            model.addAttribute("infoType", "basic");
            return "user_info";
        }
        return "login";
    }

    @RequestMapping(value = "/baseInfo", method = RequestMethod.GET)
    public String getBaseInfo(HttpServletResponse response, Model model){
        if(loginStatusService.insertUserInformation(model)){
            model.addAttribute("user", loginStatusService.getUser());
            response.setHeader("X-Frame-Options", "SAMEORIGIN");
            return "baseInfo";
        }
        return "home";
    }

    @RequestMapping(value = "addEntity", method = RequestMethod.POST)
    public @ResponseBody String addUserInfo(HttpServletRequest request, HttpServletResponse response){
        request.getParameter("userInfoFormMap.birthday");
        request.getParameter("userInfoFormMap.gender");
        request.getParameter("userInfoFormMap.hometown");
        request.getParameter("userInfoFormMap.hometown_code");
        request.getParameter("userInfoFormMap.id");
        request.getParameter("userInfoFormMap.interest");
        request.getParameter("userInfoFormMap.nickname");
        request.getParameter("userInfoFormMap.residence");
        request.getParameter("userInfoFormMap.residence_code");
        request.getParameter("userInfoFormMap.truename");
        request.getParameter("userInfoFormMap.work");
        return JSON.toJSONString("success");
//        return ResponseEntity.status(200).build();
    }

//    @RequestMapping(value = "/{name}/{type}", method = RequestMethod.GET)
//    public String getData(@PathVariable("name") String name, @PathVariable("type") String type, Model model) {
//        if ("basic".equals(type) || "security".equals(type)) {
//            User user = userMapper.selectByName(name);
//            model.addAttribute("user", user);
//            return "data";
//        } else if ("partner".equals(type)) {
////            List<Partner> partnerList = partnerMapper.selectByUserName(name);
////            model.addAttribute("partner", partnerList);
//            return "data";
//        }
//        //抛出404，访问页面不存在
//        throw new UserNotFoundException();
//    }
}

