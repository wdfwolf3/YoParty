package com.yoparty.controller;

import com.yoparty.bean.Activity;
import com.yoparty.bean.SignupUser;
import com.yoparty.bean.SignupUserExample;
import com.yoparty.bean.User;
import com.yoparty.mapper.ActivityMapper;
import com.yoparty.mapper.SignupUserMapper;
import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/1.
 */
@Controller
@RequestMapping("event_order")
public class OrderController {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SignupUserMapper signupMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String eventOrder(){
        return "order";
    }

    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String personalPage(@PathVariable("name") String name, Model model) {
        System.out.println(name);
        User user = userMapper.selectByName(name);
        model.addAttribute("user", user);
        SignupUserExample signupExample = new SignupUserExample();
        signupExample.createCriteria().andUserIdEqualTo(user.getId());
        List<SignupUser> signupList = signupMapper.selectByExample(signupExample);
        List<Activity> activityList = new ArrayList<Activity>();
        for (SignupUser signup : signupList){
            activityList.add(activityMapper.selectByPrimaryKey(signup.getActivityId()));
        }
        List<Object> list = new ArrayList<Object>();
        list.add(signupList);
        list.add(activityList);
        model.addAttribute("list", list);
        model.addAttribute("signupList", signupList);
        model.addAttribute("activityList", activityList);
        //用户头像图片

        //取不同状态的活动序列
//        signupExample.createCriteria().andUserIdEqualTo(user.getId()).andStatueEqualTo();


//        List<Signup> signupListStatue1 = new ArrayList<Signup>();
//        List<Signup> signupListStatue2 = new ArrayList<Signup>();
//        List<Signup> signupListStatue3 = new ArrayList<Signup>();
//        List<Signup> signupListStatue4 = new ArrayList<Signup>();
//        for(Signup signup : signupList){
//            if(signup.getStatue()==1){
//                signupListStatue1.add(signup);
//            }else if (signup.getStatue() == 2){
//                signupListStatue2.add(signup);
//            }else if (signup.getStatue() == 3){
//                signupListStatue3.add(signup);
//            }else{
//                signupListStatue4.add(signup);
//            }
//        }
//        model.addAttribute("signupListStatue1", signupListStatue1);
//        model.addAttribute("signupListStatue1", signupListStatue2);
//        model.addAttribute("signupListStatue1", signupListStatue3);
//        model.addAttribute("signupListStatue1", signupListStatue4);
        return "home";
    }
}
