package com.en.main.mapper;

import com.en.main.dto.WishlistVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface  FundingMapper {

    @Select("select wl.wl_no, wl.wl_price, wl.wl_product, wl.e_no, COALESCE(SUM(p.p_price), 0) " +
            "AS payed FROM s_wishlist wl " +
            "LEFT JOIN pay p ON wl.wl_no = p.wl_no AND p_type = 'fund' " +
            "WHERE wl.e_no = #{e_no} " +
            "GROUP BY wl.wl_no, wl.wl_price, wl.wl_product, wl.e_no")
    List<WishlistVO> getWishlistWIthPayment(int e_no);
}
