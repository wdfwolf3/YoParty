package com.yoparty.util;

/**
 * Created by wdfwolf3 on 2017/3/21.
 */
public class AjaxResponseData {
    private String status;
    private String msg;

    public AjaxResponseData() {
    }

    public AjaxResponseData(String status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
