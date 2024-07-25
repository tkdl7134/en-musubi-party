package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PartyController {

    @GetMapping("/party")
    public String partyHome() {
        return "party";
    }

}
