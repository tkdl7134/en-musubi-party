package com.en.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${app.domain}")
    private String domain;

    public void sendMail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        mailSender.send(message);
    }

    public void sendResetPWMail(String to, String token) {
        String resetLink = domain + "/member/resetPW/" + token;
        String text = "다음 링크를 클릭하여 비밀번호를 재설정하세요: " + resetLink;
        sendMail(to, "비밀번호 재설정", text);
    }

}
