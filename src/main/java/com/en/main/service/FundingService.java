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

        // 2. 퍼센트 계산
        for (WishlistVO wish : wishlist) {
            int percent = (int) ((double)wish.getPayed() / wish.getWl_price() * 100);
            // 필요한 경우 percent를 VO에 추가하거나 바로 처리
            wish.setPercent(percent); // 이 필드를 사용하지 않는다면 생략 가능
        }
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
