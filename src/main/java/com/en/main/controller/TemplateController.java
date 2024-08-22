package com.en.main.controller;

import com.en.main.dto.AllGuestVO;
import com.en.main.dto.WeddingVO;
import com.en.main.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/mypage")
@Controller
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    // 형우쿤
//    @GetMapping("/mytemplate")
//    public String mytemplate( Model model, WeddingVO weddingVO) {
//        List<WeddingVO> weddingList = templateService.getWedding();
//        model.addAttribute("weddingList", weddingList);
//
//
//        return "template/mytemplate";
//    }

    @GetMapping("/mytemplate/{m_id}")
    public String mytemplate(@PathVariable String m_id, Model model, WeddingVO weddingVO) {
        List<WeddingVO> weddingList = templateService.getWedding();
        List<WeddingVO> allWeddingList = templateService.getAllWedding(m_id);
        model.addAttribute("weddingList", weddingList);
        model.addAttribute("allWeddingList", allWeddingList);

        return "template/mytemplate";
    }




//    @GetMapping("/grouplist")
//    public String grouplist(Model model, AllGuestVO allGuestVO) {
//        List<AllGuestVO> allGuestList = templateService.getAllGuest();
//        model.addAttribute("allGuestList", allGuestList);
//
//
//        return "template/grouplist";
//    }

//    @GetMapping("/grouplist")
//    public String grouplist(Model model, WeddingVO weddingVO) {
//        List<WeddingVO> weddingList = templateService.getWedding();
//        model.addAttribute("weddingList", weddingList);
//        return "template/grouplist";
//    }
}
