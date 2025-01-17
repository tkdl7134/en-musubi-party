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

    public void updateMemberInfo(MemberVO memberVO) {
        surveyMapper.updateMember(memberVO);
    }

    @Transactional
    public void addAll(GuestVO guestVO, AllergyVO allergyVO, List<CompanionVO> companions) {
        try {
            // Guest를 먼저 삽입
            surveyMapper.insertGuest(guestVO);

            // 알레르기 정보 삽입
            surveyMapper.insertAllergy(allergyVO);

            // 동반자 정보 삽입
            for (CompanionVO companion : companions) {
                surveyMapper.insertCompanions(companion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addGuest(GuestVO guestVO) {
        guestVO.setG_allergy_or("No");
        surveyMapper.insertGuest(guestVO);
    }

    public void addGuestNAllergy(GuestVO guestVO, AllergyVO allergyVO) {
            // Guest를 먼저 삽입
            surveyMapper.insertGuest(guestVO);

            // 알레르기 정보 삽입
            surveyMapper.insertAllergy(allergyVO);

    }

    public void addMessage(MessageVO messageVO, MultipartFile file) {

        try {
            surveyMapper.insertMessage(messageVO);
            if (!file.isEmpty()) {
                String img = uploadFile(messageVO, file);
                messageVO.setMe_img(img);
            }

        } catch (Exception e) {
            e.printStackTrace();

            throw new RuntimeException(("Error during addGuest process"));
        }
    }

    public void addCompanion(List<CompanionVO> companions) {
        // 동반자 정보 삽입
        for (CompanionVO companion : companions) {
            surveyMapper.insertCompanions(companion);
        }    }

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
            throw new RuntimeException("File upload failed", e);
        }
}
    public MemberVO getMember(String m_id) {

        return surveyMapper.selectMemberInfo(m_id);
    }

    public EventVO getEvent(int e_no) {

        return surveyMapper.selectEventInfo(e_no);
    }

    public PartyVO getParty(int p_pk) {

        return surveyMapper.selectPartyInfo(p_pk);
    }

}

