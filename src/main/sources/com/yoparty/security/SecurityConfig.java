package com.yoparty.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.http.HttpMethod;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
@Configuration
@EnableWebSecurity
@ImportResource("/WEB-INF/application.xml")
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    private DriverManagerDataSource dataSource;

    private String SelectSql = "select name,password,enable from user where name=";

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
//        httpSecurity.authorizeRequests().anyRequest().authenticated().and()
//                .formLogin().and().httpBasic();
        httpSecurity.formLogin().loginPage("/").and()
                .authorizeRequests()
                .antMatchers("/login").hasAuthority("ROLE_USER")
                .antMatchers(HttpMethod.POST,"/register").authenticated()
                .anyRequest().permitAll()
                .and()
                .requiresChannel().antMatchers("/main").requiresSecure()
                .and()
                .rememberMe().tokenValiditySeconds(111).key("spKey")
                .and()
                .logout().logoutSuccessUrl("/").logoutUrl("/out")
                .and()
                .csrf().disable();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception{
        auth.inMemoryAuthentication()
                .withUser("wdf").password("123").roles("USER").and()
                .withUser("amdin").password("123456").roles("USER","ADMIN");
        auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery("")
                .authoritiesByUsernameQuery("")
                .passwordEncoder(new StandardPasswordEncoder(""));
    }
}
