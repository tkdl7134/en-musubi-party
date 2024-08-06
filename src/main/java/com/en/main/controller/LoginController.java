package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("memberVO", new MemberVO());
        return "login/login";
    }

    @PostMapping("/login")
    public String login(MemberVO memberVO, Model model, HttpSession session) {
        // 입력 필드 검증 → 비어 있을 경우를 위한 각각의 오류 메시지 설정
        if (memberVO.getM_id().isEmpty()) {
            model.addAttribute("errorID", "IDを入力してください");
        }
        if (memberVO.getM_pw().isEmpty()) {
            model.addAttribute("errorPW", "パスワードを入力してください");
        }

        // ID & PW 모두 입력된 경우에만 로그인 시도
        if (!memberVO.getM_id().isEmpty() && !memberVO.getM_pw().isEmpty()) {
            MemberVO authenticatedMember = loginService.login(memberVO);
            if (authenticatedMember != null) {
                session.setAttribute("authenticatedMember", authenticatedMember);
                return "redirect:/";
            } else {
                model.addAttribute("error", "IDまたはパスワードが正しくありません");
            }
        }

        return "login/login";
    }

}
