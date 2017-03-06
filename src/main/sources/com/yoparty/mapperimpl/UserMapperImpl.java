package com.yoparty.mapperimpl;

import com.yoparty.dao.User;
import com.yoparty.dao.UserExample;
import com.yoparty.mapper.UserMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/6.
 */
@Component
public class UserMapperImpl implements UserMapper{

    public int countByExample(UserExample example) {
        return 0;
    }

    public int deleteByExample(UserExample example) {
        return 0;
    }

    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    public int insert(User record) {
        return 0;
    }

    public int insertSelective(User record) {
        return 0;
    }

    public List<User> selectByExample(UserExample example) {
        return null;
    }

    public User selectByPrimaryKey(Integer id) {
        return null;
    }

    public int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example) {
        return 0;
    }

    public int updateByExample(@Param("record") User record, @Param("example") UserExample example) {
        return 0;
    }

    public int updateByPrimaryKeySelective(User record) {
        return 0;
    }

    public int updateByPrimaryKey(User record) {
        return 0;
    }
}
