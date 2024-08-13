package com.en.main.mapper;

import com.en.main.dto.MessageVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {
        @Insert("insert into message values (#{e_no}, #{m_id}, #{me_content}, #{me_img})")
        String saveFile(MessageVO messageVO);
    }
