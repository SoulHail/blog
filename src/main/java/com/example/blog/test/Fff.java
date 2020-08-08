package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.Calendar;
import java.util.Date;

@Slf4j
public class Fff {
    public static void main(String[] args) {
        /*String time1 = "20190606";
        String time2 = "20191118";
        System.out.println(differDays(time1, time2));*/

        String time1 = "2019-11-20 14:41:20";
        String time2 = "2019-11-20 14:41:20";
    }

    private static String differDays(String startTime, String endTime) {
        if (StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)) {
            return "fail";
        }
        if (startTime.length() != 8 || endTime.length() != 8) {
            return "fail";
        }
        Calendar start = Calendar.getInstance();
        String startYear = startTime.substring(0, 4);
        String startMonth = startTime.substring(4, 6);
        String startDay = startTime.substring(6, 8);
        start.set(Integer.valueOf(startYear), Integer.valueOf(startMonth), Integer.valueOf(startDay));

        Calendar end = Calendar.getInstance();
        String endYear = endTime.substring(0, 4);
        String endMonth = endTime.substring(4, 6);
        String endDay = endTime.substring(6, 8);
        end.set(Integer.valueOf(endYear), Integer.valueOf(endMonth), Integer.valueOf(endDay));
        log.info("start:{}    end:{}", start.getTime().getTime(), end.getTime().getTime());

        if (end.getTime().getTime() < start.getTime().getTime()) {
            return "fail";
        }
        return String.valueOf((end.getTime().getTime() - start.getTime().getTime()) / 1000 / 60 / 60 / 24);

    }

    private String getDuration(Date dateStart,Date dateEnd) {
        return String.valueOf((dateEnd.getTime() - dateStart.getTime()) / 1000 / 60 / 60 / 24);
    }
}
