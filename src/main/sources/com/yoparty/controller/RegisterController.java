package com.yoparty.controller;

import com.yoparty.bean.User;
import com.yoparty.bean.UserExample;
import com.yoparty.mapper.UserMapper;
import com.yoparty.util.AjaxResponseData;
import com.yoparty.util.GenerateCheckCode;
import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("register")
//@SessionAttributes("checkCode")
public class RegisterController {
    @Autowired
    private LoginStatusService loginStatusService;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGet(Model model) {
        loginStatusService.insertUserInformation(model);
        return "register";
    }

    @RequestMapping(value = "/addEntity", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponseData registerPost(HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("userFormMap.userName");
        String accountName = request.getParameter("userFormMap.accountName");
        String password = request.getParameter("userFormMap.password");
        String rCode = request.getParameter("userFormMap.rCode");
        String phone_no = request.getParameter("userFormMap.phone_no");
//        String checkCode = (String) model.asMap().get("checkCode");
        String checkCode = (String) session.getAttribute("checkCode");
        if(!rCode.equals(checkCode)){
            return new AjaxResponseData("error", "验证码错误");
        }
        User user = userMapper.selectByName(accountName);
        if(user!=null){
            return new AjaxResponseData("error", "用户名已存在");
        }
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneEqualTo(phone_no);
        List<User> users = userMapper.selectByExample(userExample);
        if(users==null||users.size()==0){
            return new AjaxResponseData("error", "手机号码已注册");
        }
        user.setName(accountName);
        user.setPassword(password);
        user.setPetname(username);
        user.setPhone(phone_no);
        userMapper.insert(user);
//        System.out.println(username+accountName+password+rCode+phone_no+checkCode);
        return new AjaxResponseData("success", "");
    }

    @RequestMapping(value = "/checkCodeUI", method = RequestMethod.GET)
    public void getCheckCode(HttpServletResponse response, HttpSession session) throws IOException {
        GenerateCheckCode generateCheckCode = new GenerateCheckCode();
        BufferedImage image = generateCheckCode.generateImage();
        String checkCode = generateCheckCode.getCheckCode();
        session.setAttribute("checkCode", checkCode);
//        model.addAttribute("checkCode", checkCode);
        response.setContentType("image/png");
        ImageIO.write(image, "jpg", response.getOutputStream());
        response.getOutputStream().flush();
    }
}
