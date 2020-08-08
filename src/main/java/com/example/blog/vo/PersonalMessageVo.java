package com.example.blog.vo;

import lombok.Data;

@Data
public class PersonalMessageVo {
    private String userId; //学号
    private String userName; //姓名
    private int sex; //性别
    private String major; //专业
    private int age; //年龄
    private String phone; //电话号码
    private String email; //邮箱
}
