package com.en.main.controller;

import com.en.main.dto.EventVO;
import com.en.main.dto.WishlistVO;
import com.en.main.service.WishSettingService;
import com.en.main.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/{e_no}/wishlist-setting")
@Controller
public class WishSettingController {

    @Autowired
    private WishSettingService wishSettingService;


//    WISHLIST 목록
    @GetMapping
    public String wishlistSetting(@PathVariable int e_no, Model model) {
        model.addAttribute("eventVO", wishSettingService.getAmazonLink(e_no));
        return "wishSetting/wishlist_setting";
    }

    @PutMapping
    public void amazonSetting(@PathVariable int e_no, @RequestBody EventVO eventVO){
        System.out.println(eventVO);
        wishSettingService.updateAmazonLink(e_no, eventVO);
    }

//    FUNDING 내 WISH 목록
    @GetMapping("/funding")
        public String fundingWish(@PathVariable int e_no, Model model){
        model.addAttribute("e_no", e_no);
        System.out.println(e_no);
            return "wishSetting/funding_setting";
        }

}
