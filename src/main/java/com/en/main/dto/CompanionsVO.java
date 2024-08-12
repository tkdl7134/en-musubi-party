package com.en.main.dto;

import lombok.Data;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Data
public class CompanionsVO {
    private List<CompanionVO> companions = new ArrayList<CompanionVO>();

}
