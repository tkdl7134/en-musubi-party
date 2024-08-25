package com.en.main.mapper;

import com.en.main.dto.AllGuestVO;
import com.en.main.dto.PartyVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PartyMapper {

    @Select("SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_gender, m.m_birth, g.g_guest_type FROM member m JOIN en_party e ON m.m_id = e.M_ID JOIN guest g ON m.m_id = g.m_id where e.e_no=#{e_no} order by m.m_id")
    List<PartyVO> getPartyMembers(int e_no);

    @Select("select e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji FROM member m JOIN en_party e ON m.m_id = e.M_ID where m.m_id='test2'")
    List<PartyVO> getPartyMyInfo();

    @Select("SELECT\n" +
            "    wi.w_fam_jp_groom,\n" +
            "    wi.w_name_jp_groom,\n" +
            "    wi.w_fam_jp_bride,\n" +
            "    wi.w_name_jp_bride,\n" +
            "    wi.w_wedding_time,\n" +
            "    wi.w_wedding_address,\n" +
            "    wi.w_wedding_building,\n" +
            "    wi.w_date,\n" +
            "    g.e_no\n" +
            "FROM\n" +
            "    guest g\n" +
            "        JOIN\n" +
            "    wedding_info wi ON g.e_no = wi.e_no\n" +
            "WHERE\n" +
            "    g.m_id = 'test2'")
    List<PartyVO> getPartyList();

    @Select("select m_id, ep_selectedType from en_party where e_no=#{e_no}")
    List<PartyVO> getSelectedType(int e_no);

    @Select("select m_id, ep_finalChoice from en_party where e_no=#{e_no}")
    List<PartyVO> getFinalChoice(int e_no);

    @Update("update en_party set ep_selectedType = #{ep_selectedType} where m_id='test2'")
    int updateSelectedType(PartyVO partyVO);

    @Update("update en_party set ep_finalChoice = #{ep_finalChoice} where m_id='test2'")
    int updateFinalChoice(PartyVO partyVO);

    @Update("update en_party set ep_lineID = #{ep_lineID} where m_id='test2'")
    int updateLineID(PartyVO partyVO);

    @Select("SELECT ep_lineID FROM en_party WHERE m_id = #{m_id} ")
    List<PartyVO> getPartnerLineID(@Param("m_id") String partnerID);
}
