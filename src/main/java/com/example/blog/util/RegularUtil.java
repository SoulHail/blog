package com.example.blog.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则表达式，验证参数合法性工具类
 */
public class RegularUtil {

    /*private static final String ALL_NUMBER = "^[0-9]*$"; // 纯数字
    private static final String ALL_NUMBER_N = "^\\d{9}$"; // 9位纯数字，可通配
    private static final String ALL_NUMBER_LEAST_N = "^\\d{9,}$"; // 至少9位纯数字，可通配
    private static final String ALL_NUMBER_M_N = "^\\d{m,n}$"; // m-n位的数字，可通配
    private static final String TWO_DECIMAL = "^([1-9][0-9]*)+(.[0-9]{1,2})?$"; // 非零开头的最多带两位小数的数字
    private static final String ENGLISH_NUMBER = "^[A-Za-z0-9]{4,40}$"; // 英文和数字

    private static final String ALL_CHINESE = "^[\\u4e00-\\u9fa5]{0,}$"; // 纯汉字
    private static final String ENGLISH = "^[A-Za-z]+$"; // 由26个英文字母组成的字符串
    private static final String BIG_ENGLISH = "^[A-Z]+$"; // 由26个大写英文字母组成的字符串
    private static final String SMALL_ENGLISH = "^[a-z]+$"; // 由26个小写英文字母组成的字符串
    private static final String CHINESE_ENGLISH = "^[\\u4e00-\\u9fa5]{0,}$"; // 纯汉字
    private static final String USER_NAME = "^[a-zA-Z][a-zA-Z0-9_]{4,15}$"; // 帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)

    private static final String EMAIL = "^^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"; // Email
    private static final String AREA = "[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?"; // 域名
    private static final String INTERNET_URL = "[a-zA-z]+://[^\\s]* 或 ^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$"; // 网站
    private static final String PHONE = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$"; // 手机号
    private static final String DATE = "^\\d{4}-\\d{1,2}-\\d{1,2}"; // 日期格式*/

    public static boolean checkRegularUtil(String str, String rule) {
        Pattern p = Pattern.compile(rule); // 将规则封装成对象
        Matcher m = p.matcher(str); // 让正则对象和要作用的字符串相关联。获取匹配器对象。
        return m.matches();
    }

}
