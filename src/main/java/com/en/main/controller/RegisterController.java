package com.en.main.controller;

import com.en.main.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

@Controller
public class RegisterController {

    @Autowired
    private MemberService memberService;

//    @GetMapping("/register")
//    public String goToRegister() {
//        return "register/register";
//    }

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
}
