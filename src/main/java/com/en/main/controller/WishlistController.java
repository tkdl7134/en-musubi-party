package com.en.main.controller;

import com.en.main.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WishlistController {

    @Autowired
    private WishlistService wishlistService;

    @GetMapping("/survey/{m_id}-{e_no}/create")
    public String wishlist(@PathVariable String m_id, @PathVariable int e_no, Model model) {

        System.out.println(m_id);
        System.out.println(e_no);
        String amazonUrl = wishlistService.getAmazonUrl(m_id, e_no);
        System.out.println("아마존 사이트:" + amazonUrl);

        model.addAttribute("amazonUrl", amazonUrl);

        // 이 부분에서 올바른 JSP 파일 이름을 반환해야 합니다.
        return "wishlist/wishlist";  // 여기서는 "wishlist/wishlist.jsp"를 의미합니다.    }
    }

    @GetMapping("/survey/{m_id}-{e_no}/amazon")
    public String getAmazon(@PathVariable String m_id, @PathVariable int e_no, Model model) {

        System.out.println(m_id);
        System.out.println(e_no);
        String amazonUrl = wishlistService.getAmazonUrl(m_id, e_no);
        System.out.println("아마존 사이트:" + amazonUrl);

        model.addAttribute("amazonUrl", amazonUrl);

        // 이 부분에서 올바른 JSP 파일 이름을 반환해야 합니다.
        return "wishlist/financeresult";
    }
}