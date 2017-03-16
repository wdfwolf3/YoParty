package com.yoparty.exception;

/**
 * Created by wdfwolf3 on 2017/3/16.
 */
public class Erro {
    private int id;

    private String name;

    public int getId(){
        return id;
    }

    public Erro(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {

        return name;
    }
}
