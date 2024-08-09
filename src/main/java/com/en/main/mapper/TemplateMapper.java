package com.en.main.mapper;

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

    @Select("SELECT g.e_no, g.m_id, " +
            "g.g_attend_wedding, g.g_attend_afterParty, g.g_guest_type, g.g_allergy_or, g.g_relation, g.g_relation_detail, " +
            "a.allergy as allergy, " +
            "p.p_accompany_num, p.p_accompany_type, p.p_fam_kangi, p.p_name_kangi, p.p_fam_kana, p.p_name_kana, " +
            "p.p_fam_eng, p.p_name_eng, p.p_gender, p.p_allergy_or, p.p_relation " +
            "FROM guest g " +
            "JOIN party p ON g.e_no = p.e_no AND g.m_id = p.m_id " +
            "LEFT JOIN allergy a ON g.m_id = a.m_id " +
            "WHERE g.e_no = 5")
    List<GuestVO> getGuest();
}
