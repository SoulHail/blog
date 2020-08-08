package com.example.blog.test;

public class CompareString {
    public static void main(String[] args) {
        String a = "0.66";
        String b = "0.66";
        if (a.compareTo(b) == 0) {
            System.out.println("a等于b");
        } else {
            System.out.println("a小于b");
        }
    }
}
