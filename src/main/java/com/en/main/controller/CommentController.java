package com.en.main.controller;

import com.en.main.dto.CommentVO;
import com.en.main.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/event-comment")
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @GetMapping("/{e_no}")
    public String getComment(Model model, @PathVariable int e_no) {
        System.out.println("--------------------");
        System.out.println(e_no);
     model.addAttribute("comment", commentService.getAllComment(e_no));
     model.addAttribute("e_no", e_no);
     return "comment";
    }

    @PostMapping("/{e_no}")
    public String insertComment(CommentVO commentVO, @PathVariable int e_no) {
        commentVO.setE_no(e_no);
        commentService.insertComment(commentVO);
        return "redirect:/event-comment/" + e_no;
    }

    @DeleteMapping("/{no}")
    @ResponseBody
    public String deleteComment(@PathVariable("no") int no) {
        commentService.deleteComment(no);
        return "success";

    }




}
