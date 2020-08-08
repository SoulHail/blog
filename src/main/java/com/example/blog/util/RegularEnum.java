package com.example.blog.util;

public enum RegularEnum {
    NOT_FOUND("NOT_FOUND", "", ""),
    ALL_NUMBER("ALL_NUMBER", "^[0-9]*$", "纯数字"),
    ALL_NUMBER_N("ALL_NUMBER_N", "^\\d{9}$", "9位纯数字，可通配"),
    ALL_NUMBER_LEAST_N("ALL_NUMBER_LEAST_N", "^\\d{9,}$", "至少9位纯数字，可通配"),
    ALL_NUMBER_M_N("ALL_NUMBER_M_N", "^\\d{m,n}$", "m-n位的数字，可通配"),
    TWO_DECIMAL("TWO_DECIMAL", "^([1-9][0-9]*)+(.[0-9]{1,2})?$", "非零开头的最多带两位小数的数字"),
    ENGLISH_NUMBER("ENGLISH_NUMBER", "^[A-Za-z0-9]{4,40}$", "英文和数字"),
    ALL_CHINESE("ALL_CHINESE", "^[\\u4e00-\\u9fa5]{0,}$", "纯汉字"),
    ENGLISH("ENGLISH", "^[A-Za-z]+$", "由26个英文字母组成的字符串"),
    BIG_ENGLISH("ALL_NUMBER", "^[A-Z]+$", "由26个大写英文字母组成的字符串"),
    SMALL_ENGLISH("ALL_NUMBER", "^[a-z]+$", "由26个小写英文字母组成的字符串"),
    USER_NAME("ALL_NUMBER", "^[a-zA-Z][a-zA-Z0-9_]{4,15}$", "帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)"),
    EMAIL("ALL_NUMBER", "^^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", "Email"),
    AREA("ALL_NUMBER", "[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?", "域名"),
    INTERNET_URL("ALL_NUMBER", "[a-zA-z]+://[^\\s]* 或 ^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$", "网站"),
    PHONE("ALL_NUMBER", "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$", "手机号"),
    DATE("ALL_NUMBER", "^\\d{4}-\\d{1,2}-\\d{1,2}", "日期格式");

    private final String code;
    private final String rule;
    private final String desc;

    RegularEnum(String code, String rule, String desc) {
        this.code = code;
        this.rule = rule;
        this.desc = desc;
    }

    public static String getRuleByCode(String code) {
        for (RegularEnum r : RegularEnum.values()) {
            if (r.getCode().equals(code)) {
                return r.rule;
            }
        }
        return NOT_FOUND.rule;
    }

    public String getCode() {
        return code;
    }

    public String getRule() {
        return rule;
    }

    public String getDesc() {
        return desc;
    }
}
