package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
public class HuiWen {
    public static void main(String[] args) {
        int m = 4; // m个数
        int n = 4; // n层
        List<Set> list = new ArrayList<>();
        Set<Set> set = new HashSet();
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= m; j++) {
                Set s = new HashSet();
                s.add(i);
                s.add(j);
                if (s.size() > 1) {
                    set.add(s);
                }
            }
        }
        System.out.println(set);
        int c = 2;
        for (int i = 1; i <= n; i++) {
            getSet(set, m, c);
            c++;
        }
        list.add(set);
        System.out.println(list);
    }

    private static Set getSet(Set<Set> s, int m, int c) {
        Set<Set> sets = new HashSet<>();
        for (Set set : s) {
            for (int i = 1; i <= m; i++) {
                Set<Set> ss = new HashSet();
                set.add(i);
                if (ss.size() > c) {
                    ss.add(set);
                }
                sets.add(ss);
                log.info("====第{}次播种的{}次子播种,result:{}", c, i, sets);
            }
        }

        return sets;
    }

}
