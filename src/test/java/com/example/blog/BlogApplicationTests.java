package com.example.blog;

import com.example.blog.entity.ten.Cuboid;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BlogApplicationTests {

    @Test
    public void test() {
        Cuboid cuboid = Cuboid.builder()
                .chaNg("wew")
                .kuAn("dsds")
                .gao("dsd")
                .build();
        System.out.println(cuboid);
    }

    @Test
    void contextLoads() {
    }

}
