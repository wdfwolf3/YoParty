package com.yoparty.mapper;

import com.yoparty.bean.Template;
import com.yoparty.bean.TemplateExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TemplateMapper {
    int countByExample(TemplateExample example);

    int deleteByExample(TemplateExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Template record);

    int insertSelective(Template record);

    List<Template> selectByExample(TemplateExample example);

    int updateByExampleSelective(@Param("record") Template record, @Param("example") TemplateExample example);

    int updateByExample(@Param("record") Template record, @Param("example") TemplateExample example);
}