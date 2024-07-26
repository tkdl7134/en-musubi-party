package com.en.main.service;

import com.en.main.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TemplateService implements TemplateMapper{
    @Autowired
    private TemplateMapper templateMapper;

}
