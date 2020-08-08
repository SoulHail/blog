package com.example.blog.task;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Slf4j
@Component
//@EnableScheduling
public class TestScheduler {

    @Scheduled(cron = "*/5 * * * * ?")
    public void test() {
        log.info("执行定时任务，时间：{}", LocalDateTime.now());
    }
}
