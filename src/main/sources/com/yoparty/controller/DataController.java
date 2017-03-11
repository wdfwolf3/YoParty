package com.yoparty.controller;

import com.yoparty.bean.User;
import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/8.
 */
@Controller
@RequestMapping("data")
public class DataController {
    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String getData(@PathVariable("name") String name, Model model){
        User user = userMapper.selectByName(name);
        model.addAttribute("user", user);
        return "data";
    }

    @RequestMapping(value = "/{name}" ,method = RequestMethod.POST)
    public String postData(@PathVariable("name") String name){

        return "redirect:/data/"+name;
    }
}
