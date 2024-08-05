package com.en.main.controller;
import com.en.main.dto.GuestVO;
import com.en.main.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @GetMapping
    public String survey() {
        return "/survey/survey";
    }

    @PostMapping("/create")
    public String addGuest(GuestVO guestVO, @RequestParam("me_img") MultipartFile file, RedirectAttributes redirectAttributes){
      surveyService.addGuest(guestVO, file);
      return "redirect:/survey";
    }

}
