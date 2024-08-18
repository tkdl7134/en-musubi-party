package com.en.main.mapper;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface WishlistMapper {

    @Select("select wl.wl_no, wl.wl_price, wl.wl_product, wl.e_no, COALESCE(SUM(p.p_price), 0) " +
            "AS payed FROM s_wishlist wl " +
            "LEFT JOIN pay p ON wl.wl_no = p.wl_no AND p_type = 'fund' " +
            "WHERE wl.e_no = #{e_no} " +
            "GROUP BY wl.wl_no, wl.wl_price, wl.wl_product, wl.e_no")
    List<WishlistVO> getWishlistWIthPayment(int e_no);

    @Select("select * from s_pay where m_id = #{m_id} AND e_no = #{e_no}")
    boolean financeCheck(String m_id, int e_no);

    @Select("SELECT CASE WHEN SUBSTR(m_id, 1, 5) = 'Line_'" +
            "THEN 'line'" +
            "ELSE  'normal'" +
            "END FROM dual")
    String IDTpyeCheck(String m_id);

    @Insert("insert into s_pay (e_no, m_id, p_type, p_price, wl_no, p_date) " +
            "VALUES (#{e_no}, #{m_id}, #{p_type}, #{p_price}, #{wl_no}, sysdate)")
    void insertWishPick(PayVo payVo);
}

