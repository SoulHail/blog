package com.example.blog.test;

import com.example.blog.entity.copy.Man;
import com.example.blog.entity.copy.Woman;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

import java.util.Date;

@Slf4j
public class Ggg {
    public static void main(String[] args) {
        /*CurrentFee c = CurrentFee.builder()
                .inMno("7000000324232")
                .debitRate("0.55")
                .cardRate("0.33")
                .qrRate("0.38")
                .vipStatus("010")
                .vipDueDate("20190921")
                .build();
        JSONObject jsonObj = JSONObject.fromObject(c);
        System.out.println(jsonObj);
        CurrentFee currentFee = JSON.parseObject(String.valueOf(jsonObj),CurrentFee.class);
        System.out.println(currentFee);
        System.out.println("---------------------");
        String m = "{\"cardRate\":\"0.33\",\"qrRate\":\"0.38\",\"inMno\":\"7000000324232\",\"debitRate\":\"0.55\",\"vipDueDate\":\"20190921\",\"vipStatus\":\"010\"}";
        JSONObject json_test = JSONObject.fromObject(m);
        System.out.println(json_test);*/
        /*String a = "";
        if ("" == a.trim()) {
            System.out.println("111");
        } else {
            System.out.println("222");
        }*/

        Man man = new Man();
        Woman woman = Woman.builder()
                .age("111")
                .birth(new Date())
                .name("wqeqw")
                .sex("2").build();

        BeanUtils.copyProperties(woman, man);
        log.info("=====Man:{}", man);
        log.info("=====Woman:{}", woman);
    }
}
