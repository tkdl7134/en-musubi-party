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

    public List<WeddingVO> getAllWedding(String m_id) {
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
        return templateMapper.getAllGuest(m_id);  // g_attend_wedding이 'ご出席'인 데이터만 반환
    }


//    public String getAttendAfterParty(String m_id, int eno) {
//        List<String> results = templateMapper.getAttendAfterParty(m_id, eno);
//
//        if (results.size() > 1) {
//            System.err.println("Multiple results found for m_id: " + m_id + " and e_no: " + eno);
//            return results.get(0);
//        } else if (results.size() == 1) {
//            return results.get(0);
//        } else {
//            return null;
//        }
//    }


    public GuestDetailVO getEventDetailByEventNo(int e_no) {
        try {
            return templateMapper.getEventDetailByEventNo(e_no);
        } catch (MyBatisSystemException e) {
            System.err.println("Error retrieving event details: " + e.getMessage());
            return null;
        }
    }

}




