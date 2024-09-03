package com.en.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReactController {

    @GetMapping(value = {"/r", "/r/login", "/r/create-account", "/r/join-user", "/r/login/manager"})
    public String index() {
        System.out.println("일로 오긴 했니?");
        return "forward:/index.html";
    }
}

