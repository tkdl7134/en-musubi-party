package com.en.main.service;

import com.en.main.dto.TemplateProductVO;
import com.en.main.dto.WeddingVO;
import com.en.main.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Qualifier("forceAutoProxyCreatorToUseClassProxying")
    @Autowired
    private BeanFactoryPostProcessor forceAutoProxyCreatorToUseClassProxying;

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
public void insertWeddingInfo(WeddingVO weddingVO,
                              MultipartFile w_img1_file, MultipartFile w_img2_file, MultipartFile w_img3_file,
                              MultipartFile[] w_img_share_files) {
    productMapper.createEvent();
    int eventNo = productMapper.getCurrentEventNo();
    weddingVO.setE_no(eventNo);
    String hello = weddingVO.getW_message_invite();
    String bye = weddingVO.getW_message_bye();
    weddingVO.setW_message_invite(hello.replaceAll("\r\n", "<br/>"));
    weddingVO.setW_message_bye(bye.replaceAll("\r\n", "<br/>"));

    for(MultipartFile w_img : w_img_share_files) {
    System.out.println("test -----" + w_img.getOriginalFilename());

    }
    try {

        String img1 =  saveFile(w_img1_file);
        String img2 =  saveFile(w_img2_file);
        String img3 =  saveFile(w_img3_file);
        String imgShare = saveMultipleFiles(w_img_share_files);

        weddingVO.setW_img1(img1);
        weddingVO.setW_img2(img2);
        weddingVO.setW_img3(img3);
        weddingVO.setW_img_share(imgShare);
        System.out.println(weddingVO);
        System.out.println(imgShare);
        productMapper.insertWeddingInfo(weddingVO);

        } catch (Exception e){
            e.printStackTrace();
            System.out.println("파일 저장 중 오류");
    }
}

    private String saveFile(MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                String fileRealName = file.getOriginalFilename();
                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
//                String uploadFolder = "Users/se_ong/Desktop/sbt9/uploadTest";
                String uploadFolder = new File("src/main/resources/static/img/").getAbsolutePath();

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

    private String saveMultipleFiles(MultipartFile[] files){
        StringBuilder savedFileNames = new StringBuilder();

        if (files != null && files.length > 0) {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    try {
                        String savedFileName = saveFile(file);
                        if (savedFileName != null) {
                            if (savedFileNames.length() > 0) {
                                savedFileNames.append(",");
                            }
                            savedFileNames.append(savedFileName);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        return savedFileNames.toString();
    }


    public WeddingVO getWeddingInfo(int e_no) {
        return productMapper.getWeddingInfo(e_no);
    }
}
