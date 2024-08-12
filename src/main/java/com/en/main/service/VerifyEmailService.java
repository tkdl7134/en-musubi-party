// 이메일 인증 코드 생성 및 이메일 발송

package com.en.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class VerifyEmailService {

    @Autowired
    private JavaMailSender emailSender;

    private Map<String, String> verificationCodes = new HashMap<>();

    // 인증 코드를 생성하여 이메일로 발송
    public boolean sendVerificationCode(String email) {
        String code = generateCode();
        verificationCodes.put(email, code);
        System.out.println(code);
        System.out.println(verificationCodes);
        // 이메일 발송 로직
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("이메일 인증 코드");
        message.setText("인증 코드는 " + code + " 입니다.");
        try {
            emailSender.send(message);
            System.out.println(11);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(22);
            return false;
        }
    }

    // 이메일과 인증 코드의 유효성을 검증
    public boolean verifyCode(String email, String code) {
        String storedCode = verificationCodes.get(email);
        return storedCode != null && storedCode.equals(code);
    }

    // 랜덤한 인증 코드 생성
    private String generateCode() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(1000000)); // 6자리 랜덤 코드
    }
}
