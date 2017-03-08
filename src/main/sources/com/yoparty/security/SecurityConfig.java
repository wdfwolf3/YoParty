package com.yoparty.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    private String SelectSql = "select name,password,enable from user where name=";

    /**
     * 1.对特定的请求拦截,其余请求全部允许，Match支持Ant通配符"/**",regexMatchers("")支持正则
     *   .authorizeRequests()
     *   .antMatchers("/login").hasAuthority("ROLE_USER")
     *   .antMatchers(HttpMethod.POST,"/register").authenticated()
     *   .antMatchers("/login").hasRole("USER")
     *   .anyRequest().permitAll()
     * 2.通过requiresSecure()和requiresInecure()指定必须用https或者http传送
     *   .requiresChannel().antMatchers("/main").requiresSecure()
     * 3.禁用csrf防护
     *   .csrf().disable()
     * 4.启用默认登录页，加上.formLogin().loginPage("/")指定自定义的登录页
     *   .formLogin()
     * 5.启用rememberme，设置时间和cookie中的私玥名字
     *   .rememberMe().tokenValiditySeconds(111).key("spKey")
     * 6.定义登出后跳转页面，可以自定义登出链接，默认为/logout
     *   .logout().logoutSuccessUrl("/").logoutUrl("/out")
     * @param httpSecurity
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        httpSecurity.formLogin()
                .and()
                .authorizeRequests()
                .antMatchers("/login").hasAuthority("ROLE_USER")
                .antMatchers("/register").authenticated()
                .anyRequest().permitAll()
                .and()
                .csrf().disable();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception{
//        auth.inMemoryAuthentication()
//                .withUser("wdf").password("123").roles("USER").and()
//                .withUser("amdin").password("123456").roles("USER","ADMIN");
//        auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery("")
//                .authoritiesByUsernameQuery("")
//                .passwordEncoder(new StandardPasswordEncoder(""));
        auth.userDetailsService(new UserSecurityService());
    }
}
