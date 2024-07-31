package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/statistics")
@Controller
public class StatisticsController {

    @GetMapping("/funding")
    public String goStatisticsFundingPage(){


        return "statistics/statisticsFunding";
    }

    @GetMapping("/send")
    public String goStatisticsSendPage(){


        return "statistics/statisticsSend";
    }

    @GetMapping("/getWishlstData")
    public @ResponseBody String getWishlistData(){


        return "";

    }






}
