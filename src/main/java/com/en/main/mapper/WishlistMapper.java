package com.en.main.mapper;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface WishlistMapper {

    @Select("WITH wish_fund AS (SELECT wl_no, " +
            "                          wl_price," +
            "                          wl_product," +
            "                          e_no," +
            "                          (SELECT SUM(p_price) FROM pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) AS payed," +
            "                          FLOOR((SELECT SUM(p_price) FROM pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) / " +
            "                                wl_price * 100)                                                        AS percent " +
            "                   FROM wishlist sw " +
            "                   WHERE e_no = #{e_no}) " +
            "SELECT wl_no, wl_price, wl_product, e_no, payed, COALESCE(percent, 0) AS percent " +
            "FROM wish_fund " +
            "ORDER BY percent DESC")
    List<WishlistVO> getWishlistWIthPayment(int e_no);

    @Select("select * from s_pay where m_id = #{m_id} AND e_no = #{e_no}")
    boolean financeCheck(String m_id, int e_no);

    @Select("SELECT CASE WHEN SUBSTR(m_id, 1, 5) = 'Line_'" +
            "THEN 'line'" +
            "ELSE  'normal'" +
            "END FROM dual")
    String IDTpyeCheck(String m_id);

    @Insert("insert into pay (e_no, m_id, p_type, p_price, wl_no, p_date) " +
            "VALUES (#{e_no}, #{m_id}, #{p_type}, #{p_price}, #{wl_no}, sysdate)")
    void insertWishPick(PayVo payVo);
}

