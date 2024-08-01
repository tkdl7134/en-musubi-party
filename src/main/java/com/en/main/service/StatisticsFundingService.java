package com.en.main.service;

import com.en.main.dto.PayVo;
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

    @Override
    public List<PayVo> getDate(int eno) {
        return statisticsFundingMapper.getDate(eno);
    }

    @Override
    public int getPrices(PayVo payVo, int no) {
        return statisticsFundingMapper.getPrices(payVo,no);
    }


}
