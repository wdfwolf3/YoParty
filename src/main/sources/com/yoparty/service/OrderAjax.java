package com.yoparty.service;

import java.util.Date;

/**
 * Created by wdfwolf3 on 2017/4/5.
 */
public class OrderAjax {
    private Integer id;
    private String order_no;
    private Byte status;
    private String title;
    private String leader_name;
    private Date create_time;
    private Short price;
    private Short final_total;
    private Integer people_num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLeader_name() {
        return leader_name;
    }

    public void setLeader_name(String leader_name) {
        this.leader_name = leader_name;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Short getPrice() {
        return price;
    }

    public void setPrice(Short price) {
        this.price = price;
    }

    public Short getFinal_total() {
        return final_total;
    }

    public void setFinal_total(Short final_total) {
        this.final_total = final_total;
    }

    public Integer getPeople_num() {
        return people_num;
    }

    public void setPeople_num(Integer people_num) {
        this.people_num = people_num;
    }
}
