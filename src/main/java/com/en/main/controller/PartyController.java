package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/party")
@Controller
public class PartyController {

    @GetMapping("")
    public String partyType() {
        return "/party/party_apply";
    }

    @GetMapping("/done")
    public String partyTypeDone() {
        return "/party/party_apply_done";
    }

    @GetMapping("/chat")
    public String partyChat() {
        return "/party/party_chat";
    }

    @GetMapping("/info")
    public String partyInfo() {
        return "/party/party_info";
    }


}
