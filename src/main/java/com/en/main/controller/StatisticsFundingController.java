package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/statistics")
@Controller
public class StatisticsFundingController {

    @GetMapping("/funding")
    public String goStatisticsFundingPage(){


        return "statistics/statisticsFunding";
    }


}
