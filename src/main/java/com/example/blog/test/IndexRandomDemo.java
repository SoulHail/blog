package com.example.blog.test;

/**
 * 错误示范
 */
public class IndexRandomDemo {
    public static void main(String[] args) {
        open();
    }

    private static void open(){
        int i = (int) (Math.random()*100);
        System.out.println(i);
        if (i < 50) {
            System.out.println("加班");
        }
        if (i >= 50) {
            System.out.println("调休");
        }
    }
}
