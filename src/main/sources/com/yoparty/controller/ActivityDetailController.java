package com.yoparty.controller;

import com.yoparty.bean.ActivityWithBLOBs;
import com.yoparty.bean.Leader;
import com.yoparty.mapper.ActivityMapper;
import com.yoparty.mapper.LeaderMapper;
import com.yoparty.util.LoginStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/24.
 */
@Controller
@RequestMapping("event")
public class ActivityDetailController {
    @Autowired
    private LoginStatusService loginStatusService;

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private LeaderMapper leaderMapper;

    @RequestMapping(value = "/eventDetail/{id}", method = RequestMethod.GET)
    public String getActivityDetail(@PathVariable int id, Model model) {
        loginStatusService.insertUserInformation(model);
        ActivityWithBLOBs activity = activityMapper.selectByPrimaryKey(id);
        String startTime = activity.getStartTime();
        String endTime = activity.getEndTime();
        activity.setStartTime(startTime.replaceFirst("-", "年").replaceFirst("-", "月") + "日");
        activity.setEndTime(endTime.replaceFirst("-", "年").replaceFirst("-", "月") + "日");
        model.addAttribute("activity", activity);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(startTime);
            long countTime = (date.getTime() - (new Date()).getTime()) / 1000;
            model.addAttribute("countTime", countTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<Leader> leaderList = leaderMapper.selectLeaderByActivityId(id);
        Leader mainLeader = leaderList.get(0);
        leaderList.remove(0);
        model.addAttribute("mainLeader", mainLeader);
        model.addAttribute("assistLeaderList", leaderList);
        return "detail";
    }

    @RequestMapping(value = "/eventJoin/{id}", method = RequestMethod.GET)
    public String signUp(@PathVariable int id, Model model) {
        if (loginStatusService.insertUserInformation(model)) {
            return "signup";
        }
        return "home";
    }
}
