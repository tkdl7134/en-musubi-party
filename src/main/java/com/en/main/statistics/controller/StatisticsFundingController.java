package com.en.main.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsFundingController {

    @GetMapping("/s")
    public String goStatisticsFundingPage(){


        return "statistics/statisticsFunding";
    }


}
