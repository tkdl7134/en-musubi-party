package com.en.main.controller;

import com.en.main.dto.WishlistVO;
import com.en.main.service.StatisticsFundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/statistics")
@Controller
public class StatisticsController {
    @Autowired
   private StatisticsFundingService statisticsFundingService;

    @GetMapping("/funding")
    public String goStatisticsFundingPage(Model model){
        int eno = 5;
       model.addAttribute("wishlists" ,  statisticsFundingService.getWishlistData(eno));
        System.out.println(statisticsFundingService.getWishlistData(eno));

        return "statistics/statisticsFunding";
    }

    @GetMapping("/send")
    public String goStatisticsSendPage(){


        return "statistics/statisticsSend";
    }







}
