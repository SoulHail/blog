package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Demo {

    public static void main(String[] args) {
        getTime();
    }

    private static void getTime() {
        System.out.println("exception");
        System.out.println("DB操作");
        System.out.println("MQ操作");
        System.out.println("REDIS操作");
    }

}
