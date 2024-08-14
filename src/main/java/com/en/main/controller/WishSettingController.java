package com.en.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishlist-setting")
@Controller
public class WishSettingController {

    @GetMapping
    public String wishlistSetting() {
        return "wishSetting/wishlist_setting";
    }
}
