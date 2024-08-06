package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/member/findID")
    public String findIDForm() {
        return "member/findID";
    }

    @PostMapping("/member/findID")
    public String findID(String m_fam_eng, String m_email, Model model) {
        MemberVO member = memberService.findID(m_fam_eng, m_email);
        if (member != null) {
            model.addAttribute("memberID", member.getM_id());
        } else {
            model.addAttribute("error", "일치하는 ID가 없습니다.");
        }
        return "member/findIDResult";
    }

    @GetMapping("/member/findPW")
    public String findPWForm() {
        return "member/findPW";
    }

    @PostMapping("/member/findPW")
    public String findPW(String m_id, String m_email, Model model) {
        boolean result = memberService.sendResetPWLink(m_id, m_email);
        if (result) {
            model.addAttribute("message", "비밀번호 재설정 링크가 이메일로 전송되었습니다.");
        } else {
            model.addAttribute("error", "일치하는 계정이 없습니다.");
        }
        return "member/findPWResult";
    }

    @GetMapping("/member/resetPW")
    public String resetPWForm(@RequestParam("token") String token, Model model) {
        boolean validToken = memberService.validateResetPWToken(token);
        if (validToken) {
            model.addAttribute("token", token);
            return "member/resetPW";
        } else {
            model.addAttribute("error", "유효하지 않은 토큰입니다.");
            return "member/resetPWError";
        }
    }

    @PostMapping("/member/resetPW")
    public String resetPW(String token, String newPassword, Model model) {
        boolean result = memberService.resetPW(token, newPassword);
        if (result) {
            model.addAttribute("message", "비밀번호가 성공적으로 재설정되었습니다.");
        } else {
            model.addAttribute("error", "비밀번호 재설정에 실패했습니다.");
        }
        return "member/resetPWResult";
    }
}
