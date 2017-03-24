package com.yoparty.controller;

import com.yoparty.mapper.ActivityMapper;
import com.yoparty.mapper.LeaderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wdfwolf3 on 2017/3/24.
 */
@Controller
public class ActivityDetailController {
    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private LeaderMapper leaderMapper;

    @RequestMapping(value = "event/eventDetail/{id}", method = RequestMethod.GET)
    public String getActivityDetail(@PathVariable int id, Model model){
//        Activity activity = activityMapper.selectByPrimaryKey(id);
//        model.addAttribute("activity", activity);
//        Leader mainLeader = leaderMapper.selectMainLeaderByActivityId();
//        List<Leader> assistLeaderList = leaderMapper.selectAssistLeaderByActivityId();
//        model.addAttribute("mainLeader", mainLeader);
//        model.addAttribute("assistLeaderList", assistLeaderList);
//        return "activity_detail";
        return "detail";
    }
}
