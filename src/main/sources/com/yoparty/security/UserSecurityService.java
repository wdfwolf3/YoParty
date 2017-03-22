package com.yoparty.security;

import com.yoparty.bean.User;
import com.yoparty.bean.UserRole;
import com.yoparty.bean.UserRoleExample;
import com.yoparty.mapper.UserMapper;
import com.yoparty.mapper.UserRoleMapper;
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

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public UserDetails loadUserByUsername(String username){
        User user = userMapper.selectByName(username);
        if(user==null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        //search roles of the user by userId
        UserRoleExample userRoleExample = new UserRoleExample();
        userRoleExample.createCriteria().andUserIdEqualTo(user.getId());
        List<UserRole> userRoles = userRoleMapper.selectByExample(userRoleExample);
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        //add roles to list
        for(UserRole userRole : userRoles){
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + userRole.getRoleName()));
        }
        //将正确的用户信息返回供spring验证与输入是否一致
        return new org.springframework.security.core.userdetails.User(user.getName(),user.getPassword(),grantedAuthorities);
    }
}
