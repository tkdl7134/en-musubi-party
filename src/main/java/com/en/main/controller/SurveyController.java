package com.en.main.controller;
import com.en.main.dto.*;
import com.en.main.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

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
    @Transactional
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
            companion.setP_accompany_num(companions.getCompanions().size());
        }

        System.out.println(messageVO);
        System.out.println(guestVO);
        System.out.println(guestVO.getG_allergy_or());
        System.out.println(memberVO);
        System.out.println(allergyVO);
        System.out.println(companions);

        surveyService.updateMemberInfo(memberVO);

        if(messageVO.getMe_img() == null && Objects.equals(messageVO.getMe_content(), "")){
            System.out.println((String) null);
            messageVO.setMe_img("none");
            messageVO.setMe_content("none");
            System.out.println("메세지 노우");
        } else {
            surveyService.addMessage(messageVO,file);
            System.out.println("메세지 예쓰");
        }

        if(guestVO.getG_allergy_or() == null){
            surveyService.addGuest(guestVO);
            System.out.println("알러지 없음");
        } else {
            surveyService.addGuestNAllergy(guestVO, allergyVO);
            System.out.println("알러지 있음");
        }

        if (!companions.getCompanions().isEmpty()) {
            surveyService.addCompanion(companions.getCompanions());
            System.out.println("동반자 있음!");
        }

//        surveyService.addGuest(messageVO, guestVO, allergyVO, file, companions.getCompanions());
        return "wishlist/wishlist";
    }

}
