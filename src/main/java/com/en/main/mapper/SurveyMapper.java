package com.en.main.mapper;

import com.en.main.dto.GuestVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SurveyMapper {

    @Insert("insert into guest values (product2_test_seq.nextval, #{p_name}, #{p_price})")
    void insertProduct(GuestVO guestVO);

}
