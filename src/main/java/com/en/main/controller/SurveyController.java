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
        model.addAttribute("2222" ,  surveyService.getMember( m_id) )  ;
        model.addAttribute("3333" ,  surveyService.getMessage( e_no ) )  ;
        model.addAttribute("4444" ,  surveyService.getParty( p_pk ) )  ;
        return "survey/survey";
    }

    @PostMapping("/create")
    public String addGuest(MessageVO messageVO, GuestVO guestVO,
                           @RequestParam(value = "me_img2", required = false) MultipartFile file,
                           MemberVO memberVO, @ModelAttribute CompanionsVO companions , AllergyVO allergyVO,
                           PartyAllergyVO partyAllergyVO) {
        for (CompanionVO companion : companions.getCompanions()) {
            System.out.println("p_accompany_num: " + companion.getP_accompany_num());
            System.out.println("p_accompany_type: " + companion.getP_accompany_type());
        }
        System.out.println(messageVO);
        System.out.println(guestVO);
        System.out.println(file.getOriginalFilename());
        System.out.println(memberVO);
        System.out.println(allergyVO);
        System.out.println(partyAllergyVO);

        surveyService.addGuest(messageVO, guestVO, allergyVO, file, companions.getCompanions());
        return "redirect:/survey";
    }

}
