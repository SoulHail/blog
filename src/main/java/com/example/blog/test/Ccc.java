package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Slf4j
public class Ccc {



    public static void main(String[] args) throws ParseException {

        /*Student s1 = Student.builder().no("1").name("展示").build();
        Student s2 = Student.builder().no("2").name("历史").build();
        Student s3 = Student.builder().no("3").name("挖个").build();
        List<Student> list = new ArrayList<>();
        list.add(s1);
        list.add(s2);
        list.add(s3);
        list.stream().forEach(a -> {
            if ("1".equals(a.getNo())) {
                a.setNo("777");
            }
        });
        System.out.println("====list:{}"+list);*/
        String time = "20190121";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        System.out.println(sdf.parse(time));
        System.out.println(sdf.format(sdf.parse(time)));
    }

    private static String getMaskMessage(String phone) throws Exception {
        if (phone.trim().length() != 11) {
            throw new Exception("手机号格式不正确");
        }
        return phone.substring(0, 3) + "****" + phone.substring(7, 11);
    }
}
