package com.en.main.service;

import com.en.main.dto.WeddingVO;
import com.en.main.mapper.TemplateMapper;
import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TemplateService implements TemplateMapper{
    @Autowired
    private TemplateMapper templateMapper;
//
//    @Override
//    public List<WeddingVO> getTemplate(){
//        public List<WeddingVO> getWeddingVOS(int e_no) {
//            return templateMapper.getWedding(m_id, e_no);
//        }
//    }

}
