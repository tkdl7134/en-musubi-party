package com.en.main.mapper;

import com.en.main.dto.PartyVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface PartyMapper {

    @Select("SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_gender, m.m_birth FROM member m JOIN en_party e ON m.m_id = e.M_ID")
    List<PartyVO> getPartyMembers();

    @Select("select e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji FROM member m JOIN en_party e ON m.m_id = e.M_ID where m.m_id='test1'")
    List<PartyVO> getPartyMyInfo();

    @Select("select m_id, ep_selectedType from en_party")
    List<PartyVO> getSelectedType();

    @Select("select m_id, ep_finalChoice from en_party")
    List<PartyVO> getFinalChoice();

    @Update("update en_party set ep_selectedType = #{ep_selectedType} where m_id='test1'")
    int updateSelectedType(PartyVO partyVO);

    @Update("update en_party set ep_finalChoice = #{ep_finalChoice} where m_id='test1'")
    int updateFinalChoice(PartyVO partyVO);

}
