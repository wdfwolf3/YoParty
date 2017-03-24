package com.yoparty.controller;

import com.yoparty.service.ActivityListPageService;
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
 * Created by wdfwolf3 on 2017/3/12.
 */
@Controller
@RequestMapping("event")
public class ActitvityController {
    @Autowired
    private LoginStatusService loginStatusService;

    @Autowired
    private ActivityListPageService activityListPageService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String getListPage(Model model){
        loginStatusService.insertUserInformation(model);
        return "list";
    }

    @RequestMapping(value = "findEventList", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getActivityList(HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        map.put("records", activityListPageService.getActivityList(request));
        map.put("rowCount", activityListPageService.getTotal());
        return map;
    }
//    @RequestMapping(value = "findEventList", method = RequestMethod.POST)
//    public @ResponseBody
//    List<Activity> getActivityList(@RequestBody ActivityLists activityLists){
////        Object o = request.getParameter("para");
//        System.out.println(activityLists.getPageSize() +" "+ activityLists.getPageNow());
////        String sti = request.getParameter("pageSize");
////        System.out.println(sti!=null?sti:"dd");
//        List<Activity> activities = new ArrayList<>();
//        return activities;
//    }
}
