package com.yoparty.security;

import com.yoparty.dao.User;
import com.yoparty.dao.UserExample;
import com.yoparty.mapper.UserMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
public class UserService implements UserDetailsService {
    private static ApplicationContext cxt;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        cxt = new ClassPathXmlApplicationContext("application.xml");
	    UserMapper userMapper = (UserMapper) cxt.getBean("userMapper");
	    UserExample userExample = new UserExample();
	    UserExample.Criteria criteria = userExample.createCriteria();
	    criteria.andNameEqualTo(username);
        List<User> list = (List<User>) userMapper.selectByExample(userExample);
        List<GrantedAuthority> authsList = new ArrayList<GrantedAuthority>();
        authsList.add(new SimpleGrantedAuthority(""));
        if(list!=null&&list.size()!=0){
            User user = list.get(0);
            return new org.springframework.security.core.userdetails.User(user.getName(),user.getPassword(),authsList);
        }else{
            throw new UsernameNotFoundException("not found");
        }
    }
}
