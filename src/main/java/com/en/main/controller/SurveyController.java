package com.en.main.controller;
import com.en.main.dto.*;
import com.en.main.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/survey")
@Controller
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @GetMapping()
    public String survey(Model model) {
        String m_id= "test9";
        int e_no= 68;
        model.addAttribute("2222" ,  surveyService.getMember( m_id) )  ;
        model.addAttribute("3333" ,  surveyService.getMessage( e_no ) )  ;
        return "survey/survey";
    }

    @PostMapping("/create")
    public String addGuest(MessageVO messageVO, GuestVO guestVO,
                           @RequestParam(value = "me_img2", required = false) MultipartFile file,
                           MemberVO memberVO, CompanionVO companionVO, AllergyVO allergyVO) {
        System.out.println(messageVO);
        System.out.println(guestVO);
        System.out.println(file.getOriginalFilename());
        System.out.println(memberVO);
        System.out.println(companionVO);
        System.out.println(companionVO.getP_accompany_num()); // CompanionVO에서 p_accompany_num 확인
        System.out.println(allergyVO);

        //      surveyService.addGuest(messageVO, guestVO, file);
      return "redirect:/survey";
    }

}
