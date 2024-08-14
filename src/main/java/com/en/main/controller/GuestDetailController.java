package com.en.main.controller;

import com.en.main.dto.GuestDetailVO;
import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/mypage")
@Controller
public class GuestDetailController {

    @Autowired
    private TemplateService templateService;

    @GetMapping("/guestB")
    public String guestB(Model model, GuestDetailVO guestDetailVO) {
        List<GuestDetailVO> guestDetailList = templateService.getGuestDetail();
        model.addAttribute("guestDetailList", guestDetailList);
        return "template/guestB";
    }
}