package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.util.*;

@Slf4j
public class UpdateTest {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("123");
        list.add("231");
        list.add("353");
        list.add("433");
        String[] before = list.toArray(new String[list.size()]);
        String[] now = {"432","342","654","423","231"};
        result(before,now);
    }

    public static void result(String[] before, String[] now) {
        String[] same = getSame(before, now);
        String[] insert = getDifferent(before, now);
        String[] delete = getDifferent(now, before);

        // 添加新的MCC
        for (String mcc : insert) {
            log.info("=========添加mcc：{}========",mcc);
        }
        // 删除旧的MCC
        for (String mcc : delete) {
            log.info("=========删除mcc：{}========",mcc);
        }
        // 修改公有的MCC
        for (String mcc : same) {
            log.info("=========修改公用mcc：{}========",mcc);
        }
    }

    // 获取两个数组相同的值
    private static String[] getSame(String[] a, String[] b) {

        Set<String> same = new HashSet<String>();
        Set<String> temp = new HashSet<String>();

        for (int i = 0; i < a.length; i++) {
            temp.add(a[i]);
        }

        for (int j = 0; j < b.length; j++) {
            if (!temp.add(b[j]))
                same.add(b[j]);
        }
        return same.toArray(new String[same.size()]);
    }

    // 获取后面数组中与前面数组不同的值
    private static String[] getDifferent(String[] s1, String[] s2) {
        List<String> list = Arrays.asList(s1);
        List<String> different = new ArrayList<String>();
        for (String t : s2) {
            if (!list.contains(t)) {
                different.add(t);
            }
        }
        return different.toArray(new String[different.size()]);
    }

}
