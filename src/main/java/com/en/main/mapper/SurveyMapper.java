package com.en.main.mapper;

import com.en.main.dto.GuestVO;
import com.en.main.dto.MemberVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SurveyMapper {

    @Insert("insert into guest values (#{e_no}, #{m_id}, #{g_attend_wedding}, #{g_attend_afterparty}, #{g_guest_type}, " +
            "#{g_allergy_or}, #{g_relation}, #{g_relation_detail})")
    void insertSurvey(GuestVO guestVO);

    @Select("select * from member where m_id = #{m_id}")
    MemberVO selectMemberInfo( String m_id);
}
