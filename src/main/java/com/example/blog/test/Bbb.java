package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Bbb {
    /**
     * 企业正常状态
     */
    private static final String[] NORMAL_STATUS = new String[]{"存续", "在业", "在营", "开业", "在册", "正常", "有效"};
    public static void main(String[] args) {
        String a = "在业";
        for (String s : NORMAL_STATUS) {
            if (a.contains(s)) {
                System.out.println(true);
            }
        }
        log.info("end");

    }
}
