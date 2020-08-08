package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PointDomain {

    private String uuid;
    private String pointCode; // 关卡编码
    private String pointName; // 关卡名称
    private String pointLevel; // 关卡等级
    private String pointNum; // 邀新人数
    private String feeCode; // 奖励编码
}
