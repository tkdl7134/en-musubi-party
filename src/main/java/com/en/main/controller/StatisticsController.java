package com.en.main.controller;

import com.en.main.dto.JhFundSqlVo;
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

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RequestMapping("/statistics")
@Controller
public class StatisticsController {
    @Autowired
   private StatisticsFundingService statisticsFundingService;

    @GetMapping("/funding")
    public String goStatisticsFundingPage(Model model , PayVo payVo , JhFundSqlVo jhFundSqlVo){
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
    model.addAttribute("NumberOfPeople" , statisticsFundingService.getNumberOfPeople(eno));
        System.out.println(statisticsFundingService.getNumberOfPeople(eno));

        DecimalFormat formatter = new DecimalFormat("#,###");
    String formattedNumber = formatter.format(statisticsFundingService.getHighestPrice(eno));

        model.addAttribute("highestPrice" , formattedNumber);

        String PopulestDate = statisticsFundingService.getPopulatedDate(eno);
        System.out.println(PopulestDate);
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.parse(PopulestDate, inputFormatter);

        // 날짜 부분만 추출하기 위한 포맷터
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy年-MM月-dd日");
        String formattedDate = dateTime.format(outputFormatter);
        System.out.println(formattedDate);
        model.addAttribute("PopularDate" , formattedDate);

        model.addAttribute("PopularWishlist" ,     statisticsFundingService.getPopularWishlist(eno));


        model.addAttribute("listupDatas" , statisticsFundingService.getListupInfos(eno));
        System.out.println(statisticsFundingService.getListupInfos(eno));


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

    @GetMapping("/reorderByProduct/{no}")
    public @ResponseBody List<JhFundSqlVo> reorderByProduct(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("listupDatas" , statisticsFundingService.getListupInfos(no));

        return statisticsFundingService.getListupInfos(no);
    }

@GetMapping("/reorderByMoney/{no}")
public @ResponseBody List<JhFundSqlVo> reorderByMoney(@PathVariable int no , Model model){
    System.out.println(no);
    model.addAttribute("listupDatas" , statisticsFundingService.reorderListByMoney(no));

    return statisticsFundingService.reorderListByMoney(no);
}
@GetMapping("/reorderByDate/{no}")
public @ResponseBody List<JhFundSqlVo> reorderByDate(@PathVariable int no , Model model){
    System.out.println(no);
    model.addAttribute("listupDatas" , statisticsFundingService.reorderListByDate(no));

    return statisticsFundingService.reorderListByDate(no);
}



}
