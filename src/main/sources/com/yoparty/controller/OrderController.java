package com.yoparty.controller;

import com.yoparty.service.OrderListPageService;
import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wdfwolf3 on 2017/3/1.
 */
@Controller
@RequestMapping("event_order")
public class OrderController {
    @Autowired
    private LoginStatusService loginStatusService;

    @Autowired
    private OrderListPageService orderListPageService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String eventOrderList(Model model) {
        if (loginStatusService.insertUserInformation(model)) {
            return "order";
        }
        return "home";
    }

    @RequestMapping(value = "/findByPage", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getOrderList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("records", orderListPageService.getActivityList(request, loginStatusService.getUser().getId()));
        map.put("pageNow", orderListPageService.getPageNow());
        map.put("rowCount", orderListPageService.getRowCount());
        return map;
    }
}
