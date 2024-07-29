package com.en.main.mapper;

import com.en.main.mapper.dto.GuestVO;
import com.en.main.mapper.dto.TestVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SurveyMapper {

    @Insert("insert into guest values (product2_test_seq.nextval, #{p_name}, #{p_price})")
    void insertProduct(GuestVO guestVO);

}
