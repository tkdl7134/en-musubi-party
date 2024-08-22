package com.en.main.service;

import com.en.main.dto.EventVO;
import com.en.main.dto.WishlistVO;
import com.en.main.mapper.WishSettingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishSettingService {

    @Autowired
    private WishSettingMapper wishSettingMapper;

    public EventVO getAmazonLink(int e_no) {
        return wishSettingMapper.getAmazonLink(e_no);
    }

    public void updateAmazonLink(int e_no, EventVO eventVO) {
        wishSettingMapper.updateAmazonLink(e_no, eventVO);
    }

    public List<WishlistVO> allFundingWish(int e_no) {
        return wishSettingMapper.allFundingWish(e_no);
    }

    public void insertFundingWish(WishlistVO wishlistVO) {
        wishSettingMapper.insertFundingWish(wishlistVO);
    }

    public int updateFundingWish(int wl_no, WishlistVO wishlistVO) {
        return wishSettingMapper.updateFundingWish(wl_no, wishlistVO);
    }

    public int deleteFundingWish(int wl_no){
        return wishSettingMapper.deleteFundingWish(wl_no);
    }

}
