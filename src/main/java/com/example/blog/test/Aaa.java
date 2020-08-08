package com.example.blog.test;

import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class Aaa {
    private static String sss = "0";

    public static void main(String[] args) {
        Boolean flag = true;
        int num = 0;
        Set<Object> seen = ConcurrentHashMap.newKeySet();
        seen.add(4);
        seen.add(7);
        while (flag) {
            int randomNum = new Random().nextInt(10);
            seen.add(randomNum);
            System.out.println(seen.toString());
            if (seen.size() >= 10) {
                flag = false;
            }
            num++;
        }
        System.out.println("num----------------->" + num);

    }

    private static void aaa() {
        sss = "1";
    }
}
