package com.en.main.dto;

import lombok.Data;

import java.util.Date;

@Data
public class StatisticsSendVo {

    private int p_price;
    private Date p_date;
    private String g_relation;
    private String g_relation_detail;
    private String m_fam_kanji;
    private String m_name_kanji;

}
