package com.en.main.service;

import com.en.main.dto.JhFundSqlVo;
import com.en.main.dto.PayVo;
import com.en.main.dto.StatisticsSendVo;
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

    @Override
    public int getNumberOfPeople(int no) {
        return statisticsFundingMapper.getNumberOfPeople(no);

    }

    @Override
    public int getHighestPrice(int no) {
        return statisticsFundingMapper.getHighestPrice(no);

    }

    @Override
    public String getPopulatedDate(int no) {
        return statisticsFundingMapper.getPopulatedDate(no);
    }

    @Override
    public String getPopularWishlist(int no) {
        return statisticsFundingMapper.getPopularWishlist(no);
    }

    @Override
    public List<JhFundSqlVo> getListupInfos( int no) {
        return statisticsFundingMapper.getListupInfos(no);
    }

    @Override
    public List<JhFundSqlVo> getListupInfosDesc(int no) {
        return statisticsFundingMapper.getListupInfosDesc(no);
    }

    @Override
    public List<JhFundSqlVo> reorderListByMoney(int no) {

        return statisticsFundingMapper.reorderListByMoney(no);
    }

    @Override
    public List<JhFundSqlVo> reorderListByMoneyDesc(int no) {
        return statisticsFundingMapper.reorderListByMoneyDesc(no);
    }

    @Override
    public List<JhFundSqlVo> reorderListByDate(int no) {
        return statisticsFundingMapper.reorderListByDate(no);
    }

    @Override
    public List<JhFundSqlVo> reorderListByDateDesc(int no) {
        return statisticsFundingMapper.reorderListByDateDesc(no);
    }

    @Override
    public int getNumberOfPeopleByWishlistNo(int Wlno, int eno) {
        return statisticsFundingMapper.getNumberOfPeopleByWishlistNo(Wlno , eno);
    }

    @Override
    public int getHighestPriceByWishlistNo(int Wlno, int eno) {
        return statisticsFundingMapper.getHighestPriceByWishlistNo(Wlno , eno);
    }

    @Override
    public String getPopulatedDateByWishlistNo(int Wlno, int eno) {
        return statisticsFundingMapper.getPopulatedDateByWishlistNo(Wlno , eno);
    }

    @Override
    public String getPopularWishlistByWishlistNo(int Wlno, int eno) {
        return statisticsFundingMapper.getPopularWishlistByWishlistNo(Wlno, eno);
    }

    @Override
    public List<StatisticsSendVo> getSendInfos(int eno) {
        return statisticsFundingMapper.getSendInfos(eno);
    }

    @Override
    public List<PayVo> getSendDate(int eno) {

    return statisticsFundingMapper.getSendDate(eno);
    }

    @Override
    public List<StatisticsSendVo> getPriceOrderByRelation(int eno) {

    return statisticsFundingMapper.getPriceOrderByRelation(eno);

    }


}
