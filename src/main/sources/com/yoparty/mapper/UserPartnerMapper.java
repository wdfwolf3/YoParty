package com.yoparty.mapper;

import com.yoparty.dao.UserPartner;
import com.yoparty.dao.UserPartnerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPartnerMapper {
    int countByExample(UserPartnerExample example);

    int deleteByExample(UserPartnerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserPartner record);

    int insertSelective(UserPartner record);

    List<UserPartner> selectByExample(UserPartnerExample example);

    UserPartner selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserPartner record, @Param("example") UserPartnerExample example);

    int updateByExample(@Param("record") UserPartner record, @Param("example") UserPartnerExample example);

    int updateByPrimaryKeySelective(UserPartner record);

    int updateByPrimaryKey(UserPartner record);
}