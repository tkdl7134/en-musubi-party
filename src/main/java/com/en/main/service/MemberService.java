package com.en.main.service;

import com.en.main.dto.MemberVO;
import com.en.main.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private MailService mailService;

    @Autowired
    private TokenService tokenService;

    private final String domain = "http://localhost:80";

    public MemberVO findID(String m_fam_eng, String m_email) {
        return memberMapper.findID(m_fam_eng, m_email);
    }

    public boolean sendResetPWLink(String m_id, String m_email) {
        MemberVO member = memberMapper.findPWByEmail(m_id, m_email);
        if (member != null) {
            String token = tokenService.createToken(m_id);
            mailService.sendResetPWMail(m_email, token);
            return true;
        }
        return false;
    }

    public boolean validateResetPWToken(String token) {
        String memberID = tokenService.validateToken(token);
        return memberID != null;
    }

    public boolean resetPW(String token, String newPW) {
        String memberID = tokenService.validateToken(token);
        if (memberID != null) {
            memberMapper.updatePW(memberID, newPW);
            tokenService.deleteToken(token);
            return true;
        }
        return false;
    }


    public String registerMember(MemberVO memberVO) {
        memberMapper.insertMember(memberVO);
        return "Registration successful";
    }

    public MemberVO getMemberInfo(String m_id) {
        return memberMapper.findMemberById(m_id);  // ID로 회원 정보 가져오기
    }

    public void updateMemberInfo(MemberVO memberVO) {
        memberMapper.updateMember(memberVO);  // 회원 정보 업데이트
    }

}
