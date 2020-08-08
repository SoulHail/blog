package com.example.blog.test;


import com.example.blog.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StreamDemo {
    public static void main(String[] args) {
        Student s5 = Student.builder().name("一").build();
        Student s4 = Student.builder().name("二").build();
        Student s3 = Student.builder().name("三").build();
        Student s2 = Student.builder().name("四").build();
        Student s1 = Student.builder().name("五").build();
        List<Student> list = new ArrayList<>();
        list.add(s3);
        list.add(s4);
        list.add(s2);
        list.add(s5);
        list.add(s1);
        System.out.println(list);
        /*Human h1 = new Human("大法师", "男", 11); // 3
        Human h2 = new Human("大法", "男", 21); // 2
        Human h3 = new Human("大法十大师", "男", 31); // 5
        Human h4 = new Human("大法师s", "男", 41); // 4
        Human h5 = new Human("6skdsa", "男", 51); // 6
        Human h6 = new Human("大", "男", 61); // 1
        Human h7 = new Human("7lspasf", "女", 71); // 7
        Human h8 = new Human("8ksjdkas", "女", 81);
        Human h9 = new Human("9kdjsbejs", "女", 91); // 9
        Human h10 = new Human("0dskfsalks", "女", 1); // 10
        List<Human> list = new ArrayList<>();
        list.add(h1);
        list.add(h2);
        list.add(h3);
        list.add(h4);
        list.add(h5);
        list.add(h6);
        list.add(h7);
        list.add(h8);
        list.add(h9);
        list.add(h10);
        // 1.直接取所有的某一项的值。用map
        List<String> collect = list.stream().map(a -> a.getName()).collect(toList());
        *//*List<String> collect = list.stream().map(a -> a.getName().split(" "))
                .flatMap(Arrays::stream).collect(toList());*//*
        List<Integer> co = list.stream().map(a -> a.getAge()).collect(toList());

        System.out.println(collect);
        System.out.println(co);

        // 2.加入函数，即筛选条件。用filter
        List<Human> collect2 = list.stream().filter(a -> {
            if ("女".equals(a.getSex()) && a.getAge() < 5) {
                return true;
            }
            return false;
        }).collect(toList());

        List<Human> co2 = list.stream().filter(a -> a.getName().length() <= 2).collect(toList());

        System.out.println(collect2);
        System.out.println(co2);
        // 3.forEach 加入筛选条件，直接对集合数据进行处理
        list.stream().forEach(a -> {
            if ("女".equals(a.getSex())) {
                a.setSex("男");
            }
        });
        System.out.println(list);

        list.stream().forEach( a -> {
            a.setAge(66);
        });
        System.out.println("*****************");
        System.out.println(list);*/
    }
}
