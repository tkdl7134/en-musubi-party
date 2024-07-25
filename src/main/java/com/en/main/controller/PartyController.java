package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PartyController {

    @GetMapping("/party")
    public String partyType() {
        return "/party/party_apply";
    }

    @GetMapping("/party/done")
    public String partyTypeDone() {
        return "/party/party_apply_done";
    }

}
