package com.en.main.controller;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import com.en.main.service.FundingService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/wishlist/funding")
public class FundingController {

    @Autowired
    private FundingService fundingService;

    @GetMapping
    public String getFundingList(PayVo payVo, Model model, HttpServletRequest request) {
        // 로그인 여부 체크는 Interceptor에서 처리
        // funding.jsp 페이지로 이동
        return "wishlist/funding";
    }

    @ResponseBody
    @PostMapping
    public List<WishlistVO> getFundingList(@RequestParam int eno) {
        return fundingService.getFundList(eno);
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

    @ResponseBody
    @PostMapping("/insert")
    public List<WishlistVO> insertFunding(PayVo payVo, Model model, HttpServletRequest request) {
        System.out.println(payVo);
        fundingService.insertWishPick(payVo);
        return getFundingList(payVo.getE_no());
    }

    @GetMapping("/result")
    public String financeResult(HttpSession session){
        session.setAttribute("loginType", "normal");
        return "wishlist/financeresult";
    }


}
