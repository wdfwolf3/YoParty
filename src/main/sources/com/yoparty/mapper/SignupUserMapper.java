package com.yoparty.mapper;

import com.yoparty.bean.SignupUser;
import com.yoparty.bean.SignupUserExample;
import com.yoparty.service.OrderAjax;
import com.yoparty.service.OrderListPageService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SignupUserMapper {
    int countByExample(SignupUserExample example);

    int deleteByExample(SignupUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SignupUser record);

    int insertSelective(SignupUser record);

    List<SignupUser> selectByExampleWithBLOBs(SignupUserExample example);

    List<SignupUser> selectByExample(SignupUserExample example);

    SignupUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SignupUser record, @Param("example") SignupUserExample example);

    int updateByExampleWithBLOBs(@Param("record") SignupUser record, @Param("example") SignupUserExample example);

    int updateByExample(@Param("record") SignupUser record, @Param("example") SignupUserExample example);

    int updateByPrimaryKeySelective(SignupUser record);

    int updateByPrimaryKeyWithBLOBs(SignupUser record);

    int updateByPrimaryKey(SignupUser record);

    //
    List<OrderAjax> select(OrderListPageService orderListPageService);
}