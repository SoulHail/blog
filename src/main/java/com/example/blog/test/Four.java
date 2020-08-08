package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
public class Four {
    public static void main(String[] args) throws ParseException {

        int i = (int) (System.currentTimeMillis() / 1000);
        System.out.println(i);

        String format = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        System.out.println(Long.valueOf(i + "000"));
        Date now = new Date(Long.valueOf(i + "000"));
        System.out.println(now);

        Date date = new Date();
        String dateStr = sdf.format(now);
        System.out.println("=========now:"+now);

        System.out.println(sdf.parse("2019-10-17 20:28:32").getTime() / 1000);

        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        System.out.println("-------"+currentTime);
        String dateSt2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
        System.out.println(dateSt2);


    }

}
