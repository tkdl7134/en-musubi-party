package com.en.main.mapper;

import com.en.main.dto.EventVO;
import com.en.main.dto.WishlistVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface WishSettingMapper {

// WISHLIST 목록
    @Select("select e_amazon, e_no from event where e_no = #{e_no}")
    EventVO getAmazonLink(int e_no);

    @Update("update event set e_amazon = #{eventVO.e_amazon} where e_no = #{e_no}")
    void updateAmazonLink(int e_no, EventVO eventVO);

// FUNDING 내 WISH
    @Select("select * from wishlist where e_no = #{e_no} order by wl_no desc" )
    List<WishlistVO> allFundingWish(int e_no);

    @Insert("insert into wishlist values (wishlist_seq.nextval, #{e_no}, #{wl_product}, #{wl_price})")
    void insertFundingWish(WishlistVO wishlistVO);

    @Update("update wishlist set wl_price = #{wishlistVO.wl_price} where wl_no = #{wl_no}")
    int updateFundingWish(int wl_no, WishlistVO wishlistVO);

    @Delete("delete wishlist where wl_no = #{wl_no}")
    int deleteFundingWish(int wl_no);

}
