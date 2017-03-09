package com.yoparty.security;

import com.yoparty.dao.User;
import com.yoparty.mapper.UserMapper;
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
 * Created by wdfwolf3 on 2017/3/6.
 */
@Service
public class UserSecurityService implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
//        cxt = new ClassPathXmlApplicationContext("classpath*:/WEB-INF/application.xml");
//        cxt = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/application");
        List<GrantedAuthority> authsList = new ArrayList<GrantedAuthority>();
        authsList.add(new SimpleGrantedAuthority("ROLE_"));
        User user = userMapper.selectByName(username);
        if(user!=null){
            return new org.springframework.security.core.userdetails.User(user.getName(),user.getPassword(),authsList);
        }else{
            throw new UsernameNotFoundException("not found");
        }
    }
}
