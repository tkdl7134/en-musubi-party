package com.en.main.mapper;

import com.en.main.dto.MemberVO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MemberMapper {

    @Select("SELECT * FROM member WHERE m_fam_eng = #{m_fam_eng} AND m_email = #{m_email}")
    MemberVO findID(@Param("m_fam_eng") String m_fam_eng, @Param("m_email") String m_email);

    @Select("SELECT * FROM member WHERE m_id = #{m_id} AND m_email = #{m_email}")
    MemberVO findPWByEmail(@Param("m_id") String m_id, @Param("m_email") String m_email);

    @Insert("INSERT INTO reset_pw_token (m_id, token) VALUES (#{m_id}, #{token})")
    void saveResetPWToken(@Param("m_id") String m_id, @Param("token") String token);

    @Select("SELECT m_id FROM reset_pw_token WHERE token = #{token}")
    String findIDByToken(@Param("token") String token);

    @Update("UPDATE member SET m_pw = #{newPW} WHERE m_id = #{m_id}")
    void updatePW(@Param("m_id") String m_id, @Param("newPW") String newPW);

    // ID重複検査
    @Select("SELECT * FROM member WHERE m_id = #{ID}")
    MemberVO checkIDByID(String ID);

    // 会員登録
    @Insert("INSERT INTO member VALUES (#{m_id}, #{m_pw}, #{m_fam_kanji}, #{m_name_kanji}, #{m_fam_kana}, #{m_name_kana}, #{m_fam_eng}, #{m_name_eng}, #{m_birth}, #{m_gender}, #{m_email}, #{m_phone}, #{m_address}, #{m_zipcode} , 'profile.png')")
    void insertMember(MemberVO memberVO);

    @Select("SELECT * FROM member WHERE m_id = #{m_id}")
    MemberVO findMemberById(@Param("m_id") String m_id);

    @Update("UPDATE member SET m_img = #{m_img}, m_pw = #{m_pw}, m_fam_kanji = #{m_fam_kanji}, m_name_kanji = #{m_name_kanji}, m_fam_kana = #{m_fam_kana}, m_name_kana = #{m_name_kana}, " +
            "m_fam_eng = #{m_fam_eng}, m_name_eng = #{m_name_eng}, m_phone = #{m_phone}, m_address = #{m_address}, m_zipcode = #{m_zipcode} WHERE m_id = #{m_id}")
    void updateMember(MemberVO memberVO);

    @Delete("DELETE member where m_id = #{m_id}")
    void deleteMember(String m_id);
}
