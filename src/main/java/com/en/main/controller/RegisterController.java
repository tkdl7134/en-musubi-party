package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

@Controller
public class RegisterController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/check-id")
    public @ResponseBody String checkID(@RequestParam("ID") String ID) {

        System.out.println(ID);

        boolean isAvailable = memberService.isIDAvailable(ID);
        if (isAvailable) {
            return "사용 가능한 아이디입니다.";
        } else {
            return "이미 사용 중인 아이디입니다.";
        }
    }

    @PostMapping("/register/submit")
    public @ResponseBody String register(@RequestBody MemberVO memberVO) {
        System.out.println(memberVO);
        memberService.registerMember(memberVO);

        return "登録成功";
    }

}
