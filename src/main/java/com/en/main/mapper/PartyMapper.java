package com.en.main.mapper;

import com.en.main.dto.PartyVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface PartyMapper {

    @Select("SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_gender, m.m_birth, g.g_guest_type FROM member m JOIN en_party e ON m.m_id = e.M_ID JOIN guest g ON m.m_id = g.m_id where e.e_no=5 order by m.m_id")
    List<PartyVO> getPartyMembers();

    @Select("select e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji FROM member m JOIN en_party e ON m.m_id = e.M_ID where m.m_id='test1'")
    List<PartyVO> getPartyMyInfo();

    @Select("select m_id, ep_selectedType from en_party where e_no=5")
    List<PartyVO> getSelectedType();

    @Select("select m_id, ep_finalChoice from en_party where e_no=5")
    List<PartyVO> getFinalChoice();

    @Update("update en_party set ep_selectedType = #{ep_selectedType} where m_id='test1'")
    int updateSelectedType(PartyVO partyVO);

    @Update("update en_party set ep_finalChoice = #{ep_finalChoice} where m_id='test1'")
    int updateFinalChoice(PartyVO partyVO);

    @Update("update en_party set ep_lineID = #{ep_lineID} where m_id='test1'")
    int updateLineID(PartyVO partyVO);

    @Select("SELECT ep_lineID FROM en_party WHERE m_id = 'test2' and e_no = 5")
    List<PartyVO>  getPartnerLineID();
}
