package com.yoparty.mapper;

import com.yoparty.bean.Fullcut;
import com.yoparty.bean.FullcutExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FullcutMapper {
    int countByExample(FullcutExample example);

    int deleteByExample(FullcutExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Fullcut record);

    int insertSelective(Fullcut record);

    List<Fullcut> selectByExample(FullcutExample example);

    Fullcut selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Fullcut record, @Param("example") FullcutExample example);

    int updateByExample(@Param("record") Fullcut record, @Param("example") FullcutExample example);

    int updateByPrimaryKeySelective(Fullcut record);

    int updateByPrimaryKey(Fullcut record);
}