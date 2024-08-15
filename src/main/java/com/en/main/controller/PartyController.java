package com.en.main.controller;

import com.en.main.dto.PartyVO;
import com.en.main.service.PartyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;
import java.util.*;


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

        Map<String, Integer> ageDistribution = new HashMap<>();
        ageDistribution.put("20代初め", 0);
        ageDistribution.put("20代半ば", 0);
        ageDistribution.put("20代後半", 0);
        ageDistribution.put("30代初め", 0);
        ageDistribution.put("30代半ば", 0);
        ageDistribution.put("30代後半", 0);

        LocalDate today = LocalDate.now();
        for (PartyVO member : partyMembers) {
            String birthDateStr = member.getM_birth();
            LocalDate birthDate = LocalDate.parse(birthDateStr);
            int age = Period.between(birthDate, today).getYears();

            if (age >= 20 && age <= 22) {
                ageDistribution.put("20代初め", ageDistribution.get("20代初め") + 1);
            } else if (age >= 23 && age <= 25) {
                ageDistribution.put("20代半ば", ageDistribution.get("20代半ば") + 1);
            } else if (age >= 26 && age <= 29) {
                ageDistribution.put("20代後半", ageDistribution.get("20代後半") + 1);
            } else if (age >= 30 && age <= 32) {
                ageDistribution.put("30代初め", ageDistribution.get("30代初め") + 1);
            } else if (age >= 33 && age <= 35) {
                ageDistribution.put("30代半ば", ageDistribution.get("30代半ば") + 1);
            } else if (age >= 36 && age <= 39) {
                ageDistribution.put("30代後半", ageDistribution.get("30代後半") + 1);
            }
        }

        model.addAttribute("partyMembers", partyMembers);
        model.addAttribute("malePercentage", malePercentage);
        model.addAttribute("femalePercentage", femalePercentage);

        model.addAttribute("ageDistribution", ageDistribution);

        return "/party/party_info";
    }

    @GetMapping("/main")
    public String partyMain(Model model) {

        model.addAttribute("partyMembers", partyService.getPartyMembers());
        model.addAttribute("partyMyInfo", partyService.getPartyMyInfo());

        return "/party/party_main";
    }

    @ResponseBody
    @PostMapping("/main")
    public int partySelectedType(@RequestBody PartyVO partyVO) {
    return partyService.updateSelectedType(partyVO);
    }

    @ResponseBody
    @PostMapping("/main/type")
    public Map<String, Object> partySelectedTypeGroup() {
        Map<String, List<Map<String, String>>> groupedTypes = partyService.getSimilarSelectedTypeGroups();
        String[] groupNames = {"A", "B", "C", "D", "E", "F", "G", "H"};

        Map<String, List<Map<String, String>>> namedGroupedTypes = new LinkedHashMap<>();

        int index = 0;
        for (Map.Entry<String, List<Map<String, String>>> entry : groupedTypes.entrySet()) {
            String groupName = (index < groupNames.length) ? groupNames[index] : "Other";
            namedGroupedTypes.put(groupName, entry.getValue());
            index++;
        }

        namedGroupedTypes.forEach((key, group) -> {
            System.out.println("Group " + key);
            group.forEach(map -> {
                System.out.println("\tm_id: " + map.get("m_id"));
                System.out.println("\tep_selectedType: " + map.get("ep_selectedType"));
            });
        });

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("groupedTypes", namedGroupedTypes);

        return response;

    }

    @ResponseBody
    @PutMapping("/main")
    public int partyFinalChoice(@RequestBody PartyVO partyVO) {
        return partyService.updateFinalChoice(partyVO);
    }

    @ResponseBody
    @PutMapping("/main/choice")
    public Map<String, String> partyFinalChoiceBoth() {
        Map<String, String> finalChoice = partyService.getFinalSelectedChoice();
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("finalChoice", finalChoice.toString());

        return response;

    }


}

