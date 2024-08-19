package com.en.main.service;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import com.en.main.mapper.WishlistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FundingService {

    @Autowired
    private WishlistMapper wishlistMapper;

    public List<WishlistVO> getFundList(int e_no) {
        // 1. 기본 데이터 조회
        List<WishlistVO> wishlist = wishlistMapper.getWishlistWIthPayment(e_no);
        return wishlist;

    }

    public void insertWishPick(PayVo payVo) {
        wishlistMapper.insertWishPick(payVo);
    }

    public boolean financeCheck(String m_id, int e_no) {
        return wishlistMapper.financeCheck(m_id, e_no);
    }

    public String IDTypeCheck(String m_id) {
        return wishlistMapper.IDTpyeCheck(m_id);
    }
}
