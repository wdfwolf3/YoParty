package com.yoparty.security;

import com.yoparty.dao.User;
import com.yoparty.service.UserService;
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
public class UserSecurityService implements UserDetailsService {
//    private static ApplicationContext cxt;
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{

//        cxt = new ClassPathXmlApplicationContext("classpath*:/WEB-INF/application.xml");
//        cxt = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/application");
//	    com.yoparty.serviceimpl.UserServiceImpl userService = (com.yoparty.serviceimpl.UserServiceImpl) cxt.getBean("userService");
//        UserMapper userMapper = cxt.getBean("userMapper",UserMapper.class);
//	    UserExample userExample = new UserExample();
//	    UserExample.Criteria criteria = userExample.createCriteria();
//	    criteria.andNameEqualTo("wdf");
//        List<User> list = (List<User>) userMapper.selectByExample(userExample);
        UserService userService = new UserService();
        User user = userService.selectUserByName(username);
        List<GrantedAuthority> authsList = new ArrayList<GrantedAuthority>();
        authsList.add(new SimpleGrantedAuthority("ROLE_"));
        if(user!=null){
            return new org.springframework.security.core.userdetails.User(user.getName(),user.getPassword(),authsList);
        }else{
            throw new UsernameNotFoundException("not found");
        }
    }
}
