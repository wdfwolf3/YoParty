package com.yoparty.controller;

import com.yoparty.mapper.ActivityMapper;
import com.yoparty.mapper.LeaderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/12.
 */
@Controller
public class ActitvityController {
    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private LeaderMapper leaderMapper;

    @RequestMapping(value = "/activity", method = RequestMethod.GET)
    public String getActivityList(){

        return "activity";
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
