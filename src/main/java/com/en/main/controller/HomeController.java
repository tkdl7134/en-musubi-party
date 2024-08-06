package com.en.main.controller;

import com.en.main.dto.MemberVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(HttpSession session, Model model) {
        MemberVO authenticatedMember = (MemberVO) session.getAttribute("authenticatedMember");
        if (authenticatedMember != null) {
            model.addAttribute("welcomeMessage", "✿ " + authenticatedMember.getM_fam_kanji() + "様、ようこそ ✿");
        }
        return "home/home";
    }

}
