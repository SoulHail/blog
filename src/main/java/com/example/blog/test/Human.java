package com.example.blog.test;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "human")
public class Human {
    private String name;
    private String sex;
    private int age;
}
