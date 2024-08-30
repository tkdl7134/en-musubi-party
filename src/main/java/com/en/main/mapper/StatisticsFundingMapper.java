package com.en.main.mapper;

import com.en.main.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StatisticsFundingMapper {


    @Select("select * from wishlist where e_no = #{eno}")
    List<WishlistVO> getWishlistData(int eno);
    @Select("select * from wishlist join pay on wishlist.wl_no = pay.wl_no where wishlist.e_no = #{eno} order by wishlist.wl_no")
    List<WishlistVO> getFundWishlistData(int eno);

    @Select("SELECT \n" +
            "    TRUNC(p_date) AS transaction_date, \n" +
            "    SUM(p_price) AS total_price\n" +
            "FROM \n" +
            "    pay\n" +
            "WHERE \n" +
            "    p_date BETWEEN TRUNC(SYSDATE - 7) AND TRUNC(SYSDATE) + INTERVAL '1' DAY - INTERVAL '1' SECOND\n" +
            "    AND e_no = #{eno}\n" +
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
            "  AND p.e_no = #{eno}\n" +
            "  AND w.wl_no = #{no}\n" +
            "GROUP BY\n" +
            "    w.wl_price ")
            int getPrices(int no , int eno);

        @Select("select count(M_ID)  from pay where p_type = 'fund' and E_NO =  #{no}")
    int getNumberOfPeople (int no);
        @Select("select count(M_ID)  from pay where p_type = 'send' and E_NO =  #{no}")
    int getSendNumberOfPeople (int no);

        @Select("select max(P_PRICE) from pay where p_type = 'fund' and E_NO = #{no}")
    int getHighestPrice(int no);
        @Select("select max(P_PRICE) from pay where p_type = 'send' and E_NO = #{no}")
    int getSendHighestPrice(int no);

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
        @Select("SELECT p_date\n" +
                "FROM (\n" +
                "         SELECT p_date, COUNT(p_date) AS occurrence_count\n" +
                "         FROM pay\n" +
                "         WHERE p_type = 'send' AND e_no = #{no}\n" +
                "         GROUP BY p_date\n" +
                "         ORDER BY occurrence_count DESC\n" +
                "     )\n" +
                "WHERE ROWNUM = 1")
        String getSendPopulatedDate(int no);

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

    @Select("SELECT g.g_relation\n" +
            "FROM pay p\n" +
            "         JOIN guest g ON p.m_id = g.m_id\n" +
            "WHERE p.p_type = 'send'\n" +
            "  AND p.e_no = #{no}\n" +
            "GROUP BY g.g_relation\n" +
            "ORDER BY COUNT(*) DESC\n" +
            "    FETCH FIRST 1 ROWS ONLY")
    String getSendPopularRelation(int no);


    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by WL_PRODUCT desc")
   List<JhFundSqlVo> getListupInfos(int no);
    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by WL_PRODUCT ")
   List<JhFundSqlVo> getListupInfosDesc(int no);



    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by p_price desc")
    List<JhFundSqlVo> reorderListByMoney(int no);
    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by p_price ")
    List<JhFundSqlVo> reorderListByMoneyDesc(int no);
    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by p_date desc")
    List<JhFundSqlVo> reorderListByDate(int no);
    @Select("SELECT pay.p_price, pay.p_date, member.M_FAM_KANJI, member.M_NAME_KANJI, wishlist.wl_product\n" +
            "\t\t\t\t\tFROM pay\n" +
            "\t\t\t\t\tINNER JOIN member ON pay.m_id = member.m_id join wishlist on pay.WL_NO = wishlist.WL_NO where pay.e_no=#{no} and p_type='fund' order by p_date")
    List<JhFundSqlVo> reorderListByDateDesc(int no);



    @Select("select count(M_ID)  from pay where p_type = 'fund' and E_NO =  #{eno} and wl_no = #{Wlno}")
    int getNumberOfPeopleByWishlistNo (int Wlno , int eno);

    @Select("select max(P_PRICE) from pay where p_type = 'fund' and E_NO = #{eno} and wl_no = #{Wlno}")
    int getHighestPriceByWishlistNo(int Wlno , int eno);

    @Select("SELECT p_date\n" +
            "FROM (\n" +
            "         SELECT p_date, COUNT(p_date) AS occurrence_count\n" +
            "         FROM pay\n" +
            "         WHERE p_type = 'fund' AND e_no = #{eno}  and wl_no  = #{Wlno}   \n" +
            "         GROUP BY p_date\n" +
            "         ORDER BY occurrence_count DESC\n" +
            "     )\n" +
            "WHERE ROWNUM = 1")
    String getPopulatedDateByWishlistNo(int Wlno , int eno);

    @Select("SELECT ranking\n" +
            "FROM (\n" +
            "         SELECT wl_no, SUM(p_price) AS total_price,\n" +
            "                RANK() OVER (ORDER BY SUM(p_price) DESC) AS ranking\n" +
            "         FROM pay\n" +
            "         WHERE p_type = 'fund' AND e_no = #{eno}\n" +
            "         GROUP BY wl_no\n" +
            "     )\n" +
            "WHERE wl_no = #{Wlno}" )
    String getPopularWishlistByWishlistNo(int Wlno , int eno);

@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno}")
    List<StatisticsSendVo> getSendInfos (int eno);
@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno} order by g_relation")
    List<StatisticsSendVo> getSendInfosByRelation (int eno);
@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno} order by g_relation desc")
    List<StatisticsSendVo> getSendInfosByRelationDesc (int eno);
@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno} order by p_price")
    List<StatisticsSendVo> getSendInfosByMoney (int eno);
@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno} order by p_price desc")
    List<StatisticsSendVo> getSendInfosByMoneyDesc (int eno);
@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno} order by p_date desc")
    List<StatisticsSendVo> getSendInfosByDate (int eno);
@Select("select p_price , p_date , g_relation , G_RELATION_DETAIL , m_fam_kanji , m_name_kanji from pay join guest on pay.E_NO = guest.E_NO and pay.M_ID= guest.M_ID join EN.MEMBER M on M.M_ID = guest.M_ID where p_type = 'send' and PAY.E_NO = #{eno} order by p_date ")
    List<StatisticsSendVo> getSendInfosByDateDesc (int eno);

    @Select("SELECT \n" +
            "    TRUNC(p_date) AS transaction_date, \n" +
            "    SUM(p_price) AS total_price\n" +
            "FROM \n" +
            "    pay\n" +
            "WHERE \n" +
            "    p_date BETWEEN TRUNC(SYSDATE - 7) AND TRUNC(SYSDATE) + INTERVAL '1' DAY - INTERVAL '1' SECOND\n" +
            "    AND e_no = #{eno} \n" +
            "    AND p_type = 'send'\n" +
            "GROUP BY \n" +
            "    TRUNC(p_date)\n" +
            "ORDER BY \n" +
            "    TRUNC(p_date)")
    List<PayVo> getSendDate(int eno);

    @Select("SELECT g.g_relation, SUM(p.p_price) AS p_price FROM guest g JOIN pay p ON g.m_id = p.m_id AND g.e_no = p.e_no WHERE g.e_no = #{eno} AND p.p_type = 'send' GROUP BY g.g_relation")
    List<StatisticsSendVo> getPriceOrderByRelation (int eno);


    @Select("SELECT\n" +
            "    COUNT(CASE WHEN guest.G_GUEST_TYPE = '新郎' THEN 1 END) AS groom_guest_count,\n" +
            "    COUNT(CASE WHEN guest.G_GUEST_TYPE = '新婦' THEN 1 END) AS bride_guest_count\n" +
            "FROM\n" +
            "    pay\n" +
            "        JOIN\n" +
            "    guest\n" +
            "    ON\n" +
            "        pay.M_ID = guest.M_ID\n" +
            "            AND\n" +
            "        pay.E_NO = guest.E_NO\n" +
            "WHERE\n" +
            "    PAY.E_NO = #{eno} and pay.p_type = 'send'")
    JhGuestTypeVo getGuestTypeCount(int eno);


    @Select ("SELECT\n" +
            "    COUNT(CASE WHEN guest.G_ATTEND_WEDDING = 'ご欠席' THEN 1 END) AS not_attend_count,\n" +
            "    COUNT(CASE WHEN guest.G_ATTEND_WEDDING = 'ご出席' THEN 1 END) AS attend_count\n" +
            "FROM\n" +
            "    pay\n" +
            "        JOIN\n" +
            "    guest\n" +
            "    ON\n" +
            "        pay.M_ID = guest.M_ID\n" +
            "            AND\n" +
            "        pay.E_NO = guest.E_NO\n" +
            "WHERE\n" +
            "    PAY.E_NO = #{eno} and pay.p_type = 'send'")
    JhAttendVo getAttendCount(int eno);



}