package com.en.main.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GuestVO {
    private int e_no;
    private String m_id;
    private String g_attend_wedding;
    private String g_attend_afterParty;
    private String g_guest_type;
    private String g_allergy_or;
    private String g_allergy;
    private String g_relation;
    private String g_relation_detail;
}
