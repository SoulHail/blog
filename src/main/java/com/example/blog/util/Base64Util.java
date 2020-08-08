package com.example.blog.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import java.util.Random;

/**
 * Base64加密工具类
 */
public class Base64Util {

    private static final String[] saltArr = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};

    private static String getSalt() {
        int length = saltArr.length;
        String salt = "";
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            String rand = String.valueOf(saltArr[random.nextInt(length)]);
            salt += rand;
        }
        System.out.println(salt);
        return salt;
    }

    /**
     * Base64加密，加盐
     * @param str
     * @return
     */
    private String enCode(String str) {
        if (StringUtils.isBlank(str)) {
            return null;
        }
        String salt = getSalt();
        str += salt;
        byte[] b = Base64.encodeBase64(str.getBytes(), true);
        return new String(b);
    }

    /**
     * Base64解密，加盐
     * @param str
     * @return
     */
    private String deCode(String str, String salt) {
        if (StringUtils.isBlank(str) || StringUtils.isBlank(salt)) {
            return null;
        }
        String plainText = new String(Base64.decodeBase64(str.getBytes()));
        if (StringUtils.isBlank(plainText)) {
            return null;
        }
        int length = plainText.length();
        return plainText.substring(0, length - 6);
    }

    /**
     * Base64加密
     * @param str
     * @return
     */
    private static String getEncode(String str) {
        if (StringUtils.isBlank(str)) {
            return null;
        }
        byte[] b = Base64.encodeBase64(str.getBytes(), true);
        return new String(b);
    }

    /**
     * Base64解密
     * @param str
     * @return
     */
    private static String getDecode(String str) {
        if (StringUtils.isBlank(str)) {
            return null;
        }
        byte[] b = Base64.decodeBase64(str.getBytes());
        return new String(b);
    }

}
