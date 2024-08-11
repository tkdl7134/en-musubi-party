package com.en.main.dto;

import lombok.Data;

<<<<<<< HEAD
import java.sql.Date;
import java.sql.Timestamp;
=======
import java.time.LocalDate;
import java.time.LocalDateTime;
>>>>>>> 07c8ec685fef094e321ccb0413ba90881816bda8

@Data
public class WeddingVO {

    private int e_no;
    private int t_pk;
    private String w_fam_jp_groom;
    private String w_name_jp_groom;
    private String w_fam_eng_groom;
    private String w_name_eng_groom;
    private String w_fam_jp_bride;
    private String w_name_jp_bride;
    private String w_fam_eng_bride;
    private String w_name_eng_bride;
    private String w_date;
    private String w_wedding_time;
    private String w_wedding_assemble;
<<<<<<< HEAD
    private int w_wedding_postcode;
=======
//    private LocalDate w_date;
//    private LocalDateTime w_wedding_time;
//    private LocalDateTime w_wedding_assemble;
    private String w_wedding_postcode;
    private String w_wedding_building;
>>>>>>> 07c8ec685fef094e321ccb0413ba90881816bda8
    private String w_wedding_address;
    private String w_wedding_building;
    private String w_reception_time;
    private String w_reception_assemble;
<<<<<<< HEAD
    private int w_reception_postcode;
=======
//    private LocalDateTime w_reception_time;
//    private LocalDateTime w_reception_assemble;
    private String w_reception_postcode;
    private String w_reception_building;
>>>>>>> 07c8ec685fef094e321ccb0413ba90881816bda8
    private String w_reception_address;
    private String w_reception_building;
    private String w_message_invite;
    private String w_message_bye;
    private String w_img1;
    private String w_img2;
    private String w_img3;
    private String w_img_share;
}
