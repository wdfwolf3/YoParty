package com.yoparty.mapper;

import com.yoparty.bean.SignupUserPartner;
import com.yoparty.bean.SignupUserPartnerExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SignupUserPartnerMapper {
    int countByExample(SignupUserPartnerExample example);

    int deleteByExample(SignupUserPartnerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SignupUserPartner record);

    int insertSelective(SignupUserPartner record);

    List<SignupUserPartner> selectByExample(SignupUserPartnerExample example);

    SignupUserPartner selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SignupUserPartner record, @Param("example") SignupUserPartnerExample example);

    int updateByExample(@Param("record") SignupUserPartner record, @Param("example") SignupUserPartnerExample example);

    int updateByPrimaryKeySelective(SignupUserPartner record);

    int updateByPrimaryKey(SignupUserPartner record);
}