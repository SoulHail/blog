package com.example.blog.test;

/**
 * 字符串倒序相加，输出相加结果的倒序
 * 9527  3592  7259+2953 10212  21201
 * 3492 34523 32543+2943 35486 68453
 * 439235 39432  724655
 */
public class Three {
    public static void main(String[] args) {
        int[] arr = {4, 3, 9, 2, 3, 5};
        int[] brr = {3, 9, 4, 3, 2};
        System.out.println(twoSum(arr, brr));
    }

    public static String twoSum(int[] arr, int[] brr) {
        String a = getS(arr);
        String b = getS(brr);
        StringBuffer x = new StringBuffer("");
        int sum = Integer.valueOf(a) + Integer.valueOf(b);
        StringBuffer buffer = new StringBuffer(String.valueOf(sum));
        String crr[] = new String[buffer.length()];
        for (int i = 0; i < buffer.length(); i++) {
            crr[buffer.length() - i - 1] = buffer.substring(i, i + 1);
        }
        for (String s : crr) {
            x.append(s);
        }
        return x.toString();
    }

    private static String getS(int[] arr) {
        StringBuffer a = new StringBuffer("");
        for (int i = arr.length - 1; i >= 0; i--) {
            a.append(String.valueOf(arr[i]));
        }
        return a.toString();
    }

    private String getNothing() {

        return null;
    }

}
