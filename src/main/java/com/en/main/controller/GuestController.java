package com.en.main.controller;

import com.en.main.dto.GuestVO;
import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/mypage")
@Controller
public class GuestController {

    @Autowired
    private TemplateService templateService;

    private void populateGuestList(Model model) {
        List<GuestVO> guestList = templateService.getGuest();
        model.addAttribute("guestList", guestList);
    }

    @GetMapping("/guest")
    public String guest(Model model) {
        populateGuestList(model);
        return "template/guest";
    }

    @GetMapping("/guestB")
    public String guestB(Model model) {
        populateGuestList(model);
        return "template/guestB";
    }

    @GetMapping("/guestC")
    public String guestC(Model model) {
        populateGuestList(model);
        return "template/guestC";
    }
}
