package com.en.main.service;

import com.en.main.dto.TemplateProductVO;
import com.en.main.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements ProductMapper {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<TemplateProductVO> getAllTemplates() {
        return productMapper.getAllTemplates();
    }

    @Override
    public TemplateProductVO getTemplateByPk(int t_pk) {
        return productMapper.getTemplateByPk(t_pk);
    }

}
