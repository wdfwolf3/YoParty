package com.yoparty.mapper;

import com.yoparty.bean.LeaderActivity;
import com.yoparty.bean.LeaderActivityExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeaderActivityMapper {
    int countByExample(LeaderActivityExample example);

    int deleteByExample(LeaderActivityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LeaderActivity record);

    int insertSelective(LeaderActivity record);

    List<LeaderActivity> selectByExample(LeaderActivityExample example);

    LeaderActivity selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LeaderActivity record, @Param("example") LeaderActivityExample example);

    int updateByExample(@Param("record") LeaderActivity record, @Param("example") LeaderActivityExample example);

    int updateByPrimaryKeySelective(LeaderActivity record);

    int updateByPrimaryKey(LeaderActivity record);
}