package com.en.main.service;

import com.en.main.dto.WishlistVO;
import com.en.main.mapper.StatisticsFundingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticsFundingService implements StatisticsFundingMapper {
    @Autowired
   private StatisticsFundingMapper statisticsFundingMapper;

    @Override
    public List<WishlistVO> getWishlistData(int eno) {

       return statisticsFundingMapper.getWishlistData(eno);


    }
}
