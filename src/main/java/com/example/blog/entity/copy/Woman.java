package com.example.blog.entity.copy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Woman {
    private String name;
    private Date birth;
    private String sex;
    private String age;
}
