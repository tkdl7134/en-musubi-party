package com.en.main.mapper;

import com.en.main.dto.GuestVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SurveyMapper {

    @Insert("insert into guest values (#{e_no}, #{m_id}, #{g_attend_wedding}, #{g_attend_afterparty}, #{g_guest_type}, " +
            "#{g_allergy_or}, #{g_relation}, #{g_relation_detail})")
    void insertSurvey(GuestVO guestVO);

}
