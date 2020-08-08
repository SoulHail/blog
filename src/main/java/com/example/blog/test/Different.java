package com.example.blog.test;

import java.util.*;

/***
 * 获取两个集合不同的元素，和相同的元素
 */
public class Different {
    public static Set<String> getIds(String[] a, String[] b) {

        Set<String> same = new HashSet<String>();  //用来存放两个数组中相同的元素
        Set<String> temp = new HashSet<String>();  //用来存放数组a中的元素

        for (int i = 0; i < a.length; i++) {
            temp.add(a[i]);   //把数组a中的元素放到Set中，可以去除重复的元素
        }

        for (int j = 0; j < b.length; j++) {
            //把数组b中的元素添加到temp中
            //如果temp中已存在相同的元素，则temp.add（b[j]）返回false
            if (!temp.add(b[j]))
                same.add(b[j]);
        }
        return same;
    }

    public static List<String> compare(String[] s1, String[] s2) {
        List<String> list1 = Arrays.asList(s1); //将s1数组转成list数组
        List<String> list2 = new ArrayList<String>();//用来存放2个数组中不相同的元素
        for (String t : s2) {
            if (!list1.contains(t)) {
                list2.add(t);
            }
        }
        return list2;
    }

    public static void main(String[] arg) {
        /*List<String> list = new ArrayList<>();
        list.add("1001");
        list.add("1002");
        list.add("1003");
        String[] s1 = list.toArray(new String[list.size()]);

        Set<String> set = new HashSet<>();
        set.add("2001");
        set.add("2002");
        set.add("2003");
        String[] s2 = set.toArray(new String[set.size()]);

        System.out.println(s1[0]+""+s1[1]+""+s1[2]);
        System.out.println(s2[0]+""+s2[1]+""+s2[2]);*/
        String[] s1 = {"1001", "1002", "1003", "1004"};

        String[] s2 = {"1001", "2004","2005"};

        Set<String> set = getIds(s1, s2);
        List<String> list = compare(s1, s2);

        for (String i : set) {
            System.out.println("相同元素为：" + i);
        }
        System.out.println("====================");
        for (String j : list) {
            System.out.println("不同元素为：" + j);
        }
        // 欢乐送 我的网瘾犯了 很难受
    }
}
