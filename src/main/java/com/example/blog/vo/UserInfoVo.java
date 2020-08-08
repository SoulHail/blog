package com.example.blog.vo;

import lombok.Data;

@Data
public class UserInfoVo {

    private String userId; //学号
    private String userName; //姓名
    private String passWord; //密码
    private String major; //专业
    /*private String identity; //身份*/
    private String role; //身份

}
