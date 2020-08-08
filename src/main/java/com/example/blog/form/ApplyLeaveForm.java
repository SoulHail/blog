package com.example.blog.form;

import lombok.Data;

@Data
public class ApplyLeaveForm {

    private String userId; // 学号
    private String userName; // 姓名
    private String reason; // 请假原因
    private String leaveTime; // 请假日期
    private String file;

}
