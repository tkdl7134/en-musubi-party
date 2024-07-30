package com.en.main.service;

<<<<<<< HEAD
import com.en.main.mapper.SurveyMapper;
import com.en.main.dto.GuestVO;
=======
import com.en.main.dto.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 21733f60d80029aed62b27448d2c71ba775a8354
import org.springframework.stereotype.Service;

@Service
public class SurveyService {

    private SurveyMapper surveyMapper;

    public void addGuest(GuestVO guestVO) {
        surveyMapper.insertSurvey(guestVO);
    }
}
