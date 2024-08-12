package com.en.main.service;

import com.en.main.dto.*;
import com.en.main.mapper.FileMapper;
import com.en.main.mapper.SurveyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
public class SurveyService {

    @Autowired
    private SurveyMapper surveyMapper;

    @Autowired
    private FileMapper fileMapper;

    private static final String UPLOAD_ImgDIRECTORY = "src/main/resources/img/";



    public void addGuest(MessageVO messageVO, GuestVO guestVO, AllergyVO allergyVO, MultipartFile file, List<CompanionVO> companions) {
        if (!file.isEmpty()) {
            uploadFile(messageVO, file);
            surveyMapper.insertGuest(guestVO);
            surveyMapper.insertAllergy(allergyVO);
            for (CompanionVO companion : companions) {
                surveyMapper.insertCompanions(companion);
            }
        }
    }

    public void uploadFile(MessageVO messageVO, MultipartFile file) {
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

    public MemberVO getMember(String m_id) {


        return surveyMapper.selectMemberInfo(m_id);
    }

    public MessageVO getMessage(int e_no) {

        return surveyMapper.selectMessageInfo(e_no);
    }

    public PartyVO getParty(int p_pk) {

        return surveyMapper.selectPartyInfo(p_pk);
    }

}

