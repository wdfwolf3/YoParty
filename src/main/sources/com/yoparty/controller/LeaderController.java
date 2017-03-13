package com.yoparty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wdfwolf3 on 2017/3/12.
 */
@Controller
@RequestMapping("leader")
public class LeaderController {
    @Autowired
    private LeaderMapper leaderMapper;

    @Autowired
    private ActivityMapper activityMapper;

//    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
//    public String getLeader(@PathVariable("name") String name, Model model){
//        Leader leader = leaderMapper.selectByNickname(name);
//        model.addAttribute("leader", leader);
//
//        List<Activity> activityList = activityMapper.selectByLeaderNickname(name);
//        List<Activity> activityListOngoing = new ArrayList<Activity>();
//        List<Activity> activityListCompeleted =  new ArrayList<Activity>();
//        for(Activity activity : activityList){
//            if (activity.getStatus() == 1){
//                activityListOngoing.add(activity);
//            }else if (activity.getStatus() == 2){
//                activityListCompeleted.add(activity);
//            }
//        }
//        model.addAttribute("activityListOngoing", activityListOngoing);
//        model.addAttribute("activityListCompeleted", activityListCompeleted);
//        return "leader";
//    }
}
