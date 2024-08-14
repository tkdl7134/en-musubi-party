package com.en.main.mapper;

import com.en.main.dto.AttendVO;
import com.en.main.dto.GuestDetailVO;
import com.en.main.dto.GuestVO;
import com.en.main.dto.WeddingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TemplateMapper {

    @Select("SELECT wi.*, t.*, e.* " +
            "FROM wedding_Info wi " +
            "JOIN event e ON wi.e_no = e.e_no " +
            "JOIN template t ON wi.t_pk = t.t_pk " +
            "WHERE e.e_no = 5")
    List<WeddingVO> getWedding();

    @Select("SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_email, m.m_phone, " +
            "g.g_attend_wedding, g.g_guest_type " +
            "FROM guest g " +
            "LEFT JOIN member m ON g.m_id = m.m_id " +
            "LEFT JOIN event e ON g.e_no = e.e_no " +
            "WHERE g.e_no = 5")
    List<AttendVO> getAttend();

    @Select("SELECT e.e_no, m.m_id, " +
            "m.m_fam_kanji, m.m_name_kanji, g.g_allergy_or, g.g_relation, a.allergy, " +
            "c.p_accompany_num, c.p_accompany_type, c.p_fam_kanji, c.p_name_kanji " + // 마지막 필드 뒤에 쉼표 제거
            "FROM guest g " +
            "LEFT JOIN member m ON g.m_id = m.m_id " +
            "LEFT JOIN event e ON g.e_no = e.e_no " +
            "LEFT JOIN companion c ON g.m_id = c.m_id " +
            "LEFT JOIN allergy a ON g.m_id = a.m_id " +
            "WHERE g.e_no = 5")
    List<GuestDetailVO> getGuestDetail();


}
