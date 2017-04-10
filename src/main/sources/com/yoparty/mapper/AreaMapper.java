package com.yoparty.mapper;

import com.yoparty.bean.Area;
import com.yoparty.service.AreaListService;

import java.util.List;

public interface AreaMapper {
    List<Area> select(AreaListService areaListService);

    List<Area> selectProvince();
}