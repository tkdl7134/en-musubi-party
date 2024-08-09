package com.en.main.mapper;

import com.en.main.dto.PartyVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface PartyMapper {

    @Select("SELECT e.e_no, m.m_id, e.ep_type, m.m_name_kanji, m.m_gender, m.m_phone, m.m_birth FROM member m JOIN en_party e ON m.m_id = e.M_ID")
    List<PartyVO> getPartyMembers();

    @Select("select ep_selectedType from en_party where m_id='test1'")
    List<PartyVO> getSelectedType();

    @Select("select ep_finalChoice from en_party where m_id='test1'")
    List<PartyVO> getFinalChoice();

    @Update("update en_party set ep_selectedType = #{ep_selectedType} where m_id='test3'")
    int updateSelectedType(PartyVO partyVO);

    @Update("update en_party set ep_finalChoice = #{ep_finalChoice} where m_id='test3'")
    int updateFinalChoice(PartyVO partyVO);

}
