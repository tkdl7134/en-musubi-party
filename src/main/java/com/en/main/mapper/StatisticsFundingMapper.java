package com.en.main.mapper;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StatisticsFundingMapper {


    @Select("select * from wishlist where e_no = #{eno}")
    List<WishlistVO> getWishlistData(int eno);

    @Select("SELECT \n" +
            "    TRUNC(p_date) AS transaction_date, \n" +
            "    SUM(p_price) AS total_price\n" +
            "FROM \n" +
            "    pay\n" +
            "WHERE \n" +
            "    p_date BETWEEN TRUNC(SYSDATE - 7) AND TRUNC(SYSDATE) + INTERVAL '1' DAY - INTERVAL '1' SECOND\n" +
            "    AND e_no = 5\n" +
            "    AND p_type = 'fund'\n" +
            "GROUP BY \n" +
            "    TRUNC(p_date)\n" +
            "ORDER BY \n" +
            "    TRUNC(p_date)")
    List<PayVo> getDate(int eno);


    @Select("SELECT\n" +
            "    SUM(p.p_price) AS total_p_price\n" +
            "FROM\n" +
            "    wishlist w\n" +
            "        JOIN\n" +
            "    pay p ON w.wl_no = p.wl_no\n" +
            "WHERE\n" +
            "    p.p_type = 'fund'\n" +
            "  AND p.e_no = 5\n" +
            "  AND w.wl_no = #{no}\n" +
            "GROUP BY\n" +
            "    w.wl_price ")
            int getPrices(PayVo payVo ,int no);



}