package com.yoparty.mapper;

import com.yoparty.bean.Activity;
import com.yoparty.bean.ActivityExample;
import com.yoparty.bean.ActivityWithBLOBs;
import com.yoparty.service.ActivityAjax;
import com.yoparty.service.ActivityListPageService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActivityMapper {
    int countByExample(ActivityExample example);

    int deleteByExample(ActivityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ActivityWithBLOBs record);

    int insertSelective(ActivityWithBLOBs record);

    List<ActivityWithBLOBs> selectByExampleWithBLOBs(ActivityExample example);

    List<Activity> selectByExample(ActivityExample example);

    ActivityWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ActivityWithBLOBs record, @Param("example") ActivityExample example);

    int updateByExampleWithBLOBs(@Param("record") ActivityWithBLOBs record, @Param("example") ActivityExample example);

    int updateByExample(@Param("record") Activity record, @Param("example") ActivityExample example);

    int updateByPrimaryKeySelective(ActivityWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ActivityWithBLOBs record);

    int updateByPrimaryKey(Activity record);

    //
    List<ActivityAjax> select(ActivityListPageService activityListPageService);
}