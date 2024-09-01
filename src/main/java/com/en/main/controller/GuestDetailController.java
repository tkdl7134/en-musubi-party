package com.en.main.controller;

import com.en.main.dto.AllGuestVO;
import com.en.main.dto.GuestDetailVO;
import com.en.main.dto.MemberVO;

import com.en.main.service.TemplateService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/mypage")
@Controller
public class GuestDetailController {

    @Autowired
    private TemplateService templateService;


    @GetMapping("/allguest")
    public String allguest(Model model, AllGuestVO allGuestVO) {
        List<GuestDetailVO> guestDetailVOList = templateService.getGuestDetail(allGuestVO.getE_no());
        model.addAttribute("guestDetailVOList", guestDetailVOList);
        return "template/allguest";
    }

    @GetMapping("/grouplist/{m_id}")
    public String grouplist(Model model, @PathVariable String m_id) {
        List<AllGuestVO> allGuestList = templateService.getAllGuest(m_id);
        model.addAttribute("allGuestList", allGuestList);

        if (allGuestList.isEmpty()) {
            System.out.println("No guests found for m_id: " + m_id);
            return "template/grouplist";
        }

        int eno = allGuestList.get(0).getE_no();
        GuestDetailVO eventDetail = templateService.getEventDetailByEventNo(eno);

        if (eventDetail == null) {
            System.out.println("Event detail is null for e_no: " + eno);
        } else {
            System.out.println("Event details found: " + eventDetail.getM_fam_kanji() + " " + eventDetail.getM_name_kanji() +
                    ", Date: " + eventDetail.getW_date() +
                    ", Address: " + eventDetail.getW_wedding_address());
        }

        model.addAttribute("eventOwnerName", eventDetail);

        return "template/grouplist";
    }
}
