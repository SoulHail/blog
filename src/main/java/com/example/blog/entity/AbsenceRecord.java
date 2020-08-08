package com.example.blog.entity;

import lombok.Data;

@Data
public class AbsenceRecord {

    private String uuid; // uuid
    private String userId; // 学号
    private String userName; // 姓名
    private String major; // 专业
    private String absenceDate; // 缺席日期
    private int absenceReason; // 缺席缘由（1：事假 2：旷到）
    private String absenceCount; // 缺席课数

}
