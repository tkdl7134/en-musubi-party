package com.en.main.mapper;

import com.en.main.dto.MessageVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {
        void saveFile(MessageVO messageVO);
    }
