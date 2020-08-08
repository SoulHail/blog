package com.example.blog.enums;

public enum BaseResponseEnum {
    SERCH_SUCCESS("1", "找到数据"),
    SERCH_FAIL("0", "未找到对应数据");
    private final String code;
    private final String desc;

    BaseResponseEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
