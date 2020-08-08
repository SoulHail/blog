package com.example.blog.test;

public class One {
    @ZhuJie(name = "张三",age = 21,score = {21,42,12})
    public void study(int times){
        for (int i = 0; i < times; i++) {
            System.out.println("Good Good Study, Day Day Up!");
        }
    }
}
