package com.yoparty.controller;

import com.yoparty.service.PartnerListPageService;
import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wdfwolf3 on 2017/4/5.
 */
@Controller
@RequestMapping("user_partner")
public class UserPartnerController {
    @Autowired
    private LoginStatusService loginStatusService;

    @Autowired
    private PartnerListPageService partnerListPageService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getPartnerListPage(HttpServletResponse response, Model model) {
        if (loginStatusService.insertUserInformation(model)) {
            model.addAttribute("user", loginStatusService.getUser());
            response.setHeader("X-Frame-Options", "SAMEORIGIN");
            return "partner_list";
        }
        return "home";
    }

    @RequestMapping(value = "/findByPage", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getOrderList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        return map;
    }
}
