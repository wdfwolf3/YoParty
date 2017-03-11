package com.yoparty.mapper;

import com.yoparty.bean.Signup;
import com.yoparty.bean.SignupExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SignupMapper {
    int countByExample(SignupExample example);

    int deleteByExample(SignupExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Signup record);

    int insertSelective(Signup record);

    List<Signup> selectByExampleWithBLOBs(SignupExample example);

    List<Signup> selectByExample(SignupExample example);

    Signup selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Signup record, @Param("example") SignupExample example);

    int updateByExampleWithBLOBs(@Param("record") Signup record, @Param("example") SignupExample example);

    int updateByExample(@Param("record") Signup record, @Param("example") SignupExample example);

    int updateByPrimaryKeySelective(Signup record);

    int updateByPrimaryKeyWithBLOBs(Signup record);

    int updateByPrimaryKey(Signup record);
}