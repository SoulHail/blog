package com.example.blog.test.lottery;

import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.TreeMap;

public class LuckDraw {
    private static List<RewardInfo> list = Arrays.asList(new RewardInfo("1001", "1", "一等奖"),
            new RewardInfo("1002", "2", "二等奖"), new RewardInfo("1003", "3", "三等奖"),
            new RewardInfo("1004", "4", "四等奖"));

    public static void main(String[] args) {
        int one = 0;
        int two = 0;
        int three = 0;
        int four = 0;
        for (int i = 1; i <= 100; i++) {
            RewardInfo r = lot();
            System.out.println("第" + i + "次抽奖，获得" + r.getRewardName());
            switch (r.getId()) {
                case "1001":
                    one++;
                    break;
                case "1002":
                    two++;
                    break;
                case "1003":
                    three++;
                    break;
                case "1004":
                    four++;
                    break;
                default:
                    System.out.println("=========ERROR========");
            }
        }
        System.out.println("一等奖中奖"+one+"次");
        System.out.println("二等奖中奖"+two+"次");
        System.out.println("三等奖中奖"+three+"次");
        System.out.println("四等奖中奖"+four+"次");
    }

    private static RewardInfo lot() {
        // 总权重
        int total = 0;
        // 以权重区间段的后面的值作为key存当前信息
        TreeMap<Integer, RewardInfo> map = new TreeMap<>();
        for (RewardInfo r : list) {
            total += Integer.parseInt(r.getWeight());
            map.put(total, r);
        }
        int random = new Random().nextInt(total) + 1;
        Integer key = map.ceilingKey(random);
        return map.get(key);
    }
}
