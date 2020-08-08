package com.example.blog.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("test")
public interface TestApi {

    /**
     * 活动触发:会员购买赠送活动包
     */
    @GetMapping("/aaa")
    String hello();
}
