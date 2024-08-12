package com.en.main.mapper;

import com.en.main.dto.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SurveyMapper {

    @Insert("insert into guest values (#{e_no}, #{m_id}, #{g_attend_wedding}, #{g_attend_afterparty}, #{g_guest_type}, " +
            "#{g_allergy_or}, #{g_relation}, #{g_relation_detail})")
    void insertGuest(GuestVO guestVO);

    @Insert("insert into allergy values (#{e_no}, #{m_id}, #{allergy})")
    void insertAllergy(AllergyVO allergyVO);

    @Insert ("insert into companions (p_accompany_num, e_no, m_id, p_accompany_type, p_fam_kanji, p_name_kanji, " +
            "p_fam_kana, p_name_kana, p_fam_eng, p_name_eng, p_gender, p_allergy_or, p_relation) " +
            "values (#{p_accompany_num}, #{e_no}, #{m_id}, #{p_accompany_type}, #{p_fam_kanji}, #{p_name_kanji}, " +
            "#{p_fam_kana}, #{p_name_kana}, #{p_fam_eng}, #{p_name_eng}, #{p_gender}, #{p_allergy_or}, #{p_relation}")
    void insertCompanions(CompanionVO companion);

    @Select("select * from member where m_id = #{m_id}")
    MemberVO selectMemberInfo( String m_id);

    @Select("select * from message where e_no = #{e_no}")
    MessageVO selectMessageInfo(int e_no);

    @Select("select * from party where p_pk = #{p_pk}")
    PartyVO selectPartyInfo(int p_pk);
}
