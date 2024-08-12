package com.en.main.controller;

import com.en.main.dto.WeddingVO;
import com.en.main.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@RequestMapping("/product")
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String product(Model model) {
        System.out.println(productService.getAllTemplates());
        model.addAttribute("templates", productService.getAllTemplates());
        return "product/product";
    }

    @GetMapping("/{t_pk}")
    public String preview(@PathVariable int t_pk, Model model) {
        System.out.println(t_pk);
        model.addAttribute("oneTemplate", productService.getTemplateByPk(t_pk));
        return "product/product_preview";
    }

    @GetMapping("/{t_pk}/make")
    public String productMake(@PathVariable int t_pk ,Model model) {
        model.addAttribute("t_pk", t_pk);
        return "product/product_make";
    }

    @PostMapping("/invitation-preview")
    public String productCompleted(WeddingVO weddingVO,
                                   @RequestParam int e_no,
                                   @RequestParam MultipartFile w_img1_file,
                                   @RequestParam MultipartFile w_img2_file, @RequestParam MultipartFile w_img3_file,
                                   @RequestParam MultipartFile[] w_img_share_files) {
        productService.insertWeddingInfo(weddingVO, w_img1_file, w_img2_file, w_img3_file, w_img_share_files);
        productService.getInvitationInfo(e_no);
        return "product/invitation_preview";
    }


}
