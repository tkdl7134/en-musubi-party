package com.en.main.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class partyAllergyVO {
    private int p_pk;
    private int e_no;
    private String m_id;
    private String allergy;
}
