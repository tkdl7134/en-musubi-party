package com.en.main.service;

import com.en.main.dto.CommentVO;
import com.en.main.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService implements CommentMapper {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<CommentVO> getAllComment(int e_no) {
        return commentMapper.getAllComment(e_no);
    }

    @Override
    public void insertComment(CommentVO commentVO) {
        commentMapper.insertComment(commentVO);
    }

    @Override
    public int deleteComment(int no) {
        return commentMapper.deleteComment(no);
    }


}
