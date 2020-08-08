package com.example.blog.form;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AttendErrorForm {

    private String userId; // 学号
    private String date; // 缺席日期
    private String absenceCount; // 缺席课数

}
