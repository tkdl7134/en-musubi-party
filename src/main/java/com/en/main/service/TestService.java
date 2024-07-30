package com.en.main.service;

import com.en.main.dto.TestVO;
import com.en.main.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestService {

    @Autowired
    private TestMapper testMapper;


    public List<TestVO> getTests(){
        return testMapper.getTests();
    }


}
