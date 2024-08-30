package com.en.main.service;

import com.en.main.mapper.WishlistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishlistService {

    @Autowired

    private WishlistMapper wishlistMapper;


    public String getAmazonUrl(String m_id, int e_no) {
        return wishlistMapper.selectAmazon(m_id, e_no);
    }
}
