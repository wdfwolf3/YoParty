package com.yoparty.service;

import com.yoparty.bean.Area;
import com.yoparty.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/4/10.
 */
@Service
public class AreaListService {
    @Autowired
    private AreaMapper areaMapper;

    private String table_name;

    private String parent_id;

    public List<Area> getActivityList(HttpServletRequest request) {
        if(request.getParameter("sysDictFormMap.parentId")!=null){
            parent_id = request.getParameter("sysDictFormMap.parentId");
        }else{
            parent_id = "0";
        }
        switch (Integer.parseInt(request.getParameter("sysDictFormMap.dict_level"))){
            case 1:
                table_name = "province";
                break;
            case 2:
                table_name = "city";
                break;
            case 3:
                table_name = "area";
                break;
        }
        return areaMapper.select(this);
    }
}