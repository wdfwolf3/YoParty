package com.yoparty.service;

import com.yoparty.bean.User;
import com.yoparty.bean.UserExample;
import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/8.
 */
@Component
public class UserService {
    public UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper){
        this.userMapper = userMapper;
    }

    public UserMapper getUserMapper(){
        return userMapper;
    }

    public User selectUserByName(String name){
        UserExample userExample = new UserExample();
        userExample.createCriteria().andNameEqualTo(name);
        List<User> users = userMapper.selectByExample(userExample);
        User user = new User();
        if(user!=null&& users.size()!=0)
            user = users.get(0);
        return user;
    }

    public static void main(String[] args) {
        UserService userService = new UserService();
        String name = userService.selectUserByName("wdf").getName();
        System.out.println(name);
    }
}
