package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
public class TimeStamp {
    public static void main(String[] args) {
        String now = "2019-10-21 21:40:25";
        String timeStamp = getTimeStamp(now);
        String time = getDate(timeStamp);
        System.out.println(timeStamp + "                 " + time);
    }

    private static final String YYYYMMSS = "yyyy-MM-dd HH:mm:ss";

    /*************************************************13位*************************************************************/
    // 日期转换时间戳
    private static String getTimeStamp(String time) {
        if (StringUtils.isBlank(time)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(YYYYMMSS);
        String timeStamp = null;
        try {
            timeStamp = String.valueOf(sdf.parse(time).getTime());
        } catch (Exception e) {
            log.error("转换时间戳异常");
            return null;
        }
        return timeStamp;
    }

    private static String getDate(String timeStamp) {
        // 时间戳转date 时分秒格式
        Date date = new Date(Long.valueOf(timeStamp));
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }

    /*************************************************10位*************************************************************/
    // 10位时间戳转成日期
    private String getDate2(String timeStamp) {
        // 时间戳转date 时分秒格式
        Date date = new Date(Long.valueOf(timeStamp + "000"));
        return new SimpleDateFormat(YYYYMMSS).format(date);
    }

    // 日期转换时间戳,10位，到毫秒
    private String getTimeStamp2(String time) {
        if (StringUtils.isBlank(time)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(YYYYMMSS);
        String timeStamp = null;
        try {
            timeStamp = String.valueOf(sdf.parse(time).getTime() / 1000);
        } catch (Exception e) {
            log.error("转换时间戳异常");
            return null;
        }
        return timeStamp;
    }
}
