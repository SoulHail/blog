package com.example.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NewHandDomain {
    private String taskModul;
    private String taskName;
    private String couponType;
    private String couponId;
    private String taskCondition;
    private String taskPic;
    private String awrdDescribe;
    private String jumpType;
    private String jumpUrl;
    private String loopType;
    private String progress;
    private String startTime;
    private String endTime;
    private String logoPic;
    private String taskDescribe;
    private String taskPopupDescribe;
}
