package com.yoparty.controller.asyn;

import java.io.IOException;

/**
 * Created by wdfwolf3 on 2017/3/21.
 */
public class Tran {
    public static void main(String[] args) throws IOException {
//        File file = new File("D:\\temp\\11.html");
//        FileInputStream fileInputStream = new FileInputStream(file);
//        int size=fileInputStream.available();
//        byte[] buffer=new byte[size];
//        fileInputStream.read(buffer);
//        fileInputStream.close();
//        String string = new String(buffer,"GBK");
//        String str = new String(string.getBytes("GBK"),"UTF-8");
//        System.out.println(str);//注册接口示例

        test();
    }

    public static void test() {
        String s = "2201年12月12日";
        s.replaceAll("年", "-");
        System.out.println(s.replaceAll("[年月]", "-").replaceAll("日", ""));
    }

    public static int yue(int m, int n) {
        while (m % n != 0) {
            int tmp = m;
            m = n;
            n = tmp % n;
        }
        return n;
    }
}
