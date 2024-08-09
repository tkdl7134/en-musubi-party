package com.en.main.controller;

import com.en.main.dto.PartyVO;
import com.en.main.service.PartyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/party")
@Controller
public class PartyController {

    @Autowired
    private PartyService partyService;

    @GetMapping("/apply")
    public String partyApply() {
        return "/party/party_apply";
    }

    @GetMapping("/apply-done")
    public String partyApplyDone() {
        return "/party/party_apply_done";
    }

    @GetMapping("/chat")
    public String partyChat() {
        return "/party/party_chat";
    }

    @GetMapping("/info")
    public String partyInfo(Model model) {

        List<PartyVO> partyMembers = partyService.getPartyMembers();
        long maleCount = partyMembers.stream().filter(member -> "男".equals(member.getM_gender())).count();
        long femaleCount = partyMembers.stream().filter(member -> "女".equals(member.getM_gender())).count();
        long totalCount = maleCount + femaleCount;

        double malePercentage = totalCount == 0 ? 0 : ((double) maleCount / totalCount) * 100;
        double femalePercentage = totalCount == 0 ? 0 : ((double) femaleCount / totalCount) * 100;


        model.addAttribute("partyMembers", partyMembers);
        model.addAttribute("malePercentage", malePercentage);
        model.addAttribute("femalePercentage", femalePercentage);

        return "/party/party_info";
    }

    @GetMapping("/main")
    public String partyMain() {
        return "/party/party_main";
    }

    @ResponseBody
    @PostMapping("/main")
    public int partySelectedType(@RequestBody PartyVO partyVO) {
        System.out.println(partyVO);
        return partyService.updateSelectedType(partyVO);
    }

    @ResponseBody
    @PutMapping("/main")
    public int partyFinalChoice(@RequestBody PartyVO partyVO) {
        System.out.println(partyVO);
        return partyService.updateFinalChoice(partyVO);
    }

}

