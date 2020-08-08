package com.example.blog.test;

import com.example.blog.entity.ten.PointDomain;
import com.example.blog.entity.ten.TestDomain;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

@Slf4j
public class Ddd {
    public static void main(String[] args) {
        PointDomain p1 = PointDomain.builder()
                .pointName("dsaad")
                .build();
        PointDomain p2 = PointDomain.builder()
                .pointName("fsjdkjd")
                .build();
        PointDomain p3 = PointDomain.builder()
                .pointName("llsada")
                .build();
        PointDomain p4 = PointDomain.builder()
                .pointName("qweqwe")
                .build();
        List<PointDomain> list = new ArrayList<>();
        list.add(p1);
        list.add(p2);
        list.add(p3);
        list.add(p4);
        log.info("=============处理前list:{}", list);
        list.stream().forEach( a -> {
            a.setPointName(getExce(a.getPointName()));
        });
        log.info("=============处理后list:{}", list);
    }

    private static String getExce(String a) {
        if (a.contains("a")) {
            return "aaaaaa";
        }
        return a;
    }

    private void testAs() {
        TestDomain s = new TestDomain();
        // public static void main(String aaa) {
        // give me something,dnf jin bi jia ge gao yu 60 bi wo zai mai }
    }
}
