package com.en.main.service;

import com.en.main.dto.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SurveyService {

    @Autowired
    private SurveyMapper surveyMapper;

    @Override
    public void insertSurvey(GuestVO guestVO) {
        surveyMapper.insertService(serviceVO);
    }

}
