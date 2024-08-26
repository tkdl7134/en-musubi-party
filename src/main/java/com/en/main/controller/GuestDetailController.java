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

        // 이벤트 주체자의 이름, 날짜, 장소 가져오기
        GuestDetailVO eventDetail = templateService.getEventDetailByEventNo(eno);

        // 디버깅을 위해 로그 출력
        if (eventDetail == null) {
            System.out.println("Event detail is null for e_no: " + eno);
        } else {
            System.out.println("Event details found: " + eventDetail.getM_fam_kanji() + " " + eventDetail.getM_name_kanji() +
                    ", Date: " + eventDetail.getW_date() +
                    ", Address: " + eventDetail.getW_wedding_address());
        }

        model.addAttribute("eventOwnerName", eventDetail);
        model.addAttribute("Attend", templateService.getAttendAfterParty(m_id, eno));

        return "template/grouplist";
    }

}
