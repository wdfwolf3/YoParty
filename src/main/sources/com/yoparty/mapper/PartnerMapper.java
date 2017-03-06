package com.yoparty.mapper;

import com.yoparty.dao.Partner;
import com.yoparty.dao.PartnerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PartnerMapper {
    int countByExample(PartnerExample example);

    int deleteByExample(PartnerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Partner record);

    int insertSelective(Partner record);

    List<Partner> selectByExample(PartnerExample example);

    Partner selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Partner record, @Param("example") PartnerExample example);

    int updateByExample(@Param("record") Partner record, @Param("example") PartnerExample example);

    int updateByPrimaryKeySelective(Partner record);

    int updateByPrimaryKey(Partner record);
}