package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AllergyController {

    @GetMapping("/allergySelect")
    public String allergySelect() {
        return "survey/allergySelect";
    }
}
