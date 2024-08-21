package com.en.main.controller;

import com.en.main.dto.AllGuestVO;
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


    @GetMapping("/allguest")
    public String allguest(Model model, AllGuestVO allGuestVO) {
        List<AllGuestVO> allGuestList = templateService.getAllGuest();
        model.addAttribute("allGuestList", allGuestList);
        return "template/allguest";
    }

    @GetMapping("/grouplist")
    public String grouplist(Model model, AllGuestVO allGuestVO) {
        List<AllGuestVO> allGuestList = templateService.getAllGuest();
        model.addAttribute("allGuestList", allGuestList);
        return "template/grouplist";
    }
}
