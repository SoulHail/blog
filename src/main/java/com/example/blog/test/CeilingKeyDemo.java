package com.example.blog.test;

import java.util.NavigableMap;
import java.util.TreeMap;

public class CeilingKeyDemo {
    public static void main(String[] args) {
        // creating Tree map
        NavigableMap<Integer, String> treemap = new TreeMap<Integer, String>();
        int x = 0, y = 0, z = 0, r = 0;

        // populating Tree map
        treemap.put(1, "999");
        treemap.put(3, "868");
        treemap.put(6, "666");
        treemap.put(10, "499");
        // 返回大于或等于所给数字表达式的最小整数。
        for (int i = 1; i <= 10; i++) {
            int a = treemap.ceilingKey((int) (Math.random() * 10));
            if (a == 1) {
                x++;
            }
            if (a == 3) {
                y++;
            }
            if (a == 6) {
                z++;
            }
            if (a == 10) {
                r++;
            }
        }
        System.out.println("获得的奖金为999次数： " + x);
        System.out.println("获得的奖金为868次数： " + y);
        System.out.println("获得的奖金为666次数： " + z);
        System.out.println("获得的奖金为499次数： " + r);

    }
}
