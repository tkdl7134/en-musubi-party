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
    private String googleMapApiKey;
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
                                   @RequestParam MultipartFile w_img1_file,
                                   @RequestParam MultipartFile w_img2_file, @RequestParam MultipartFile w_img3_file,
                                   @RequestParam MultipartFile[] w_img_share_files,
                                   Model model) {
        productService.insertWeddingInfo(weddingVO, w_img1_file, w_img2_file, w_img3_file, w_img_share_files);
        System.out.println(weddingVO.getE_no());

        return "redirect:/product/invitation-preview/"+weddingVO.getE_no();
    }

    @GetMapping("/invitation-preview/{e_no}")
    public String getWeddingInfo(Model model, @PathVariable int e_no, WeddingVO weddingVO) {
        model.addAttribute("weddingInfo", productService.getWeddingInfo(e_no));
        String str = productService.getWeddingInfo(e_no).getW_img_share();
        String[] list = str.split(",");
        String viewImg = list[0];
        model.addAttribute("viewImg", viewImg);
        model.addAttribute("ShareImg", list);
        model.addAttribute("googleMapApiKey", googleMapApiKey);
        return "product/invitation_preview";
    }




}
