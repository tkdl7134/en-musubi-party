package com.en.main.service;

import com.en.main.dto.*;
import com.en.main.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TemplateService {

    @Autowired
    private TemplateMapper templateMapper;

    public List<WeddingVO> getAllWedding(String m_id){
        return templateMapper.getAllWedding(m_id);
    }

    public List<WeddingVO> getWedding() {
        return templateMapper.getWedding();
    }

    public List<AttendVO> getAttend() {
        return templateMapper.getAttend();
    }

    public List<GuestDetailVO> getGuestDetail(int eno) {
        return  templateMapper.getGuestDetail(eno);
    }
    public List<AllGuestVO> getAllGuest(String m_id) {
        return templateMapper.getAllGuest(m_id);
    }
    public String getAttendAfterParty(String m_id, int eno){

        return templateMapper.getAttendAfterParty(m_id,eno);
    }



}
