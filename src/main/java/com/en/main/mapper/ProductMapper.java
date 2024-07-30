package com.en.main.mapper;

import com.en.main.dto.TemplateProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Select("select * from template order by t_pk")
    List<TemplateProductVO> getAllTemplates();

}
