package com.example.blog.test;

public enum TestEnum {
    NO_APPLYING(null, "0", "未发起申请"),
    APPLYING("00", "1", "审核中"),
    APPLY_SUCCESS("01", "2", "申请成功"),
    APPLY_FAILED("02", "3", "申请失败"),
    APPLY_EXCEPTION("04", "3", "申请失败");

    private final String code;
    private final String frontCode; // 前端吗
    private final String message;

    TestEnum(String code, String frontCode, String message) {
        this.code = code;
        this.frontCode = frontCode;
        this.message = message;
    }

    public static String getFrontCodeByCode(String code) {
        for (TestEnum e : TestEnum.values()) {
            if (e.getCode() == code) {
                return e.frontCode;
            }
        }

        return NO_APPLYING.frontCode;
    }

    public String getCode() {
        return code;
    }

    public String getFrontCode() {
        return frontCode;
    }

    public String getMessage() {
        return message;
    }
}
