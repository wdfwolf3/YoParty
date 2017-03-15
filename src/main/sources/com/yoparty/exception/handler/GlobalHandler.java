package com.yoparty.exception.handler;

import com.yoparty.exception.UserNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Created by wdfwolf3 on 2017/3/15.
 */
@ControllerAdvice
public class GlobalHandler {
    @ExceptionHandler(UserNotFoundException.class)
    public String handlers(){
        System.out.println(12);
        return "main";
    }
 }
