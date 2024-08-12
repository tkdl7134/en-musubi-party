package com.en.main.controller;

import com.en.main.service.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishlist/funding")
@Controller
public class FundingControl {
    @Autowired
    private FundingService fundingService;

    @GetMapping()
    public String funding() {

        return "wishlist/funding";
    }
}
