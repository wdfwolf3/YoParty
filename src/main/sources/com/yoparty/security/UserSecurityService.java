package com.yoparty.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * customized validate function
 *
 * Created by wdfwolf3 on 2017/3/6.
 */
@Service
public class UserSecurityService implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;

//    @Autowired
//    private RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        User user = userMapper.selectByName(username);
        List<GrantedAuthority> authsList = new ArrayList<GrantedAuthority>();
        authsList.add(new SimpleGrantedAuthority("ROLE_"));
//        for(Role role : user.getRoles()){
//            authsList.add(new SimpleGrantedAuthority((role.getName())));
//        }
        if(user!=null){
            return new org.springframework.security.core.userdetails.User(user.getName(),user.getPassword(),authsList);
        }else{
            throw new UsernameNotFoundException("not found");
        }
    }
}
