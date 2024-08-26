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
                String text =         "パスワード再設定\n\n" +
                        "この度は　✿ 縁結び ✿　をご利用いただき、誠にありがとうございます！\n" +
                        "以下のリンクをご利用いただき、パスワードを再設定してください。\n\n\n" +
                        resetLink + "\n\n\n" +
                        "※ このリンクをお客様がリクエストされていない場合は、このメールを無視してください。\n\n" +
                        "縁結びチーム";
        sendMail(to, "「縁結び」　✿ パスワード再設定 ✿", text);
    }

}
