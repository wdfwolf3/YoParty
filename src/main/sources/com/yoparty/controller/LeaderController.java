package com.yoparty.controller;

import com.yoparty.bean.ActivityExample;
import com.yoparty.bean.ActivityWithBLOBs;
import com.yoparty.bean.Leader;
import com.yoparty.bean.User;
import com.yoparty.mapper.ActivityMapper;
import com.yoparty.mapper.LeaderMapper;
import com.yoparty.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/12.
 */
@Controller
public class LeaderController {
    @Autowired
    private LeaderMapper leaderMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @RequestMapping(value = "leader/detail/{id}", method = RequestMethod.GET)
    public String getLeader(@PathVariable("id") int id, Model model) {
        Leader leader = leaderMapper.selectByPrimaryKey(id);
        model.addAttribute("leader", leader);
        User user = userMapper.selectByPrimaryKey(leader.getUserId());
        model.addAttribute("user", user);

        ActivityExample activityExample = new ActivityExample();
        activityExample.createCriteria().andLeaderNameEqualTo(user.getNickname());
        List<ActivityWithBLOBs> activityList = activityMapper.selectByExampleWithBLOBs(activityExample);
        List<ActivityWithBLOBs> activityListOngoing = new ArrayList<ActivityWithBLOBs>();
        List<ActivityWithBLOBs> activityListCompeleted = new ArrayList<ActivityWithBLOBs>();
        for (ActivityWithBLOBs activity : activityList) {
            if (activity.getStatus() == 1) {
                activityListOngoing.add(activity);
            } else if (activity.getStatus() == 2) {
                activityListCompeleted.add(activity);
            }
        }
        model.addAttribute("activityListOngoing", activityListOngoing);
        model.addAttribute("activityListCompeleted", activityListCompeleted);
        return "leader";
    }
}
