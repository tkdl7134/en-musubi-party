package com.en.main.controller;

import com.en.main.dto.JhFundSqlVo;
import com.en.main.dto.PayVo;
import com.en.main.dto.StatisticsSendVo;
import com.en.main.dto.WishlistVO;
import com.en.main.service.StatisticsFundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/statistics")
@Controller
public class StatisticsController {
    @Autowired
   private StatisticsFundingService statisticsFundingService;

    @GetMapping("/funding")
    public String goStatisticsFundingPage(Model model , PayVo payVo , JhFundSqlVo jhFundSqlVo , @RequestParam("e_no") int eno){
        /*int eno = 5;*/
       model.addAttribute("wishlists" ,  statisticsFundingService.getWishlistData(eno));
        System.out.println(statisticsFundingService.getWishlistData(eno));
        model.addAttribute("dates" , statisticsFundingService.getDate(eno));
        System.out.println(statisticsFundingService.getDate(eno));
    List<WishlistVO> wishlist = statisticsFundingService.getFundWishlistData(eno);

        System.out.println(wishlist);

        WishlistVO firstItem = wishlist.get(0);
        System.out.println(firstItem);

        int firstWlNo = firstItem.getWl_no();
        System.out.println(firstWlNo);
        String firstWl= firstItem.getWl_product();

        model.addAttribute("FirstWishlist" , firstWl);

       model.addAttribute("payPrice" ,statisticsFundingService.getPrices(firstWlNo , eno) ) ;
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


        System.out.println(statisticsFundingService.getSendInfos(eno));
        model.addAttribute("sendDatas" , statisticsFundingService.getSendInfos(eno));

        System.out.println(statisticsFundingService.getSendInfos(eno));
        model.addAttribute("SumPricesOfSend" , statisticsFundingService.getSendInfos(eno));
        System.out.println(statisticsFundingService.getPriceOrderByRelation(eno));
        model.addAttribute("SendPriceOrderByRelation" ,statisticsFundingService.getPriceOrderByRelation(eno) );

        model.addAttribute("SendNumberOfPeople" , statisticsFundingService.getSendNumberOfPeople(eno));
        System.out.println(statisticsFundingService.getSendNumberOfPeople(eno));

        String formattedNumber2 = formatter.format(statisticsFundingService.getSendHighestPrice(eno));

        model.addAttribute("SendHighestPrice" , formattedNumber2);
        System.out.println(statisticsFundingService.getSendHighestPrice(eno));

                String SendPopulestDate = statisticsFundingService.getSendPopulatedDate(eno);
        LocalDateTime SenddateTime = LocalDateTime.parse(SendPopulestDate, inputFormatter);
        model.addAttribute("SendPopularDate" , SenddateTime.format(outputFormatter));


        model.addAttribute("SendPopularRelation" , statisticsFundingService.getSendPopularRelation(eno));
        System.out.println(statisticsFundingService.getSendPopularRelation(eno));


        model.addAttribute("GuestTypeCount" , statisticsFundingService.getGuestTypeCount(eno));
        model.addAttribute("AttendCount" , statisticsFundingService.getAttendCount(eno));
        System.out.println(statisticsFundingService.getAttendCount(eno));
        return "statistics/statisticsFunding";
    }


        @GetMapping("/getProductPrice/{no}/{eno}")
    public @ResponseBody int getProductPrice( @PathVariable int no , @PathVariable int eno){
        System.out.println(no);
        System.out.println(statisticsFundingService.getPrices( no , eno));
        return statisticsFundingService.getPrices( no , eno);

    }

    @GetMapping("/reorderByProduct/{no}")
    public @ResponseBody List<JhFundSqlVo> reorderByProduct(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("listupDatas" , statisticsFundingService.getListupInfos(no));

        return statisticsFundingService.getListupInfos(no);
    }
    @GetMapping("/reorderSendByRelation/{no}")
    public @ResponseBody List<StatisticsSendVo> reorderSendByProduct(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("sendDatas" ,statisticsFundingService.getSendInfosByRelation(no));

        return statisticsFundingService.getSendInfosByRelation(no);
    }
    @GetMapping("/reorderSendByRelationDesc/{no}")
    public @ResponseBody List<StatisticsSendVo> reorderSendByProductDesc(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("sendDatas" ,statisticsFundingService.getSendInfosByRelationDesc(no));

        return statisticsFundingService.getSendInfosByRelationDesc(no);
    }
    @GetMapping("/reorderSendByMoney/{no}")
    public @ResponseBody List<StatisticsSendVo> reorderSendByMoney(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("sendDatas" ,statisticsFundingService.getSendInfosByRelation(no));
        return statisticsFundingService.getSendInfosByMoneyDesc(no);

    }
    @GetMapping("/reorderSendByMoneyDesc/{no}")
    public @ResponseBody List<StatisticsSendVo> reorderSendByMoneyDesc(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("sendDatas" ,statisticsFundingService.getSendInfosByRelationDesc(no));

        return statisticsFundingService.getSendInfosByMoney(no);
    }
    @GetMapping("/reorderSendByDate/{no}")
    public @ResponseBody List<StatisticsSendVo> reorderSendByDate(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("sendDatas" ,statisticsFundingService.getSendInfosByRelation(no));

        return statisticsFundingService.getSendInfosByDate(no);
    }
    @GetMapping("/reorderSendByDateDesc/{no}")
    public @ResponseBody List<StatisticsSendVo> reorderSendByDateDesc(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("sendDatas" ,statisticsFundingService.getSendInfosByRelationDesc(no));

        return statisticsFundingService.getSendInfosByDateDesc(no);
    }
    @GetMapping("/reorderByProductDesc/{no}")
    public @ResponseBody List<JhFundSqlVo> reorderByProductDesc(@PathVariable int no , Model model){
        System.out.println(no);
        model.addAttribute("listupDatas" , statisticsFundingService.getListupInfosDesc(no));

        return statisticsFundingService.getListupInfosDesc(no);
    }

@GetMapping("/reorderByMoney/{no}")
public @ResponseBody List<JhFundSqlVo> reorderByMoney(@PathVariable int no , Model model){
    System.out.println(no);
    model.addAttribute("listupDatas" , statisticsFundingService.reorderListByMoney(no));

    return statisticsFundingService.reorderListByMoney(no);
}
@GetMapping("/reorderByMoneyDesc/{no}")
public @ResponseBody List<JhFundSqlVo> reorderByMoneyDesc(@PathVariable int no , Model model){
    System.out.println(no);
    model.addAttribute("listupDatas" , statisticsFundingService.reorderListByMoneyDesc(no));

    return statisticsFundingService.reorderListByMoneyDesc(no);
}
@GetMapping("/reorderByDate/{no}")
public @ResponseBody List<JhFundSqlVo> reorderByDate(@PathVariable int no , Model model){
    System.out.println(no);
    model.addAttribute("listupDatas" , statisticsFundingService.reorderListByDate(no));

    return statisticsFundingService.reorderListByDate(no);
}
@GetMapping("/reorderByDateDesc/{no}")
public @ResponseBody List<JhFundSqlVo> reorderByDateDesc(@PathVariable int no , Model model){
    System.out.println(no);
    model.addAttribute("listupDatas" , statisticsFundingService.reorderListByDateDesc(no));

    return statisticsFundingService.reorderListByDateDesc(no);
}
@GetMapping("/getNewProductDetails/{Wlno}/{eno}")
    public @ResponseBody List getNewProductDetails (@PathVariable int Wlno , @PathVariable int eno){
    ArrayList productDataLists = new ArrayList() ;


    System.out.println(statisticsFundingService.getHighestPriceByWishlistNo(Wlno , eno));
    System.out.println(statisticsFundingService.getNumberOfPeopleByWishlistNo(Wlno , eno));
    System.out.println(statisticsFundingService.getPopularWishlistByWishlistNo(Wlno , eno));
    System.out.println(statisticsFundingService.getPopulatedDateByWishlistNo(Wlno , eno));

    productDataLists.add(statisticsFundingService.getHighestPriceByWishlistNo(Wlno , eno));
    productDataLists.add(statisticsFundingService.getNumberOfPeopleByWishlistNo(Wlno , eno));
    productDataLists.add(statisticsFundingService.getPopularWishlistByWishlistNo(Wlno , eno));
    productDataLists.add(statisticsFundingService.getPopulatedDateByWishlistNo(Wlno , eno));
    System.out.println(productDataLists);
    return productDataLists;

}


}
