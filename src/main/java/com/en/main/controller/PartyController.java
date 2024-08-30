package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.dto.PartyVO;
import com.en.main.service.PartyService;
import jakarta.servlet.http.HttpSession;
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

//    @GetMapping("/apply")
//    public String partyApply() {
//        return "/party/party_apply";
//    }
//
//    @GetMapping("/apply-done")
//    public String partyApplyDone() {
//        return "/party/party_apply_done";
//    }
////
//    @GetMapping("/chat")
//    public String partyChat() {
//        return "/party/party_chat";
//    }

    @GetMapping("")
    public String partyList(Model model, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("authenticatedMember");

        if (memberVO == null){
            return "redirect:/login";
        }
        String m_id = memberVO.getM_id();

        List<PartyVO> getPartyList =  partyService.getPartyList(m_id);
        model.addAttribute("partyList", getPartyList);
        return "/party/party_list";
    }

    @GetMapping("/info/{e_no}")
    public String partyInfo(@PathVariable int e_no, Model model) {
        System.out.println(e_no);
        List<PartyVO> partyMembers = partyService.getPartyMembers(e_no);

        // groom guest & woman guest percent graph
        long groomGuestCount = partyMembers.stream().filter(member -> "新郎ゲスト".equals(member.getG_guest_type())).count();
        long brideGuestCount = partyMembers.stream().filter(member -> "新婦ゲスト".equals(member.getG_guest_type())).count();
        long totalGuestCount = groomGuestCount + brideGuestCount;

        double groomGuestPercentage = totalGuestCount == 0 ? 0 : ((double) groomGuestCount / totalGuestCount) * 100;
        double brideGuestPercentage = totalGuestCount == 0 ? 0 : ((double) brideGuestCount / totalGuestCount) * 100;

        // man & woman percent graph
        long maleCount = partyMembers.stream().filter(member -> "男".equals(member.getM_gender())).count();
        long femaleCount = partyMembers.stream().filter(member -> "女".equals(member.getM_gender())).count();
        long totalCount = maleCount + femaleCount;

        double malePercentage = totalCount == 0 ? 0 : ((double) maleCount / totalCount) * 100;
        double femalePercentage = totalCount == 0 ? 0 : ((double) femaleCount / totalCount) * 100;

        // age graph calculate by birth
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

        model.addAttribute("groomGuestPercentage", groomGuestPercentage);
        model.addAttribute("brideGuestPercentage", brideGuestPercentage);

        model.addAttribute("malePercentage", malePercentage);
        model.addAttribute("femalePercentage", femalePercentage);

        model.addAttribute("ageDistribution", ageDistribution);

        return "/party/party_info";
    }

    @GetMapping("/main/{e_no}")
    public String partyMain(@PathVariable int e_no, Model model, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("authenticatedMember");

        if (memberVO == null) {
            return "redirect:/login";
        }

        String m_id = memberVO.getM_id();
        System.out.println(m_id);

        model.addAttribute("partyMembers", partyService.getPartyMembers(e_no));
        model.addAttribute("partyMyInfo", partyService.getPartyMyInfo(m_id));


        return "/party/party_main";
    }

    @ResponseBody
    @PostMapping("/main")
    public int partySelectedType(@RequestBody PartyVO partyVO, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("authenticatedMember");
        String m_id = memberVO.getM_id();
        System.out.println(m_id);
        partyVO.setM_id(m_id);

    return partyService.updateSelectedType(partyVO);
    }

    @ResponseBody
    @PostMapping("/main/type/{e_no}")
    public Map<String, Object> partySelectedTypeGroup(@PathVariable int e_no) {
        Map<String, List<Map<String, String>>> groupedTypes = partyService.getSimilarSelectedTypeGroups(e_no);
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
    public int partyFinalChoice(@RequestBody PartyVO partyVO, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("authenticatedMember");
        String m_id = memberVO.getM_id();
        System.out.println(m_id);
        partyVO.setM_id(m_id);
        return partyService.updateFinalChoice(partyVO);
    }


    @GetMapping("/main/choice/{e_no}")
    public String partyFinalChoiceBoth(@PathVariable int e_no, Model model, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("authenticatedMember");
        String my_id = memberVO.getM_id();

        Map<String, String> finalChoiceData = partyService.getFinalSelectedChoice(e_no);
        System.out.println("Final Choice Data: " + finalChoiceData);

        List<Map<String, String>> matchedCouples = new ArrayList<>();
        List<PartyVO> partyMembers = partyService.getPartyMembers(e_no);

        for (String m_id : finalChoiceData.keySet()) {
            // 사용자 m_id이 선택한 사람 목록
            String choicesStr = finalChoiceData.get(m_id);
            if (choicesStr == null) continue; // choicesStr이 null일 경우 건너뛰기

            // 선택한 사람 목록을 리스트로 변환
            List<String> choices = Arrays.asList(choicesStr.split(","));

            // 각 선택된 사람에 대해 매칭 확인
            for (String choice : choices) {
                // 선택된 사람의 선택 값
                String choiceStr = finalChoiceData.get(choice);
                if (choiceStr == null) continue; // choiceStr이 null일 경우 건너뛰기

                List<String> selectedByChoice = Arrays.asList(choiceStr.split(","));

                if (selectedByChoice.contains(m_id)) {
                    // 중복 방지
                    boolean alreadyMatched = matchedCouples.stream()
                            .anyMatch(couple -> (couple.get("user").equals(m_id) && couple.get("partner").equals(choice)) ||
                                    (couple.get("user").equals(choice) && couple.get("partner").equals(m_id)));

                    if (!alreadyMatched) {

                        if (m_id.equals(my_id)) {
                            Map<String, String> couple = new HashMap<>();
                            couple.put("user", m_id);
                            couple.put("partner", choice);

                            // m_id와 choice에 해당하는 m_fam_kanji와 m_name_kanji를 찾아서 추가
                            for (PartyVO member : partyMembers) {
                                if (member.getM_id().equals(m_id)) {
                                    couple.put("userFamKanji", member.getM_fam_kanji());
                                    couple.put("userNameKanji", member.getM_name_kanji());
                                }
                                if (member.getM_id().equals(choice)) {
                                    couple.put("partnerFamKanji", member.getM_fam_kanji());
                                    couple.put("partnerNameKanji", member.getM_name_kanji());
                                }
                            }

                            matchedCouples.add(couple);
                            System.out.println("*****Match found for: " + m_id + " with " + choice);
                        }
                    }
                }
            }
        }

        model.addAttribute("matchedCouples", matchedCouples);

        return "/party/party_choice";
    }

    @ResponseBody
    @PostMapping("/main/choice")
    public int partyExchangeLineID(@RequestBody PartyVO partyVO, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("authenticatedMember");
        String m_id = memberVO.getM_id();
        System.out.println(m_id);
        partyVO.setM_id(m_id);
        return partyService.updateLineID(partyVO);

    }

    @PutMapping("/main/choice/line")
    @ResponseBody
    public List<PartyVO> getPartnerLineID(@RequestBody Map<String, String> requestBody) {
        String partnerID = requestBody.get("partnerID");
        System.out.println(partnerID);
        return partyService.getPartnerLineID(partnerID);
    }


}

