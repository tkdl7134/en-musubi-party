package com.en.main.service;

import com.en.main.dto.PartyVO;
import com.en.main.mapper.PartyMapper;
import org.apache.commons.text.similarity.LevenshteinDistance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class PartyService implements PartyMapper {
    @Autowired
    private PartyMapper partyMapper;

    private static final int SIMILARITY_THRESHOLD = 10;

    @Override
    public List<PartyVO> getPartyMembers() {
        return partyMapper.getPartyMembers();
    }

    @Override
    public List<PartyVO> getPartyMyInfo() {
        return partyMapper.getPartyMyInfo();
    }

    @Override
    public List<PartyVO> getSelectedType() {
        return partyMapper.getSelectedType();
    }

    @Override
    public List<PartyVO> getFinalChoice() {
        return partyMapper.getFinalChoice();
    }

    @Override
    public int updateSelectedType(PartyVO partyVO) {
        return partyMapper.updateSelectedType(partyVO);
    }

    @Override
    public int updateFinalChoice(PartyVO partyVO) {
        return partyMapper.updateFinalChoice(partyVO);
    }

    @Override
    public int updateLineID(PartyVO partyVO) {
        return partyMapper.updateLineID(partyVO);
    }


    private boolean similar(String type1, String type2) {
        if (type1 == null || type2 == null) {
            return false;  // 하나라도 null이면 유사하지 않다고 처리
        }

        LevenshteinDistance levenshteinDistance = new LevenshteinDistance();
        int distance = levenshteinDistance.apply(type1, type2);
        return distance <= SIMILARITY_THRESHOLD;
    }

    public Map<String, List<Map<String, String>>> getSimilarSelectedTypeGroups() {
        List<PartyVO> selectedTypes = getSelectedType();
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

    public Map<String, String> getFinalSelectedChoice() {
        List<PartyVO> selectedChoices = getFinalChoice();
        Map<String, String> finalChoiceBoth = new HashMap<>();

        for (PartyVO choice : selectedChoices) {
            String m_id = choice.getM_id();
            String ep_finalChoice = choice.getEp_finalChoice();
            finalChoiceBoth.put(m_id, ep_finalChoice);
        }
        return finalChoiceBoth;
    }

    @Override
    public List<PartyVO>  getPartnerLineID() {
        return partyMapper.getPartnerLineID();
    }
}
