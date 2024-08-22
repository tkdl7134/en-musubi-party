package com.en.main.controller;

import com.en.main.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishlist")
@Controller
public class WishlistController {

    @Autowired
    private WishlistService wishlistService;

    @GetMapping()
    public String wishlist(Model model) {
        return "wishlist/wishlist";
    }
}