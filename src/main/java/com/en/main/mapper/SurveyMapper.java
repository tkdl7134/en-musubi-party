package com.en.main.mapper;

import com.en.main.dto.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface SurveyMapper {

    @Insert("insert into guest values (#{e_no}, #{m_id}, #{g_attend_wedding}, #{g_attend_afterParty}, #{g_guest_type}, " +
            "#{g_allergy_or}, #{g_relation}, #{g_relation_detail})")
    void insertGuest(GuestVO guestVO);

    @Insert("insert into allergy values (#{e_no}, #{m_id}, #{allergy})")
    void insertAllergy(AllergyVO allergyVO);

    @Insert ("insert into companion (p_pk, e_no, m_id, p_accompany_type, p_accompany_num, p_fam_kanji, p_name_kanji, " +
            "p_fam_kana, p_name_kana, p_fam_eng, p_name_eng, p_gender, p_allergy_or, p_relation) " +
            "values (companion_seq.nextval, #{e_no}, #{m_id}, #{p_accompany_type}, #{p_accompany_num}, #{p_fam_kanji}, #{p_name_kanji}, " +
            "#{p_fam_kana}, #{p_name_kana}, #{p_fam_eng}, #{p_name_eng}, #{p_gender}, #{p_allergy_or}, #{p_relation})")
    void insertCompanions(CompanionVO companion);

    @Insert("insert into message values (#{e_no}, #{m_id}, #{me_content}, #{me_img})")
    void insertMessage(MessageVO messageVO);

    @Update("update member set m_fam_kanji = #{m_fam_kanji}, m_name_kanji = #{m_name_kanji}, m_fam_kana = #{m_fam_kana}, m_name_kana = #{m_name_kana}, " +
            "m_fam_eng = #{m_fam_eng}, m_name_eng = #{m_name_eng}, m_email = #{m_email}, m_phone = #{m_phone}, m_address = #{m_address} " +
            "where m_id = #{m_id}")
    void updateMember(MemberVO memberVO);

    @Select("select * from member where m_id = #{m_id}")
    MemberVO selectMemberInfo(String m_id);

    @Select("select * from event where e_no = #{e_no}")
    EventVO selectEventInfo(int e_no);

    @Select("select * from companion where p_pk = #{p_pk}")
    PartyVO selectPartyInfo(int p_pk);
}
