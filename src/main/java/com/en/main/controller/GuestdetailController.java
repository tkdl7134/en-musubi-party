//package com.en.main.controller;
//
//import com.en.main.dto.AttendVO;
//import com.en.main.dto.GuestVO;
//import com.en.main.service.TemplateService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import java.util.List;
//
//@RequestMapping("/mypage")
//@Controller
//public class GuestdetailController {
//
//    @Autowired
//    private TemplateService templateService;
//
//    @GetMapping("/guestB")
//    public String guestB(Model model, GuestVO guestVO) {
//        List<GuestVO> guestList = templateService.getGuest();
//        model.addAttribute("guestList", guestList);
//        return "template/guestB";
//    }
//}
