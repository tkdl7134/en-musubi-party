package com.en.main.controller;

import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage")
@Controller
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    @GetMapping("/mytemplate")
    public String mytemplate() {
        return "template/mytemplate";
    }
    @GetMapping("/gropulist")
    public String gropulist() {
        return "template/gropulist";
    }
    @GetMapping("/guest")
    public String guest() {
        return "template/guest";
    }
}
