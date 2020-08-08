package com.example.blog.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Random;

/**
 * MD5加密工具类
 */
@Slf4j
public class Md5Util {

    /**
     * 1、存储密码时，调用此方法生产一个盐，将盐加密，存储到数据库；
     * 2、将密码和盐的密文拼接成一个新字符串，加密得到密文，存储到数据库；
     * 3、校验数据时，先获取盐的密文，再与输入的密码拼接加密，与数据库的密文相等，返回正确，否则返回错误
     */

    private static final String[] saltArr = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};

    /**
     * 得到一个随机生成的盐
     */
    private String getSalt() {
        Random random = new Random();
        int length = saltArr.length;
        String salt = "";
        for (int i = 0; i < 6; i++) {
            String rand = String.valueOf(saltArr[random.nextInt(length)]);
            salt += rand;
        }
        return salt;
    }

    /**
     * 常规MD5加密
     */
    private String stringToMD5(String plainText) {
        if (StringUtils.isBlank(plainText)) {
            return null;
        }
        byte[] secretBytes = null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        } catch (Exception e) {
            log.error("没有这个md5算法!", e);
            return null;
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        return md5code;
    }


}
