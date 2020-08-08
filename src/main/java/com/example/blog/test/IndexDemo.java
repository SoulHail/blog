package com.example.blog.test;

import java.util.ArrayList;
import java.util.List;

public class IndexDemo {
    public static void main(String[] args) {
        String a = "dsakckx.fksa.dask.docx";
        String b = "asd.()dsa.sd.xlsx";
        String c = "sadk2.放得开.dj.md";
        String d = "a,sas.fsad诞生.txt";
        List<String> list = new ArrayList<>();
        list.add(a);
        list.add(b);
        list.add(c);
        list.add(d);
        for(String x : list) {
            System.out.println(x.substring(x.lastIndexOf(".")));
        }
    }
}
