package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Slf4j
public class Funny {
    public static void main(String[] args) {
        String date = "20200222";
        //解析日期
        LocalDate startLocalDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyyMMdd"));

        //获取指定格式日期 yyyyMMddHHmmss
        String startDate = startLocalDate.format(DateTimeFormatter.ofPattern("yyyyMMdd")) + "000000";
        System.out.println(startDate);
    }
}
