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
    public String grouplist(Model model, AllGuestVO allGuestVO, @PathVariable String m_id) {
        List<AllGuestVO> allGuestList = templateService.getAllGuest(m_id);
        model.addAttribute("allGuestList", allGuestList);
        int eno = allGuestList.get(0).getE_no();

        // 이벤트 주체자의 이름 가져오기
        List<MemberVO> eventOwners = templateService.getEventOwnerNames(eno);
        model.addAttribute("eventOwnerNames", eventOwners);

        model.addAttribute("Attend", templateService.getAttendAfterParty(m_id, eno));

        return "template/grouplist";
    }




}
