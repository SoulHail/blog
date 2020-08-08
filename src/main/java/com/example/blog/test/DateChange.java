package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
public class DateChange {
    public static void main(String[] args) {
        String time = "2018-1-1";
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = format1.parse(time);
            log.info("=====================date:{}"+date);
        } catch (ParseException e) {
            log.info("================转换异常！！！");
        }
    }
}
