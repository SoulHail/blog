package com.example.blog.entity;

import lombok.Data;

@Data
public class WetherLeave {

    private String userId; // 学号
    private String startTime; // 开始时间
    private String endTime; // 结束时间

}
