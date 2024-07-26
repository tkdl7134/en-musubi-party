package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // home 페이지를 기본 페이지로 설정 ~
    @GetMapping("/")
    public String home() {
        return "index";
    }

}
