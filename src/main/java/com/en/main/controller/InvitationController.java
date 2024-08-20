package com.en.main.controller;

import com.en.main.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/invitation")
@Controller
public class InvitationController {

    @Autowired
    private String googleMapApiKey;
    @Autowired
    private ProductService productService;

    @GetMapping
    public String invitation(Model model) {
        int e_no = 215;
        model.addAttribute("weddingInfo", productService.getWeddingInfo(e_no));
        String str = productService.getWeddingInfo(e_no).getW_img_share();
        String[] list = str.split(",");
        for (int i = 0; i < list.length; i++) {
            System.out.println("------");
        System.out.println(list[i]);

        }
        String viewImg = list[0];
        model.addAttribute("viewImg", viewImg);
        model.addAttribute("ShareImg", list);
        model.addAttribute("googleMapApiKey", googleMapApiKey);
        return "invitation/invitation";
    }
}
