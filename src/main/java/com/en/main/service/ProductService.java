package com.en.main.service;

import com.en.main.dto.TemplateProductVO;
import com.en.main.dto.WeddingVO;
import com.en.main.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {

//    @Autowired
    private ProductMapper productMapper;

//    @Override
    public List<TemplateProductVO> getAllTemplates() {
        return productMapper.getAllTemplates();
    }

//    @Override
    public TemplateProductVO getTemplateByPk(int t_pk) {
        return productMapper.getTemplateByPk(t_pk);
    }


//    @Override
    @Transactional
    public void insertWeddingInfo(WeddingVO weddingVO, int t_pk, MultipartFile w_img1, MultipartFile w_img2, MultipartFile w_img3, MultipartFile[] w_img_share) {

        weddingVO.setW_img1(saveFile(w_img1));
        weddingVO.setW_img2(saveFile(w_img2));
        weddingVO.setW_img3(saveFile(w_img3));
        weddingVO.setW_img_share(saveMultipleFiles(w_img_share));

        productMapper.createEvent();
        productMapper.insertWeddingInfo(weddingVO, t_pk);
    }

    private String saveFile(MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
            String fileRealName = file.getOriginalFilename();
            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
            String uploadFolder = "src/main/resources/img";

            UUID uuid = UUID.randomUUID();
            String uniqueName = uuid.toString().split("-")[0];
            String savedFileName = uniqueName + fileExtension;
            File saveFile = new File(uploadFolder + "/" + savedFileName);

            file.transferTo(saveFile);
            return savedFileName;
            }catch (Exception e){
                e.printStackTrace();
            }
        } return null;
    }

    private String saveMultipleFiles(MultipartFile[] files) {
        if (files != null) {
            List<String> filePaths = new ArrayList<>();
            for (MultipartFile file : files) {
                if (!file.isEmpty()){
                    String filePath = saveFile(file);
                    if (filePath != null) {
                        filePaths.add(filePath);
                    }
                }
            } return String.join(",", filePaths);
        } return null;
    }

}
