package com.en.main.dto;

import lombok.Data;


import java.util.Date;
import java.util.List;

@Data
public class PartyVO {
    private int e_no;
    private String m_id;
    private String ep_type;
    private String m_name_kanji;
    private String m_gender;
    private String m_phone;
    private String m_birth;
    private String ep_selectedType;
    private String ep_finalChoice;


}
