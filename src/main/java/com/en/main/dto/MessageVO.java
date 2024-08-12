package com.en.main.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MessageVO {
    private int e_no;
    private String m_id;
    private String me_content;
    private String me_img;
}
