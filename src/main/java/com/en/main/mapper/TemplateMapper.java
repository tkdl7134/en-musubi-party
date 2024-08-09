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

    @Select("SELECT " +
            "    g.m_id AS member_id,  " +
            "    e.e_no AS event_no,   " +
            "    p.p_accompany_num AS accompany_num, " +
            "    g.g_attend_wedding, " +
            "    g.g_attend_afterParty, " +
            "    g.g_guest_type, " +
            "    g.g_allergy_or," +
            "    g.g_relation, " +
            "    g.g_relation_detail," +
            "    a.allergy " +
            "FROM " +
            "    guest g " +
            "JOIN " +
            "    member m ON g.m_id = m.m_id " +
            "JOIN " +
            "    event e ON g.e_no = e.e_no " +
            "JOIN " +
            "    party p ON p.p_accompany_num = g.p_accompany_num " +
            "LEFT JOIN " +
            "    allergy a ON g.m_id = a.m_id " +
            "WHERE " +
            "    e.e_no = 5;")
    List<GuestVO> getGuest();

}
