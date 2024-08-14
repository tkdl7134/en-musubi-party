package com.en.main.controller;
import com.en.main.dto.*;
import com.en.main.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequestMapping("/survey")
@Controller
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @GetMapping()
    public String survey(Model model) {
        String m_id= "test9";
        int e_no= 68;
        int p_pk= 21;
        model.addAttribute("Member" ,  m_id )  ;
        model.addAttribute("Message" ,  e_no )  ;
        model.addAttribute("Party" ,  p_pk )  ;

        MemberVO memberInfo = surveyService.getMember(m_id);
        model.addAttribute("member", memberInfo);

        return "survey/survey";
    }

    @PostMapping("/create")
    public String addGuest(MessageVO messageVO, GuestVO guestVO,
                           @RequestParam(value = "me_img2", required = false) MultipartFile file,
                           MemberVO memberVO, @ModelAttribute CompanionsVO companions , AllergyVO allergyVO) {
        // 초대장의 pk
        int e_no = messageVO.getE_no();
        String m_id = messageVO.getM_id();
        for (CompanionVO companion : companions.getCompanions()) {
            System.out.println("p_accompany_num: " + companion.getP_accompany_num());
            System.out.println("p_accompany_type: " + companion.getP_accompany_type());
            companion.setM_id(m_id);
            companion.setE_no(e_no);
            companion.setP_accompany_num(         companions.getCompanions().size());
        }
        System.out.println(messageVO);
        System.out.println(guestVO);
        System.out.println(memberVO);
        System.out.println(allergyVO);
        System.out.println(companions);

        surveyService.updateMemberInfo(memberVO);

        surveyService.addGuest(messageVO, guestVO, allergyVO, file, companions.getCompanions());
        return "redirect:/survey";
    }

}
