package com.example.blog.vo;

import lombok.Data;

@Data
public class AllUserInfoVo {

    private String userId; // 学号
    private String password; // 密码
    private String userName; // 姓名
    private String sex; // 性别
    private String age; // 年龄
    private String major; // 专业
    private String phone; // 电话
    private String email; // 邮箱

}
