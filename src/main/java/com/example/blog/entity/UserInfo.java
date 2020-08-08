package com.example.blog.entity;

import lombok.Data;

@Data
public class UserInfo {

    private String userId; // 学号
    private String userName; // 姓名
    private String major; // 专业
    private String instructorId; // 辅导员ID

}
