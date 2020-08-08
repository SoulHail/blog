package com.example.blog.entity;

import lombok.Data;

@Data
public class User {

    private String userId;
    private String userName;
    private String password;
    private String major;
    private String instructorId;
    private int role;
}
