package com.example.blog.entity;

import lombok.Data;

@Data
public class LeaveInfo {

    private String uuid; // uuid
    private String userId; // 学号
    private String userName; // 姓名
    private String major; // 专业
    private String instructorId; // 辅导员ID
    private String startTime; // 请假开始时间
    private String endTime; // 请假结束时间
    private String reason; // 请假理由
    private int status; // 请假状态（0：待审批  1：通过  2：驳回）

}
