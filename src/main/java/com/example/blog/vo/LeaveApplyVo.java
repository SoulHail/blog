package com.example.blog.vo;

import lombok.Data;

@Data
public class LeaveApplyVo {

    private String uuid; // uuid
    private String userId; // 学号
    private String userName; // 姓名
    private String major; // 专业
    private String startTime; // 请假开始时间
    private String endTime; // 请假结束时间
    private String reason; // 请假原因

}
