package com.en.main.controller;

import com.en.main.dto.AttendVO;
import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/mypage")
@Controller
public class AttendController {

    @Autowired
    private TemplateService templateService;

    private void populateAttendList(Model model) {
        List<AttendVO> attendList = templateService.getAttend();
        model.addAttribute("attendList", attendList);
    }

    @GetMapping("/guest")
    public String guest(Model model) {
        populateAttendList(model);
        return "template/guest";
    }


    @GetMapping("/guestC")
    public String guestC(Model model) {
        populateAttendList(model);
        return "template/guestC";
    }
}
