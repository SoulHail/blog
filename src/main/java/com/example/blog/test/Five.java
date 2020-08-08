package com.example.blog.test;

import org.apache.commons.lang.StringUtils;

public class Five {
    public static void main(String[] args) {
        String a = "01101101110101";
        getIndex(a);
    }

    // "adsfssd" length 7 回文sfs 00110101101
    public String longestPalindrome(String s) {
        if (s == null || s.length() < 1) return "";
        int start = 0, end = 0;
        for (int i = 0; i < s.length(); i++) {
            int len1 = expandAroundCenter(s, i, i);
            int len2 = expandAroundCenter(s, i, i + 1);
            int len = Math.max(len1, len2);
            if (len > end - start) {
                start = i - (len - 1) / 2;
                end = i + len / 2;
            }
        }
        return s.substring(start, end + 1);
    }

    private int expandAroundCenter(String s, int left, int right) {
        int L = left, R = right;
        while (L >= 0 && R < s.length() && s.charAt(L) == s.charAt(R)) {
            L--;
            R++;
        }
        return R - L - 1;
    }

    private static String getHuiWen(String s) {
        if (StringUtils.isBlank(s)) {
            return "";
        }
        int len = s.length();
        return null;
    }

    // 01101101110101
    private static void getIndex(String s) {
        if (StringUtils.isBlank(s)) {
            return;
        }
        int indexStart1 = 0, indexEnd1 = 0, indexStart2 = 0, indexEnd2 = 0, size1 = 0, size2 = 0;
        for (int i = 1; i <= s.length(); i++) {
            if ("1".equals(s.substring(i - 1, i))) {
                if (indexStart1 == 0) {
                    indexStart1 = indexEnd1 = i;
                    size1++;
                    continue;
                }
                if (i - indexStart1 == 1) {
                    indexEnd1 = i;
                    size1++;
                    continue;
                }
                if (i - indexStart1 > 1) {
                    if (indexStart2 == 0) {
                        indexStart2 = indexEnd2 = i;
                        size2++;
                        continue;
                    }
                    if (i - indexStart2 == 1) {
                        indexEnd2 = i;
                        size2++;
                        continue;
                    }
                    if (i - indexStart2 > 1) {
                        if (size2 >= size1) {
                            indexStart1 = indexStart2;
                            indexEnd1 = indexEnd2;
                            size1 = size2;
                            indexStart2 = indexEnd2 = i;
                            size2 = 1;
                        }
                    }
                }

            }
        }
        if (size1 >= size2) {
            System.out.println("indexStart:" + indexStart1 + "      indexEnd:" + indexEnd1 + "       size:" + size1);
        } else System.out.println("indexStart:" + indexStart2 + "      indexEnd:" + indexEnd2 + "       size:" + size2);
    }
}
