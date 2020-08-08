package com.example.blog.test;

import java.util.*;

public class HuiWenTest {
    public static void main(String[] args) {
        Set s = new HashSet();
        Set s1 = new HashSet();
        Set s2 = new HashSet();
        s1.add(3);
        s1.add(3);
        s1.add(31);
        s2.add(31);
        s2.add(32);
        s2.add(3);
        s.add(s1);
        s.add(s2);
        System.out.println(s1.size());
        System.out.println(s2.size());
        System.out.println(s);
        Iterator ite = s.iterator();
        while (ite.hasNext()) {
            System.out.println(ite.next());
        }
        List<String> l = new ArrayList<>();
    }
    class Foo {

        public Foo() {

        }
        volatile int count=1;
        public void first(Runnable printFirst) throws InterruptedException {
            printFirst.run();
            count++;
        }

        public void second(Runnable printSecond) throws InterruptedException {
            while (count!=2);
            printSecond.run();
            count++;
        }

        public void third(Runnable printThird) throws InterruptedException {
            while (count!=3);
            printThird.run();
        }
    }
}
