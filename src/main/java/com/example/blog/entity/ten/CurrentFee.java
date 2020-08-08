package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CurrentFee {

    private String inMno;
    private String debitRate;
    private String cardRate;
    private String qrRate;
    private String vipStatus;
    private String vipDueDate;
}
