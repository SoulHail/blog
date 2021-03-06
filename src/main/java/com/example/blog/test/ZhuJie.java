package com.example.blog.test;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(value = {ElementType.METHOD})
@Documented
public @interface ZhuJie {
    String name();
    int age() default 18;
    int[] score();
}
