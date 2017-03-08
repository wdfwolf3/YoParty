package com.yoparty.controller;

import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
@Controller
public class MainController {
    private ApplicationContext cxt;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(){
        com.yoparty.dao.User user = userMapper.selectByPrimaryKey(1);
        System.out.println(user.getName());
        return "main";
    }
}
