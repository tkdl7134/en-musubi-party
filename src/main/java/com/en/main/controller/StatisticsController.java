package com.en.main.controller;

import com.en.main.dto.PayVo;
import com.en.main.dto.WishlistVO;
import com.en.main.service.StatisticsFundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/statistics")
@Controller
public class StatisticsController {
    @Autowired
   private StatisticsFundingService statisticsFundingService;

    @GetMapping("/funding")
    public String goStatisticsFundingPage(Model model , PayVo payVo){
        int eno = 5;
       model.addAttribute("wishlists" ,  statisticsFundingService.getWishlistData(eno));
        System.out.println(statisticsFundingService.getWishlistData(eno));
        model.addAttribute("dates" , statisticsFundingService.getDate(eno));
        System.out.println(statisticsFundingService.getDate(eno));
    List<WishlistVO> wishlist = statisticsFundingService.getWishlistData(eno);
        WishlistVO firstItem = wishlist.get(0);
        int firstWlNo = firstItem.getWl_no();
        int firstWlPrice = firstItem.getWl_price();
       model.addAttribute("payPrice" ,statisticsFundingService.getPrices(payVo , firstWlNo) ) ;

        return "statistics/statisticsFunding";
    }

    @GetMapping("/send")
    public String goStatisticsSendPage(){

        return "statistics/statisticsSend";
    }

    @GetMapping("/getProductPrice/{no}")
    public @ResponseBody int getProductPrice(PayVo payVo, @PathVariable int no){
        System.out.println(no);
        System.out.println(statisticsFundingService.getPrices(payVo , no));
        return statisticsFundingService.getPrices(payVo , no);

    }





}
