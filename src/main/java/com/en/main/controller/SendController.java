package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishlist/sending")
@Controller
public class SendController {

    @GetMapping
    public String send(){

    return "/wishlist/sending";
    }

    @PostMapping
    public String insertWish(){
    return "redirect:/wishlist/funding/result";
    }


}
