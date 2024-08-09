package com.en.main.service;

import com.en.main.dto.PartyVO;
import com.en.main.mapper.PartyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PartyService implements PartyMapper {
    @Autowired
    private PartyMapper partyMapper;

    @Override
    public List<PartyVO> getPartyMembers() {
        return partyMapper.getPartyMembers();
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


}
