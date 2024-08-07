package com.en.main.controller;

import com.en.main.dto.WeddingVO;
import com.en.main.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

    @PostMapping("/{t_pk}/completed-ver")
    public String productCompleted(@PathVariable int t_pk, WeddingVO weddingVO, MultipartFile w_img1, MultipartFile w_img2, MultipartFile w_img3, MultipartFile[] w_img_share) {
//        productService.createEvent(m_id);
        productService.insertWeddingInfo(weddingVO, t_pk, w_img1, w_img2, w_img3, w_img_share);

        return "product/product_complete";
    }

}
