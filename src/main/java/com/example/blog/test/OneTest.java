package com.example.blog.test;

import java.lang.reflect.Method;

public class OneTest {
    public static void main(String[] args) {
        try {
            Class clTest = Class.forName("com.example.codeone.test.One");
            Method maTest = clTest.getMethod("study",int.class);
            if (maTest.isAnnotationPresent(ZhuJie.class)) {
                System.out.println("=======引用了ZhuJie注解========");
                ZhuJie zhuJie = maTest.getAnnotation(ZhuJie.class);
                System.out.println("name: " + zhuJie.name() + ", age: " + zhuJie.age()
                        + ", score: " + zhuJie.score()[0]);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e){
            e.printStackTrace();
        }
    }
}
