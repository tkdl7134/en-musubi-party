package com.en.main.dto;

import lombok.Data;

import java.util.Date;
@Data
public class PayVo {

    private int e_no;
    private String m_id;
    private String p_type;
    private int p_price;
    private Date p_date;
    private int wl_no;
    private int total_price;
}
