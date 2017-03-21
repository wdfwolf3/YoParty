package com.yoparty.controller;

import com.yoparty.util.AjaxResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("register")
public class RegisterController {
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGet() {
        return "register";
    }

    @RequestMapping(value = "/addEntity", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponseData registerPost(HttpServletRequest request, HttpServletResponse resp) {
        String username = request.getParameter("userFormMap.userName");
        String accountName = request.getParameter("userFormMap.accountName");
        String password = request.getParameter("userFormMap.password");
        String rCode = request.getParameter("userFormMap.rCode");
        String phone_no = request.getParameter("userFormMap.phone_no");

        System.out.println(username+accountName+password+rCode+phone_no);
        AjaxResponseData data = new AjaxResponseData();
        data.setMsg("success");
        data.setStatus("success");
        //查询用户名是否存在
        return data;
    }

    @RequestMapping(value = "/checkCodeUI", method = RequestMethod.GET)
    public void getCheckCode(HttpServletResponse response) throws IOException {
        response.setContentType("image/png");
//        session.setAttribute("strCode", strCode);
        BufferedImage image = null;
        ImageIO.write(image, "jpg", response.getOutputStream());
        response.getOutputStream().flush();
    }

//	@RequestMapping(value ="/register",method = RequestMethod.POST)
//	public String registerPost(HttpServletRequest req, HttpServletResponse resp) {
//		//利用Spring生成UserService对象,通过mybatis和mysql交互
//		cxt = new ClassPathXmlApplicationContext("application.xml");
//	    UserServiceImpl userService = (UserServiceImpl) cxt.getBean("userService");
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
