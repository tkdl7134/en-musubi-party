package com.en.main.dto;

import lombok.Data;

import java.util.Date;

@Data
public class CommentVO {
    private int c_no;
    private int e_no;
    private String c_writer;
    private String c_content;
    private Date c_date;
    private String c_type;
}
