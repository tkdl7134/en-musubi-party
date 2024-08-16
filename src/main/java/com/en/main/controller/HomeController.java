package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String goToHome() {
        return "home/home";
    }

    @GetMapping("/main")
    public String goToMain(){
        return "main/main";
    }

}



