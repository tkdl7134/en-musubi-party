package com.en.main.controller;

import com.en.main.dto.WeddingVO;
import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/mypage")
@Controller
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    @GetMapping("/mytemplate")
    public String mytemplate(Model model, WeddingVO weddingVO) {
        List<WeddingVO> weddingList = templateService.getWedding();
        model.addAttribute("weddingList", weddingList);


        return "template/mytemplate";
    }

    @GetMapping("/grouplist")
    public String grouplist(Model model, WeddingVO weddingVO) {
        List<WeddingVO> weddingList = templateService.getWedding();
        model.addAttribute("weddingList", weddingList);
        return "template/grouplist";
    }
}
