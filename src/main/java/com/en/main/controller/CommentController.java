package com.en.main.controller;

import com.en.main.dto.CommentVO;
import com.en.main.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.stream.events.Comment;
import java.util.List;
import java.util.Map;

@RequestMapping("/event-comment")
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @GetMapping
    public String getComment(Model model) {
     model.addAttribute("comment", commentService.getAllComment());
     return "comment";
    }

    @PostMapping
    public String insertComment(CommentVO commentVO) {
        commentService.insertComment(commentVO);
        return "redirect:event-comment";
    }

    @DeleteMapping("/{no}")
    @ResponseBody
    public String deleteComment(@PathVariable("no") int no) {
        commentService.deleteComment(no);
        return "success";

    }




}
