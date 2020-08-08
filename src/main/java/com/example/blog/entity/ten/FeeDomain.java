package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FeeDomain {

    private String uuid;
    private String name; // 费率套餐名称
    private String desc; // 费率套餐描述
    private String goodsId; // 套餐产品ID（对应计费字段）
    private String goodsNm; // 套餐产品名称（对应计费字段）
    private String debitRate; // 借记卡交易手续费
    private String creditRate; // 贷记卡交易手续费
    private String settleFee; // 结算手续费
    private String duration; // 有效时长
    private String packageType; // 套餐类型 01：默认 02：普通 03：VIP
    private String status; // 状态 1:可用 0：不可用
}
