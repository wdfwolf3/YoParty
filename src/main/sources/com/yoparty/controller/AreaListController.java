package com.yoparty.controller;

import com.yoparty.bean.Area;
import com.yoparty.service.AreaListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/4/10.
 */
@Controller
@RequestMapping("/common/area_list")
public class AreaListController {
    @Autowired
    private AreaListService areaListService;

    @RequestMapping()
    public @ResponseBody
    List<Area> getProvince(HttpServletRequest request){
        return areaListService.getActivityList(request);
    }
}
