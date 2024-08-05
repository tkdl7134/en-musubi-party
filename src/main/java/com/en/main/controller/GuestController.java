package com.en.main.controller;

import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage")
@Controller
public class GuestController {

    @Autowired
    private TemplateService templateService;

    @GetMapping("/guest")
    public String guest() {
        return "template/guest";
    }
    @GetMapping("/guestB")
    public String guestB() {
        return "template/guestB";
    }
    @GetMapping("/guestC")
    public String guestC() {
        return "template/guestC";
    }
}