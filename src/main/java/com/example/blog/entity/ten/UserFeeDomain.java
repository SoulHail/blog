package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserFeeDomain {

    private String uuid;
    private String inMno; // 商编
    private String feeName; // 费率套餐名称
    private String feeCode; // 费率套餐编码
    private String duration; // 有效时长
    private String startTime; // 起始时间
    private String endTime; // 结束时间
    /**
     * secondFlag 未用最优 0：否 1：是
     */
    private String unUsedBetter; // 未用最优 1：是 0：否
    /**
     * sts 状态 0：作废 1：未生效 2：生效
     */
    private String status; // 状态 1：生效 2：未生效 3：作废
    private String buildAction; // 生成方式
    /**
     * 更新时间
     */
    private String eventTime; // 事件时间
    /**
     * eventType
     */
    private String event; // 事件
    /**
     * eventDesc
     */
    private String eventDesc; // 事件说明
}
