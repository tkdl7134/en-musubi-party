package com.en.main.controller;

import com.en.main.dto.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/register")
    public String goToRegister() {
        return "register/register";
    }

    @GetMapping("/login")
                            // 'Model' 객체는 컨트롤러에서 뷰로 데이터를 전달하는 데 사용됨
    public String goToLogin(Model model) {
                            // "memberVO"라는 이름으로 MemberVO 객체를 뷰에 전달
        model.addAttribute("memberVO", new MemberVO());
        return "login/login";
    }

}
