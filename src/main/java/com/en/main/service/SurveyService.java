package com.en.main.service;

import com.en.main.mapper.SurveyMapper;
import com.en.main.dto.GuestVO;
import org.springframework.stereotype.Service;

@Service
public class SurveyService {

    private SurveyMapper surveyMapper;

    public void addGuest(GuestVO guestVO) {
        surveyMapper.insertSurvey(guestVO);
    }
}
