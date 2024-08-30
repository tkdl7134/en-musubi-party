package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.service.MemberService;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Controller
public class MyInfoController {

    private Storage storage;

    @Autowired
    public MyInfoController(Storage storage) {
        this.storage = storage;
    }

    @Autowired
    MemberService memberService;

    @GetMapping("/myInfo")
    public String goTomyInfo(@RequestParam("m_id") String m_id, Model model) {
        MemberVO member = memberService.getMemberInfo(m_id);

        // 生年月日
        String memberBirth = member.getM_birth();

        String formattedDate = memberBirth.replace("-", "年") + "日";
        formattedDate = formattedDate.substring(0, 8) + "月" + formattedDate.substring(8);

        member.setM_birth(formattedDate);

        // ご住所
//        String memberAddr = member.getM_address();
//        int firstSpaceIndex = memberAddr.indexOf(" ");
//
//        String formatAddr = memberAddr.substring(0, firstSpaceIndex)
//                + memberAddr.substring(firstSpaceIndex + 1).replace(" ", "<br>");
//        member.setM_address(formatAddr);
//
//
//        member.setM_address(formatAddr);

        // 移動
        model.addAttribute("member", member);
        return "/mypage/myInfo";
    }


    @GetMapping("/myInfo-update")
    public String goTomyInfoUpdate(@RequestParam("m_id") String m_id, Model model) {
        MemberVO member = memberService.getMemberInfo(m_id);

        // 生年月日
        String memberBirth = member.getM_birth();

        String formattedDate = memberBirth.replace("-", "年") + "日";
        formattedDate = formattedDate.substring(0, 8) + "月" + formattedDate.substring(8);

        member.setM_birth(formattedDate);

        model.addAttribute("member", member);
        return "/mypage/myInfoUpdate";
    }


    @PostMapping("/myInfo-update")
    public String updateMemberInfo(@ModelAttribute MemberVO memberVO, @RequestParam("newProfile") MultipartFile newProfile, @RequestParam String oldProfile, Model model) {
        if (!newProfile.isEmpty()) {
            try {
                // 파일 확장자 추출
                String fileRealName = newProfile.getOriginalFilename();
                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));

                UUID uuid = UUID.randomUUID();
                String uniqueName = uuid.toString().split("-")[0];
                String savedFileName = uniqueName + fileExtension;

                String mimeType = newProfile.getContentType();
                storage.create(BlobInfo.newBuilder("enmusubi-8f0dc.appspot.com", "upload/" + savedFileName).setContentType(mimeType).build(),
                        newProfile.getBytes());

                memberVO.setM_img(savedFileName);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            memberVO.setM_img(oldProfile);
        }


        // 서비스 호출하여 멤버 정보 업데이트
        memberService.updateMemberInfo(memberVO);
        model.addAttribute("member", memberVO);

        return "redirect:/myInfo?m_id=" + memberVO.getM_id();  // 수정 후 myInfo 페이지로 이동
    }

    @GetMapping("myInfo-delete/{ID}")
    public String goTomyInfoDelete(@PathVariable("ID") String m_id, Model model, HttpSession session) {
        memberService.deleteMemberInfo(m_id);
        session.invalidate();
        return "/main/main";
    }
}
