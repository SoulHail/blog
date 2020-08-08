package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InviteDomain {

    private String uuid;
    private String beInvitePhone; // 受邀人电话（掩码）
    private String actStatus; // 受邀人激活状态 1：激活 0：未激活
    private String actDate; // 激活日期
    private String actStartTime; // 激活开始时间
    private String actEndTime; // 激活结束时间
    private String beInviteBelong; // 受邀人归属状态 1：一致 0：不一致
    private String invitePhone; // 邀请人电话（掩码）
    private String actNum; // 累计激活人数
    private String inviteVipStatus; // 邀请人VIP状态 1:激活时已生效 0：激活时未生效
    private String allyStatus; // 邀请人盟友状态
    private String currentPoint; // 达成关卡
    private String startTime; // 套餐计时时间
    private String effectTime; // 套餐生效时间
}
