package com.en.main.service;

import com.en.main.dto.*;
import com.en.main.mapper.FileMapper;
import com.en.main.mapper.SurveyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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


    @Transactional
    public void addGuest(MessageVO messageVO, GuestVO guestVO, AllergyVO allergyVO, MultipartFile file, List<CompanionVO> companions) {
        try {
            if (!file.isEmpty()) {
                uploadFile(messageVO, file);
                String img = uploadFile(messageVO, file);
                messageVO.setMe_img(img);
                } else {
                surveyMapper.insertMessage(messageVO);
            }
                surveyMapper.insertGuest(guestVO);
                surveyMapper.insertAllergy(allergyVO);
                for (CompanionVO companion : companions) {
                    surveyMapper.insertCompanions(companion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String uploadFile(MessageVO messageVO, MultipartFile file) {

        try {
        String fileRealName = file.getOriginalFilename();
        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
        String uniqueName = UUID.randomUUID().toString().replace("-", "") + fileExtension;

        File saveFile = new File(UPLOAD_ImgDIRECTORY + "\\" + uniqueName);
            file.transferTo(saveFile);
            messageVO.setMe_img(uniqueName);
            fileMapper.saveFile(messageVO);
            return uniqueName;
        } catch (Exception e) {
            e.printStackTrace();
        } return null;
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

