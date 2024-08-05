package com.en.main.controller;

import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage")
@Controller
public class GroupController {

    @Autowired
    private TemplateService templateService;

    @GetMapping("/grouplist")
    public String grouplist() {
        return "template/grouplist";
    }
}
