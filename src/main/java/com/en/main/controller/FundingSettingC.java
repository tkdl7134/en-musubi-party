package com.en.main.controller;

import com.en.main.dto.WishlistVO;
import com.en.main.service.WishSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// @Controller + @ResponseBody => 이 안에 있는 매서드들은 forward == return을 사용할 수 없게 됨
// 비동기 작업할 때는 @RestController 사용
@RequestMapping("/{e_no}/wishlist-setting/funding")
@RestController
public class FundingSettingC {

    @Autowired
    private WishSettingService wishSettingService;

    @GetMapping("/all")
    public List<WishlistVO> allFundingWish(@PathVariable int e_no, Model model){
//        model.addAttribute("e_no", e_no);
        System.out.println("들어옴");
        return wishSettingService.allFundingWish(e_no);
    }

    @PostMapping
    public void insertFundingWish(@RequestBody WishlistVO wishlistVO){
        wishSettingService.insertFundingWish(wishlistVO);
    }

    @PutMapping("/{wl_no}")
    public int updateFundingWish(@PathVariable int wl_no, @RequestBody WishlistVO wishlistVO){
        return wishSettingService.updateFundingWish(wl_no, wishlistVO);
    }

    @DeleteMapping("/{wl_no}")
    public int deleteFundingWish(@PathVariable int wl_no){
        return wishSettingService.deleteFundingWish(wl_no);
    }
}
