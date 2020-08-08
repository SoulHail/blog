package com.example.blog.util;

public class LeaveDateUtil {

    public static String getStartTime(String leaveTime) {
        return leaveTime.substring(0,10);
    }

    public static String getEndTime(String leaveTime) {
        return leaveTime.substring(13,23);
    }

}
