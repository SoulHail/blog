package com.example.blog.test;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class Test {
    //测试
    public static void main(String[] args) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        String[] str1 = {"4", "4444"}; //权重为4
        String[] str2 = {"7", "7777"}; //权重为7
        String[] str3 = {"3", "3333"}; //权重为3
        String[] str4 = {"4", "4242"}; //权重为4
        List<String[]> list = new ArrayList<String[]>();
        list.add(str1);
        list.add(str2);
        list.add(str3);
        list.add(str4);

        Long s = System.currentTimeMillis();
        String str = null;
        for (int i = 0; i < 1000; i++) {
            str = new Test().getMax(list);
            if ("4444".equals(str)) {
                a++;
            }
            if ("7777".equals(str)) {
                b++;
            }
            if ("3333".equals(str)) {
                c++;
            }
            if ("4242".equals(str)) {
                d++;
            }
        }
        Long e = System.currentTimeMillis();
        System.out.println("耗时：" + (e - s));
        System.out.println(a);
        System.out.println(b);
        System.out.println(c);
        System.out.println(d);
        //String result = new 权重().getMax(list);
    }

    /**
     * 获得给定List集合里权重大的结果
     *
     * @param list
     * @return
     * @author Peter
     */
    public String getMax(List<String[]> list) {
        int len = list.size();
        int total = 0;//总权重
        //以权重区间段的后面的值作为key存当前信息
        TreeMap<Integer, String> map = new TreeMap<Integer, String>();
        for (int i = 0; i < len; i++) {
            String[] array = list.get(i);
            total += Integer.parseInt(array[0]);
            map.put(total, array[1]);
        }
        int random = (int) (Math.random() * total);
        Integer key = map.ceilingKey(random);
        return map.get(key);
    }

}
