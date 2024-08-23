package com.en.main.dto;

import lombok.Data;

@Data
public class WishlistVO {
   private int wl_no;
    private String wl_product;
    private int wl_price;
    private int e_no;
    private int payed;
    private int percent;
}
