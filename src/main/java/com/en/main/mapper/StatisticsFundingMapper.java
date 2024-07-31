package com.en.main.mapper;

import com.en.main.dto.WishlistVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StatisticsFundingMapper {


    @Select("select * from wishlist where e_no = #{eno}")
    List<WishlistVO> getWishlistData(int eno);

}
