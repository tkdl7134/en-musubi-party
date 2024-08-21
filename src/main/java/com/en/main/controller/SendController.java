package com.en.main.controller;

import com.en.main.dto.PayVo;
import com.en.main.service.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishlist/sending")
@Controller
public class SendController {

    @Autowired
    private FundingService fundingService;

    @GetMapping
    public String send(){

    return "/wishlist/sending";
    }

    @PostMapping
    public String insertWish(PayVo payVo, Model model){
        System.out.println(payVo);
        fundingService.insertWishPick(payVo);

    return "redirect:/wishlist/sending/result";
    }


}
