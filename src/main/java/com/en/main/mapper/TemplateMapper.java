package com.en.main.mapper;

import com.en.main.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TemplateMapper {

    @Select("SELECT * FROM wedding_info " +
            "JOIN event ON event.e_no = wedding_info.e_no " +
            "JOIN member ON event.m_id = member.m_id " +
            "WHERE member.m_id = #{m_id}")
    List<WeddingVO> getAllWedding(String m_id);

    @Select("SELECT wi.*, t.*, e.* " +
            "FROM wedding_Info wi " +
            "JOIN event e ON wi.e_no = e.e_no " +
            "JOIN template t ON wi.t_pk = t.t_pk " +
            "WHERE e.e_no = #{e_no}")
    List<WeddingVO> getWedding(int e_no);

    @Select("SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_email, m.m_phone, " +
            "g.g_attend_wedding, g.g_guest_type " +
            "FROM guest g " +
            "LEFT JOIN member m ON g.m_id = m.m_id " +
            "LEFT JOIN event e ON g.e_no = e.e_no " +
            "WHERE g.e_no = #{e_no}")
    List<AttendVO> getAttend(int e_no);

//    @Select("SELECT e.e_no, m.m_id, " +
//            "m.m_fam_kanji, m.m_name_kanji, g.g_allergy_or, g.g_relation, a.allergy, " +
//            "c.p_accompany_num, c.p_accompany_type, c.p_fam_kanji, c.p_name_kanji " + // 마지막 필드 뒤에 쉼표 제거
//            "FROM guest g " +
//            "LEFT JOIN member m ON g.m_id = m.m_id " +
//            "LEFT JOIN event e ON g.e_no = e.e_no " +
//            "LEFT JOIN companion c ON g.m_id = c.m_id " +
//            "LEFT JOIN allergy a ON g.m_id = a.m_id " +
//            "WHERE g.e_no = 5")
//    List<GuestDetailVO> getGuestDetail();

    @Select("SELECT e.e_no, m.m_id, " +
            "m.m_fam_kanji, m.m_name_kanji, m.m_email, m.m_phone, g.g_allergy_or, g.g_relation, a.allergy, " +
            "w.w_img1, w.w_img2, w.w_img3, w.w_img_share, w.w_date, w.w_wedding_address, " +
            "g.g_attend_wedding, g.g_guest_type, c.p_accompany_num, c.p_accompany_type, c.p_fam_kanji, c.p_name_kanji " +
            "FROM guest g " +
            "LEFT JOIN member m ON g.m_id = m.m_id " +
            "LEFT JOIN wedding_info w ON g.e_no = w.e_no " +
            "LEFT JOIN event e ON g.e_no = e.e_no " +
            "LEFT JOIN companion c ON g.m_id = c.m_id " +
            "LEFT JOIN allergy a ON g.m_id = a.m_id " +
            "WHERE g.e_no = #{e_no}")
    List<GuestDetailVO> getGuestDetail(int e_no);

    @Select("SELECT e.e_no, m.m_id, " +
            "m.m_fam_kanji, m.m_name_kanji, m.m_email, m.m_phone, g.g_allergy_or, g.g_relation, a.allergy, " +
            "w.w_img1, w.w_img2, w.w_img3, w.w_img_share, w.w_date, w.w_wedding_address, " +
            "g.g_attend_wedding, g.g_guest_type, c.p_accompany_num, c.p_accompany_type, c.p_fam_kanji, c.p_name_kanji " +
            "FROM guest g " +
            "LEFT JOIN member m ON g.m_id = m.m_id " +
            "LEFT JOIN wedding_info w ON g.e_no = w.e_no " +
            "LEFT JOIN event e ON g.e_no = e.e_no " +
            "LEFT JOIN companion c ON g.m_id = c.m_id " +
            "LEFT JOIN allergy a ON g.m_id = a.m_id " +
            "WHERE g.m_id = #{m_id}")
    List<AllGuestVO> getAllGuest(String m_id);

    @Select("SELECT g.g_attend_afterparty\n" +
            "FROM guest g\n" +
            "         JOIN member m ON g.m_id = m.m_id\n" +
            "         JOIN event e ON g.e_no = e.e_no\n" +
            "WHERE g.m_id = #{m_id} AND e.e_no = #{eno}")
    String getAttendAfterParty(String m_id, int eno);

    @Select("SELECT DISTINCT m.m_fam_kanji, m.m_name_kanji " +
            "FROM wedding_info wi " +
            "JOIN event e ON wi.e_no = e.e_no " +
            "JOIN member m ON e.m_id = m.m_id " +
            "WHERE wi.e_no = #{e_no}")
    List<MemberVO> getEventOwnerNames(int e_no);








}
