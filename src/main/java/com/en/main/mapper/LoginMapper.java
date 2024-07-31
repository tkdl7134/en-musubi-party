package com.en.main.mapper;

import com.en.main.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

// MyBatis를 사용하여 데이터베이스 쿼리를 수행하는 역할 = 데이터 액세스 계층(db와 직접 상호작용하는 책임)

@Mapper
public interface LoginMapper {
    // ユーザー認証のためのクエリ
    // 코드 간결 및 쉬운 유지보수를 위해 '@Select' 어노테이션 사용. 해당 어노테이션 사용하면 mapper.xml 파일 만들 필요 없음.
    @Select("select * from member where m_id = #{m_id} and m_pw = #{m_pw}")
    MemberVO getLoginInfo(@Param("m_id") String m_id, @Param("m_pw") String m_pw);
}
