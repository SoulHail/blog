package com.example.blog.test;


import com.example.blog.entity.ten.Cuboid;
import com.example.blog.entity.ten.TestDomain;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Jjj {
    public static void main(String[] args) {
        TestDomain t = TestDomain.builder()
                .name("name111")
                .age("age111")
                .sex("sex111")
                .cuboid(Cuboid.builder().chaNg("1").kuAn("1").gao("1").build())
                .build();
        test(t);
        act(t);
    }

    private static void test(TestDomain testDomain) {
        log.info("调用test前，param：{}",testDomain);
        testDomain.setCuboid(Cuboid.builder().chaNg("2").kuAn("2").gao("2").build());
        log.info("调用test后，param：{}",testDomain);
    }

    private static void act(TestDomain testDomain) {
        log.info("调用act，param：{}",testDomain);
    }
}
