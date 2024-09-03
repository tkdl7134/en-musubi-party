package com.en.main.mapper;

import com.en.main.dto.AllGuestVO;
import com.en.main.dto.PartyVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PartyMapper {

//    @Select("SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_gender, m.m_birth, g.g_guest_type FROM en_party e JOIN member m ON m.m_id = e.M_ID JOIN guest g ON m.m_id = g.m_id where e.e_no=#{e_no} order by m.m_id")
    @Select("SELECT g.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_gender, m.m_birth, g.g_guest_type\n" +
            "FROM guest g JOIN member m ON g.m_id = m.M_ID where g.g_attend_afterparty = 'ご出席' and g.e_no=#{e_no}  order by m.m_gender")
    List<PartyVO> getPartyMembers(int e_no);

    @Select("select e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji FROM member m JOIN en_party e ON m.m_id = e.M_ID where m.m_id=#{m_id}")
    List<PartyVO> getPartyMyInfo(@Param("m_id") String m_id);

    @Select("SELECT wi.w_fam_jp_groom, wi.w_name_jp_groom, wi.w_fam_jp_bride, wi.w_name_jp_bride, wi.w_wedding_time, \n" +
            "wi.w_wedding_address, wi.w_wedding_building, wi.w_date, g.e_no FROM guest g JOIN wedding_info wi ON g.e_no = wi.e_no\n" +
            "WHERE  g.m_id = #{m_id} order by g.e_no")
    List<PartyVO> getPartyList(@Param("m_id") String m_id);

    @Select("select m_id, ep_selectedType from en_party where e_no=#{e_no}")
    List<PartyVO> getSelectedType(int e_no);

    @Select("select m_id, ep_finalChoice from en_party where e_no=#{e_no}")
    List<PartyVO> getFinalChoice(int e_no);

    @Update("update en_party set ep_selectedType = #{ep_selectedType} where m_id=#{m_id}")
    int updateSelectedType(PartyVO partyVO);

    @Update("update en_party set ep_finalChoice = #{ep_finalChoice} where m_id=#{m_id}")
    int updateFinalChoice(PartyVO partyVO);

    @Update("update en_party set ep_lineID = #{ep_lineID} where m_id=#{m_id}")
    int updateLineID(PartyVO partyVO);

    @Select("SELECT ep_lineID FROM en_party WHERE m_id = #{partnerID} ")
    List<PartyVO> getPartnerLineID(@Param("partnerID") String partnerID);
}
