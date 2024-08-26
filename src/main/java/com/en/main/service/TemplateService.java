package com.en.main.service;

import com.en.main.dto.*;
import com.en.main.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TemplateService {

    @Autowired
    private TemplateMapper templateMapper;

    public List<WeddingVO> getAllWedding(String m_id){
        return templateMapper.getAllWedding(m_id);
    }

    public List<WeddingVO> getWedding(int eno) {
        return templateMapper.getWedding(eno);
    }

    public List<AttendVO> getAttend(int eno) {
        return templateMapper.getAttend(eno);
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
    public List<MemberVO> getEventOwnerNames(int e_no) {
        List<MemberVO> eventOwners = templateMapper.getEventOwnerNames(e_no);
        return eventOwners.stream()
                .distinct()
                .collect(Collectors.toList());
    }


}
