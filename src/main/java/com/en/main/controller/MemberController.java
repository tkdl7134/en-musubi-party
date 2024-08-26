package com.en.main.controller;

import com.en.main.dto.MemberVO;
import com.en.main.service.MemberService;
import com.en.main.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private TokenService tokenService;

    @GetMapping("/member/findID")
    public String findIDForm() {
        return "member/findID";
    }

    @PostMapping("/member/findID")
    public String findID(String m_fam_eng, String m_email, Model model) {
        MemberVO member = memberService.findID(m_fam_eng, m_email);
        if (member != null) {
            model.addAttribute("memberID", member.getM_id());
        } else {
            model.addAttribute("error", "✖︎ 一致するIDがありません ✖︎");
        }
        return "member/findIDResult";
    }

    @GetMapping("/member/findPW")
    public String findPWForm() {
        return "member/findPW";
    }

    @PostMapping("/member/findPW")
    public String findPW(String m_id, String m_email, Model model) {
        boolean result = memberService.sendResetPWLink(m_id, m_email);
        if (result) {
            model.addAttribute("message", "<span style='color: #db2227;'>✿✿✿</span><br><span>パスワード再設定用のリンクが</span><br><span>メールで送信されました</span><br><span style='color: #db2227;'>✿✿✿</span>");
        } else {
            model.addAttribute("error", "✖︎ 一致するアカウントがありません ✖︎");
        }
        return "member/findPWResult";
    }

    @GetMapping("/member/resetPW/{token}")
    public String resetPWForm(@PathVariable String token, Model model) {
        System.out.println("success");
        boolean validToken = memberService.validateResetPWToken(token);
        if (!validToken) {
            model.addAttribute("error", "無効なトークンです");
            return "error"; // 유효하지 않거나 만료된 토큰을 처리할 오류 페이지
        }
        model.addAttribute("token", token);
        return "member/resetPW"; // 비밀번호 재설정 페이지
    }

    @PostMapping("/member/resetPW")
    public String resetPW(@RequestParam("token") String token, @RequestParam("newPW") String newPW, @RequestParam("confirmPW") String confirmPW, Model model) {
        if (!newPW.equals(confirmPW)) {
            model.addAttribute("error", "新しいパスワードが一致しません");
            model.addAttribute("token", token);
            return "member/resetPW";
        }

        boolean result = memberService.resetPW(token, newPW);
        if (result) {
            model.addAttribute("message", "パスワードが正常に再設定されました");
        } else {
            model.addAttribute("error", "パスワードの再設定に失敗しました");
        }
        return "member/resetPW";
    }


}
