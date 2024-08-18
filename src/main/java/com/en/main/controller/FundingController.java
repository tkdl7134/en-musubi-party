package com.en.main.controller;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import com.en.main.service.FundingService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/funding")
public class FundingController {

    @Autowired
    private FundingService fundingService;

    @GetMapping
    public String getFundingList(PayVo payVo, Model model, HttpServletRequest request) {
        // 로그인 여부 체크는 Interceptor에서 처리
        List<WishlistVO> fundingList = fundingService.getFundList(payVo.getE_no());

        // 모델에 펀딩 목록 추가
        model.addAttribute("fundingList", fundingList);

        // funding.jsp 페이지로 이동
        return "wishlist/funding";
    }

    @GetMapping("/check-finance")
    public String checkFinance(PayVo payVo,Model model, HttpServletRequest request) {
        boolean hasFinanced = fundingService.financeCheck(payVo.getM_id(), payVo.getE_no());
        model.addAttribute("hasFinanced", hasFinanced);
        return "wishlist/finance-check-result";
    }

    @GetMapping("/check-id-type")
    public String checkIdType(PayVo payVo, Model model, HttpServletRequest request) {
        String idTpye = fundingService.IDTypeCheck(payVo.getM_id());
        model.addAttribute("idType", idTpye);
        return "wishlist/check-id-type";
    }

    @PostMapping("/insert")
    public String insertFunding(PayVo payVo, Model model, HttpServletRequest request) {
        fundingService.insertWishPick(payVo);
        return "redirect:/funding";
    }
}
