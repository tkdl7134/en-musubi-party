package com.en.main.controller;
import com.en.main.dto.GuestVO;
import com.en.main.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/survey")
@Controller
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @GetMapping
    public String addGuest(GuestVO guestVO){
      surveyService.addGuest(guestVO);
      return "redirect:/survey";
    }

}
