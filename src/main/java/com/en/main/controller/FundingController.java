package com.en.main.controller;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import com.en.main.service.FundingService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

}
