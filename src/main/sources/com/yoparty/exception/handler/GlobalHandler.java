package com.yoparty.exception.handler;

import com.yoparty.exception.Erro;
import com.yoparty.exception.UserNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * Created by wdfwolf3 on 2017/3/15.
 */
@RestControllerAdvice
public class GlobalHandler {
//    @ExceptionHandler(UserNotFoundException.class)
//    public String handlers(){
//        System.out.println(12);
//        return "main";
//    }

    @ExceptionHandler(UserNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public Erro han() {
        System.out.println("dsf");
        return new Erro(4, "adf");
    }
}
