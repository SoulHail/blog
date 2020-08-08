package com.example.blog.form;

import lombok.Data;

@Data
public class UpdateForm {

    private String userId;
    private String password;
    private String userName;
    private String major;
    private int sex;
    private int age;
    private String phone;
    private String email;
}
