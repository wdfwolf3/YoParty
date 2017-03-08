package com.yoparty.controller;

import com.sun.xml.internal.fastinfoset.algorithm.LongEncodingAlgorithm;
import com.yoparty.dao.Leader;
import com.yoparty.dao.LeaderExample;
import com.yoparty.dao.User;
import com.yoparty.dao.UserExample;
import com.yoparty.mapper.LeaderMapper;
import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
@Controller
public class MainController {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private LeaderMapper leaderMapper;
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(){
//        UserExample userExample = new UserExample();
//        userExample.createCriteria().andNameEqualTo("wdf");
//        List<User> list = userMapper.selectByExample(userExample);
//        if(list!=null&&list.size()!=0){
//            System.out.println(list.get(0).getId());
//        }
        LeaderExample leaderExample = new LeaderExample();
        leaderExample.createCriteria().andNicknameEqualTo("WDF");
        List<Leader> leaders = leaderMapper.selectByExample(leaderExample);
        System.out.println(leaders.get(0).getUserId());
        int id = leaders.get(0).getUserId();
        User user = userMapper.selectByPrimaryKey(id);
        System.out.println(user.getName());
        return "main";
    }
}
