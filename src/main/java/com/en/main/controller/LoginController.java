package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.service.LoginService;
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
    public String login(MemberVO memberVO, Model model) {
        MemberVO authenticatedMember = loginService.login(memberVO);
        if (authenticatedMember != null) {
            return "redirect:/HomeController";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login/login";
        }
    }

}