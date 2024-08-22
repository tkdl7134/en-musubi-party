package com.en.main.controller;

import com.en.main.dto.PayVo;
import com.en.main.service.FundingService;
import com.en.main.service.SendingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sending")
public class SendingController {

    @Autowired
    private FundingService fundingService;
    @Autowired
    private SendingService sendingService;

    @GetMapping
    public String showSendingPage(Model model) {
        // 로그인 여부 체크?

        model.addAttribute("title", "送金");
        model.addAttribute("page", "send/sending.jsp");
        return "wishlist/sending";
    }

    @PostMapping
    public String processSending(PayVo payVo,@RequestParam("amount") String amount, Model model) {

        if (fundingService.financeCheck(payVo.getM_id(), payVo.getE_no())) {
            sendingService.insertWishPick(payVo.getM_id(),payVo.getE_no(), amount);
            return "redirect:/result";
        } else {
            return "redirect:/result?done=done";
        }
    }
}

