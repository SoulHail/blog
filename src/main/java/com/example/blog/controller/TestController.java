package com.example.blog.controller;

import com.example.blog.api.TestApi;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class TestController implements TestApi {

    @Override
    public String hello() {
        log.info("=======进入hello方法======");
        return "hello";
    }
}
