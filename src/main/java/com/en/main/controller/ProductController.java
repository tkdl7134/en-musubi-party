package com.en.main.controller;

import com.en.main.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String preview(Model model) {

        return "product/product-preview";
    }
}
