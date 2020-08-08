package com.example.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class TaskDomain {

    private static final long serialVersionUID = 1L;

    private String taskId; //任务id
    private String createTime;// 创建时间
    private String openTime; // 启用时间
    private String createStatus; // 创建状态
    private String taskStatus; // 任务状态



    private String moduleCode; // 任务模块ID
    private String taskName; // 任务名称

    private String taskConditionId; // 任务条件
    private String taskConditionNum; // 张。。。
    private String taskConditionMoney; // 钱

    private String rewardType; // 奖励类别
    private String rewardId; // 奖励ID
    private String rewardFileName; // 奖励图标
    private String rewardDesc; // 奖励描述

    private String jumpCode; // 任务跳转类型 本地页面：NATIVE，H5页面：H5
    private String jumpUrl; // 任务跳转链接

    private String loopType; // 01:一次性任务，02:每日循环任务，03:每月循环任务
    private String progressType; // 是否展示进度 01:是，02:否


    private String onlineTimeAdd; // 上线时间
    private String offlineTimeAdd; // 下线时间


    private String logoUrl; // 任务图片

    private String taskDesc; // 任务内容描述
    private String taskRewardDesc; // 任务内容描述

    private String taskSortAdd; // 排序
    private String remark; // 备注
}
