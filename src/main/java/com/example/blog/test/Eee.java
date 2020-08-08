package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
public class Eee {
    public static void main(String[] args) {
        String[] pool = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
        List<String> list = new ArrayList<>(Arrays.asList(pool));
        String[] my = {"3", "4", "6"};
        List<String> myli = new ArrayList<>(Arrays.asList(my));
        System.out.println((int) (Math.random() * 10));
        int count = 0;
        boolean flag = true;
        while (flag) {
            String ward = pool[(int) (Math.random() * 10)];
            count++;
            log.info("第{}次抽奖，抽奖结果：{}", count, ward);
            if (!myli.contains(ward)) {
                myli.add(ward);
                log.info("达标数+1,此时个人奖池:{}", myli);
                if (myli.size() == 10) {
                    log.info("总共抽奖{}次", count);
                    flag = false;
                }
            }
        }
    }
}
