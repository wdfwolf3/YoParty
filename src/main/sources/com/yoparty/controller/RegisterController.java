package com.yoparty.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class RegisterController {
    private static ApplicationContext cxt;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerError(@RequestParam(value = "error", required = false) Integer error) throws IOException {
        if (null != error) {
            System.out.println(error);
            return "register_" + error;
        } else
            return "home";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPost(HttpServletRequest request, HttpServletResponse resp) {
        String username = request.getParameter("username");
        //查询用户名是否存在
        boolean isExist = false;
        if (isExist)
            return "redirect:register?error=1001";
        else {
            //存数据库
            String s = request.getParameter("form_username");
            System.out.println(s);
            System.out.println(username);
        }
        return "redirect:index";
    }


//	@RequestMapping(value ="/register",method = RequestMethod.POST)
//	public String registerPost(HttpServletRequest req, HttpServletResponse resp) {
//		//利用Spring生成UserService对象,通过mybatis和mysql交互
//		cxt = new ClassPathXmlApplicationContext("application.xml");
//	    UserService userService = (UserService) cxt.getBean("userService");
//	    UserExample userExample = new UserExample();
//	    Criteria criteria = userExample.createCriteria();
//
//		String username = "wend";
//        String password = "123";
//        String telephone = "12345678901";
//
//        //查询用户名是否存在
//        criteria.andNameEqualTo(username);
//        List<User> lists = userService.selectByExample(userExample);
//        if(lists.size()!=0){
//        	System.out.println("用户名存在");
//        	return "register";
//        }
//
//        //查询手机号是否被注册
//        Criteria criteria2 = userExample.createCriteria();
//        criteria2.andPhoneEqualTo(telephone);
//        List<User> lists2 = userService.selectByExample(userExample);
//        if(lists2.size()!=0){
//        	System.out.println("手机号已注册");
//        	return "register";
//        }
//        else{
//        	//注册用户插入数据库
//            User user = new User();
//            user.setName(username);
//            user.setPassword(password);
//            user.setPhone(telephone);
//            userService.insert(user);
//    		return "首页";
//        }
//	}
}
