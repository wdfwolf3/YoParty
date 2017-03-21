package com.yoparty.controller;

import com.yoparty.bean.Activity;
import com.yoparty.mapper.ActivityMapper;
import com.yoparty.mapper.LeaderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/12.
 */
@Controller
@RequestMapping("event")
public class ActitvityController {
    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private LeaderMapper leaderMapper;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String getListPage(){
        return "list";
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

    @RequestMapping(value = "findEventList", method = RequestMethod.POST)
    public @ResponseBody
    List<Activity> getActivityList(HttpServletRequest request){
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int pageNow = Integer.parseInt(request.getParameter("pageNow"));
        String sort = request.getParameter("sort");
        String column = request.getParameter("column");
        String keyword = request.getParameter("eventInfoFormMap.keyword");
        int searchType = Integer.parseInt(request.getParameter("eventInfoFormMap.searchType"));
        int type0 = Integer.parseInt(request.getParameter("eventInfoFormMap.type0"));
        int type1 = Integer.parseInt(request.getParameter("eventInfoFormMap.type1"));
        int type2 = Integer.parseInt(request.getParameter("eventInfoFormMap.type2"));
        List<Activity> activities = new ArrayList<>();
        return activities;
    }

    @RequestMapping(value = "eventDetail/{id}", method = RequestMethod.GET)
    public String getActivityDetail(@PathVariable int id){
        return "detail";
    }
//    @RequestMapping(value = "/activity/{name}", method = RequestMethod.GET)
//    public String getActivity(Model model){
//        int id = 1;
//        Activity activity = activityMapper.selectByPrimaryKey(id);
//        model.addAttribute("activity", activity);
//        Leader mainLeader = leaderMapper.selectMainLeaderByActivityId();
//        List<Leader> assistLeaderList = leaderMapper.selectAssistLeaderByActivityId();
//        model.addAttribute("mainLeader", mainLeader);
//        model.addAttribute("assistLeaderList", assistLeaderList);
//        return "activity_detail";
//    }
}
