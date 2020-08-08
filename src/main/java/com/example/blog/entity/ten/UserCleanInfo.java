package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserCleanInfo {

    private String inMno; // 商编
    private String idCard; // 身份证
    private String userStatus; // 商户状态
    private String hlsStatus; // 欢乐送状态
    private String optSource; // 操作来源
    private String optTime; // 操作时间
    private String operator; // 操作人
}
