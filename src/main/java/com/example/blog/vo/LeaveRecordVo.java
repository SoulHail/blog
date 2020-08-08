package com.example.blog.vo;

import lombok.Data;

@Data
public class LeaveRecordVo {

    private String startTime; // 请假开始时间
    private String endTime; // 请假结束时间
    private String reason; // 请假原因
    private String status; // 审批状态（0：待审批  1：通过  2：驳回）

}
