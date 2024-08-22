package com.en.main.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/session")
public class SesssionController {

    @GetMapping("/invalidate")
    public String invalidateSession_ID(HttpSession session) {
        System.out.println("만료시키려고 들어옴!");
        session.invalidate();
//        return "main/main";
        return "redirect:/";
    }
}
