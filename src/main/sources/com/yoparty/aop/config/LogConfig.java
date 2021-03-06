package com.yoparty.aop.config;

import com.yoparty.aop.log.OrderLog;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * Created by wdfwolf3 on 2017/3/14.
 */
@Configuration
@EnableAspectJAutoProxy
public class LogConfig {
    @Bean
    public OrderLog getOrderLog() {
        return new OrderLog();
    }
}
