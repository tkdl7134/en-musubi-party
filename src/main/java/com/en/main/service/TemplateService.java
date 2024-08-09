package com.en.main.service;

import com.en.main.dto.GuestVO;
import com.en.main.dto.WeddingVO;
import com.en.main.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TemplateService{
    @Autowired
    private TemplateMapper templateMapper;

    public List<WeddingVO> getWedding() {
        return templateMapper.getWedding();
    }

    public List<GuestVO> getGuest() {
        return templateMapper.getGuest();
    }

}
