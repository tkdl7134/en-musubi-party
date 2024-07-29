package com.en.main.mapper;

import com.en.main.mapper.dto.TestVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TestMapper {

    @Select("select * from test")
    List<TestVO> getTests();
}
