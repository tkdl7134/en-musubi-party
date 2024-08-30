package com.en.main.service;

import com.en.main.dto.PartyVO;
import com.en.main.mapper.PartyMapper;
import org.apache.commons.text.similarity.LevenshteinDistance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PartyService implements PartyMapper {
    @Autowired
    private PartyMapper partyMapper;

    @Override
    public List<PartyVO> getPartyMembers(int e_no) {
        return partyMapper.getPartyMembers(e_no);
    }

    @Override
    public List<PartyVO> getPartyMyInfo(String m_id) {
        return partyMapper.getPartyMyInfo(m_id);
    }

    @Override
    public List<PartyVO> getPartyList(String m_id) {
        return partyMapper.getPartyList(m_id);
    }



    //  ------------------------------------------------  Type Grouping

    //    type 선택하면 문자열로 저장하고 유사도 검사
    @Override
    public int updateSelectedType(PartyVO partyVO) {
        return partyMapper.updateSelectedType(partyVO);
    }

    private static final int SIMILARITY_THRESHOLD = 10;

    private boolean similar(String type1, String type2) {
        if (type1 == null || type2 == null) {
            return false;  // 하나라도 null이면 유사하지 않다고 처리
        }

        LevenshteinDistance levenshteinDistance = new LevenshteinDistance();
        int distance = levenshteinDistance.apply(type1, type2);
        return distance <= SIMILARITY_THRESHOLD;
    }
    @Override
    public List<PartyVO> getSelectedType(int e_no) {
        return partyMapper.getSelectedType(e_no);
    }

    public Map<String, List<Map<String, String>>> getSimilarSelectedTypeGroups(int e_no) {
        List<PartyVO> selectedTypes = getSelectedType(e_no);
        Map<String, List<Map<String, String>>> groupedTypes = new HashMap<>();

        for (PartyVO party : selectedTypes) {
            boolean addedToGroup = false;
            String currentType = party.getEp_selectedType();

            if (currentType == null) {
                continue;  // null 값이 들어오면 무시하고 다음으로 진행
            }

            for (String key : groupedTypes.keySet()) {
                if (similar(currentType, key)) {
                    List<Map<String, String>> group = groupedTypes.get(key);
                    Map<String, String> map = new HashMap<>();
                    map.put("m_id", party.getM_id());
                    map.put("ep_selectedType", currentType);
                    group.add(map);
                    addedToGroup = true;
                    break;
                }
            }

            if (!addedToGroup) {
                List<Map<String, String>> newGroup = new ArrayList<>();
                Map<String, String> map = new HashMap<>();
                map.put("m_id", party.getM_id());
                map.put("ep_selectedType", currentType);
                newGroup.add(map);
                groupedTypes.put(currentType, newGroup);
            }
        }

        return groupedTypes;
    }


    //  ------------------------------------------------  final choice
    // 최종선택 고르기
    @Override
    public int updateFinalChoice(PartyVO partyVO) {
        return partyMapper.updateFinalChoice(partyVO);
    }

    @Override
    public List<PartyVO> getFinalChoice(int e_no) {
        return partyMapper.getFinalChoice(e_no);
    }

    public Map<String, String> getFinalSelectedChoice(int e_no) {
        List<PartyVO> selectedChoices = getFinalChoice(e_no);
        Map<String, String> finalChoiceBoth = new HashMap<>();

        for (PartyVO choice : selectedChoices) {
            String m_id = choice.getM_id();
            String ep_finalChoice = choice.getEp_finalChoice();
            finalChoiceBoth.put(m_id, ep_finalChoice);
        }
        return finalChoiceBoth;
    }

    // 내 LineID 저장
    @Override
    public int updateLineID(PartyVO partyVO) {
        return partyMapper.updateLineID(partyVO);
    }



    // 상대방의 LineID 가져오기
    @Override
    public List<PartyVO> getPartnerLineID(String partnerID) {
        return partyMapper.getPartnerLineID(partnerID);
    }
}
