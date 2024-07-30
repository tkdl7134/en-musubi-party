package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    // 모든 구조에는 test로 기본 내용 적용.



    @GetMapping("/")
    public String home(Model model) {
        return "home";
    }

}
