package com.en.main.service;

import com.en.main.dto.*;
import com.en.main.mapper.TemplateMapper;
import org.mybatis.spring.MyBatisSystemException;
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

    public List<WeddingVO> getWedding(int eno) {
        return templateMapper.getWedding(eno);
    }

    public List<AttendVO> getAttend(int eno) {
        return templateMapper.getAttend(eno);
    }

    public List<GuestDetailVO> getGuestDetail(int eno) {
        return templateMapper.getGuestDetail(eno);
    }

    public List<AllGuestVO> getAllGuest(String m_id) {
        return templateMapper.getAllGuest(m_id);
    }

    public String getAttendAfterParty(String m_id, int eno){
        return templateMapper.getAttendAfterParty(m_id, eno);
    }

    public MemberVO getEventOwnerName(int e_no, String m_id) {
        try {
            List<MemberVO> eventOwners = templateMapper.getEventOwnerName(e_no, m_id);
            if (eventOwners.isEmpty()) {
                System.out.println("Event owner not found for e_no: " + e_no + " and m_id: " + m_id);
                return null;
            }
            if (eventOwners.size() > 1) {
                System.out.println("Multiple event owners found for e_no: " + e_no + " and m_id: " + m_id);
                // 필요한 로직에 따라 적절한 처리를 추가
            }
            return eventOwners.get(0);
        } catch (MyBatisSystemException e) {
            System.err.println("Error retrieving event owner: " + e.getMessage());
            return null;
        }
    }


}
