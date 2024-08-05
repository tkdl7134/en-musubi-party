package com.en.main.mapper;

import com.en.main.dto.JhFundSqlVo;
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

        @Select("select count(M_ID)  from pay where p_type = 'fund' and E_NO =  #{no}")
    int getNumberOfPeople (int no);

        @Select("select max(P_PRICE) from pay where p_type = 'fund' and E_NO = #{no}")
    int getHighestPrice(int no);

        @Select("SELECT p_date\n" +
                "FROM (\n" +
                "         SELECT p_date, COUNT(p_date) AS occurrence_count\n" +
                "         FROM pay\n" +
                "         WHERE p_type = 'fund' AND e_no = #{no}\n" +
                "         GROUP BY p_date\n" +
                "         ORDER BY occurrence_count DESC\n" +
                "     )\n" +
                "WHERE ROWNUM = 1")
        String getPopulatedDate(int no);

    @Select("WITH RankedWlNo AS (\n" +
            "    SELECT wl_no,\n" +
            "           ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rn\n" +
            "    FROM pay\n" +
            "    WHERE p_type = 'fund' AND e_no = #{no}\n" +
            "    GROUP BY wl_no\n" +
            ")\n" +
            "SELECT w.wl_product\n" +
            "FROM wishlist w\n" +
            "         JOIN RankedWlNo r ON w.wl_no = r.wl_no\n" +
            "WHERE r.rn = 1")
    String getPopularWishlist(int no);


    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by WL_PRODUCT desc")
   List<JhFundSqlVo> getListupInfos(int no);


}