package com.example.blog.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NewUserActDomain {
    private String id; // 活动ID
    private String title; // 活动标题
    private String status; // 状态 0：未开始 1：进行中 2：已结束
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date promotionStartTime; // 活动开始时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date promotionEndTime; // 活动结束时间

    private String registerSwitch; // 注册有礼开关 01开 00关
    private String registerCouponId; // 优惠券或者券包
    private String registerType; // 注册有礼类型
    private String registerTip; // 奖励名称
    private String registerSubTip; // 引导文案
    private String registerPushMsgId; // 引导文案

    private String guideSwitch; // 引导有礼开关  01开  00关
    private String guideType; // 引导有礼类型
    private String guideCouponId; // 引导有礼优惠券或券包
    private String guideTip; // 奖励名称
    private String guideSubTip; // 引导文案
    private String guidePayType; // 引导类型
    private String guidePayAmount; // 引导金额
    private String guidePushMsgId; // 引导金额

    private String enableStatus; // 启用状态 1：启用 2：停用
    private Date createTime; // 创建时间
    private Date updateTime; // 修改时间


    private int no; // 排名

}
