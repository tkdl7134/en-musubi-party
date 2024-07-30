package com.en.main.mapper;

import com.en.main.dto.PartyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PartyMapper {

    @Select("SELECT e.e_no, m.m_id, e.ep_type, m.m_name_kanji, m.m_gender, m.m_phone, m.m_birth FROM member m JOIN en_party e ON m.m_id = e.M_ID")
    List<PartyVO> getPartyMembers();



}
