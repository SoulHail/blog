package com.example.blog.test.lottery;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RewardInfo {
    private String id; // 奖励ID
    private String weight; // 中奖权重比
    private String rewardName; // 奖励名称
}
