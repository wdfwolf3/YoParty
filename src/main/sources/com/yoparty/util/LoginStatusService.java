package com.yoparty.util;

import com.yoparty.bean.User;
import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

/**
 * Created by wdfwolf3 on 2017/3/23.
 */
@Service
public class LoginStatusService {
    User user = new User();
    @Autowired
    private UserMapper userMapper;

    public boolean insertUserInformation(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof UsernamePasswordAuthenticationToken) {
            if (auth.getPrincipal() != null) {
                String username = ((org.springframework.security.core.userdetails.User) auth.getPrincipal()).getUsername();
                user = userMapper.selectByName(username);
                model.addAttribute("username", user.getNickname());
                model.addAttribute("loginUid", user.getId());
                model.addAttribute("isLogin", true);
                return true;
            }
        }
        model.addAttribute("isLogin", false);
        return false;
    }

    public User getUser() {
        return user;
    }
}
