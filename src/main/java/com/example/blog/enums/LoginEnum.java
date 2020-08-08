package com.example.blog.enums;

/**
 * 返回成功标识
 */
public enum LoginEnum {

    SERCH_SUCCESS(1, "找到数据"),
    SERCH_FAIL(0, "未找到对应数据");

    private final int code;
    private final String desc;

    LoginEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

}