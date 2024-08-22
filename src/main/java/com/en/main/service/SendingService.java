package com.en.main.service;

import com.en.main.dto.PayVo;
import com.en.main.mapper.WishlistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SendingService {

    @Autowired
    private WishlistMapper wishlistMapper;

    public void insertWishPick(String m_id, int e_no, String amount) {
        // PayVO 객체를 생성하여 FundingMapper에 전달
        PayVo payVo = new PayVo();
        payVo.setE_no(e_no);
        payVo.setM_id(m_id);
        payVo.setP_type("send");
        payVo.setP_price(Integer.parseInt(amount));

        // wl_no는 필요한 경우 추가로 설정
        wishlistMapper.insertWishPick(payVo);
    }

    public boolean financeCheck(String m_id, int e_no) {
        return wishlistMapper.financeCheck(m_id, e_no);
    }
}
