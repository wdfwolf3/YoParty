package com.yoparty.aop.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.annotation.*;
import org.springframework.ui.Model;


/**
 * Created by wdfwolf3 on 2017/3/14.
 */
@Aspect
public class OrderLog {
    final static Logger logger = LogManager.getLogger(OrderLog.class.getName());

    @Pointcut(value = "execution(* com.yoparty.controller.HomeController.getMain(..)) && args(model)", argNames = "model")
    public void getMain(Model model) {
    }

    @Before(value = "getMain(model)", argNames = "model")
    public void silenceCellphone(Model model) {
        System.out.println("Silence");
        logger.info("test");
    }

    @AfterReturning(value = "getMain(model)", argNames = "model")
    public void applause(Model model) {
        Object object = model.asMap().get("loginUid");
        if (object != null) {
            logger.info((Integer) object + "login!");
        } else
            logger.info("fangwen");
    }

    @AfterThrowing(value = "getMain(model)", throwing = "e", argNames = "model,e")
    public void throwing(Model model, Throwable e) {
//        e.printStackTrace();
        System.out.println(e.getMessage());
    }
//    @Around("performance()")
//    public void watchPerformance(ProceedingJoinPoint joinPoint){
//        System.out.println("Silence");
//        System.out.println("Taking seats");
//        try{
//            joinPoint.proceed();
//        }catch (Throwable e){
//            System.out.println("Demanding a refund");
//        }
//        System.out.println("papapa");
//
//
//    }
}
