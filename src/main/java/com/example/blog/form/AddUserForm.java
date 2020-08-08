package com.example.blog.form;

import lombok.Data;

@Data
public class AddUserForm {

    private String userId; // 学号
    private String userName; // 姓名
    private String password; // 密码
    private int sex; // 性别
    private int age; // 年龄
    private String major; // 专业
    private String instructorId; // 辅导员ID
    private String phone; // 电话号码
    private String email; // 邮箱
    private int identity; // 身份

}
