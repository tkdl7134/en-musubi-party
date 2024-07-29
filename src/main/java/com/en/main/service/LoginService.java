package com.en.main.service;

// 'LoginMapper'를 사용하여 비즈니스 로직을 처리하는 서비스 계층 = 매퍼를 호출하여 필요한 데이터를 가져옴

import com.en.main.dto.MemberVO;
import com.en.main.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    private LoginMapper loginMapper;

    public MemberVO login(MemberVO memberVO) {
        return loginMapper.getLoginInfo(memberVO.getM_id(), memberVO.getM_pw());
    }
}
