// 이메일 인증과 관련된 API요청 처리

package com.en.main.controller;

import com.en.main.dto.VerifyEmailVO;
import com.en.main.service.VerifyEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/verify-email")
public class VerifyEmailController {

    @Autowired
    private VerifyEmailService verifyEmailService;

    @PostMapping("/send-code")
    public String sendVerificationCode(@RequestParam("email") String email) {
        System.out.println("==============");
        System.out.println(email);
        System.out.println("==============");

        boolean result = verifyEmailService.sendVerificationCode(email);
        if (result) {
            return "Verification code sent successfully.";
        } else {
            return "Failed to send verification code.";
        }
    }


    @PostMapping("/verify-code")
    public String verifyCode(@RequestParam String email, @RequestParam String code) {

        System.out.println(33);
        boolean isValid = verifyEmailService.verifyCode(email, code);
        if (isValid) {
            return "Verification code verified successfully.";
        } else {
            return "Invalid verification code.";
        }
    }
}
