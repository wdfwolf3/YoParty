package com.yoparty.controller;

import com.yoparty.bean.Area;
import com.yoparty.service.AreaListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wdfwolf3 on 2017/4/10.
 */
@Controller
@RequestMapping("common")
public class CommonController {
    private final String PREFIX = "D:\\Intellji\\YoParty\\src\\main\\webapp\\WEB-INF\\images\\";
    @Autowired
    private AreaListService areaListService;

    @RequestMapping(value = "/area_list", method = RequestMethod.POST)
    public @ResponseBody
    List<Area> getArea(HttpServletRequest request) {
        return areaListService.getActivityList(request);
    }

    @RequestMapping(value = "/photoupld", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> savePhoto(@RequestPart("avatar_file") Part file) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        String path = "123.jpg";
//        file.write(PREFIX + file.getSubmittedFileName());
        file.write(PREFIX + path);
        map.put("success", true);
        map.put("msg", "Upload Success!");
        map.put("result", "avator/" + path);
        map.put("ref_col", "photoUrl");
        return map;
    }
}
