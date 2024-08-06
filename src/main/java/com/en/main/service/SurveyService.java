package com.en.main.service;

import com.en.main.dto.MessageVO;
import com.en.main.mapper.FileMapper;
import com.en.main.mapper.SurveyMapper;
import com.en.main.dto.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class SurveyService {

    @Autowired
    private SurveyMapper surveyMapper;

    @Autowired
    private FileMapper fileMapper;

    private static final String UPLOAD_ImgDIRECTORY = "src/main/resources/img/";

    public void addGuest(MessageVO messageVO ,GuestVO guestVO, MultipartFile file) {
        if (!file.isEmpty()) {
            uploadFile(messageVO, file);
        }
        surveyMapper.insertSurvey(guestVO);
    }

    private void uploadFile(MessageVO messageVO, MultipartFile file) {
        String fileRealName = file.getOriginalFilename();
        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
        String uniqueName = UUID.randomUUID().toString().replace("-", "") + fileExtension;

        File saveFile = new File(UPLOAD_ImgDIRECTORY + "\\" + uniqueName);

        try {
            file.transferTo(saveFile);
            messageVO.setMe_img(uniqueName);
            fileMapper.saveFile(messageVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    }

