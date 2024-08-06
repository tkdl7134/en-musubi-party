package com.en.main.mapper;

import com.en.main.dto.WeddingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TemplateMapper {

//        @Select("SELECT * " +
//                "FROM s_wedding_info sw " +
//                "LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no " +
//                "LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk " +
//                "WHERE se.m_id = #{mId} AND sw.e_no = #{eNo}")
//        List<WeddingVO> getWedding(@Param("mId") String mId, @Param("eNo") int eNo);

}
