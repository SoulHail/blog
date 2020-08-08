package com.example.blog.test;

public class Obj {

    private String objName;

    public Obj(String objName) {
        this.objName = objName;
        System.out.println(objName + "被创造出来了");
    }

    protected void finalize() throws Throwable {
        super.finalize();
        System.out.println(objName + "垃圾被回收了");
    }

    public static void main(String[] args) {
        Obj obj = new Obj("Obj1");
        Obj obj1 = new Obj("Obj2");
        obj = obj1 = null;
        System.gc();
    }

}
