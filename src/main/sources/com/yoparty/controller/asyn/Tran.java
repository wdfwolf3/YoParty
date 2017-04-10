package com.yoparty.controller.asyn;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Scanner;

/**
 * Created by wdfwolf3 on 2017/3/21.
 */
public class Tran {
    public static void main(String[] args) throws IOException {
        File file = new File("D:\\temp\\11.html");
        FileInputStream fileInputStream = new FileInputStream(file);
        int size=fileInputStream.available();
        byte[] buffer=new byte[size];
        fileInputStream.read(buffer);
        fileInputStream.close();
        String string = new String(buffer,"GBK");
        String str = new String(string.getBytes("GBK"),"UTF-8");
        System.out.println(str);//注册接口示例

        test();
    }

    public static void test(){
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()){
            int n = sc.nextInt();
            int sum = 0;
            for (int i = 2; i < n; i++) {
                int m = n;
                while(m > 0){
                    sum += m%i;
                    m = m/i;
                }
            }
            int max = yue(sum, n-2);
            System.out.println(sum/max+"/"+(n-2)/max);
        }
    }

    public static int yue(int m, int n){
        while (m%n!=0){
            int tmp = m;
            m = n;
            n = tmp%n;
        }
        return n;
    }
}
