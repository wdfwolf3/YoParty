package com.yoparty.service;

import java.util.Date;

/**
 * Created by wdfwolf3 on 2017/3/24.
 */
public class ActivityAjax {
    private Integer id;
    private String title;
    private Date start_time;
    private Date end_time;
    private String leader_name;
    private Short type1;
    private Short type2;
    private Short type3;
    private Short price;
    private String start_city;
    private String end_city;
    private Byte event_status;
//    private String gather;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public String getLeader_name() {
        return leader_name;
    }

    public void setLeader_name(String leader_name) {
        this.leader_name = leader_name;
    }

    public Short getType1() {
        return type1;
    }

    public void setType1(Short type1) {
        this.type1 = type1;
    }

    public Short getType2() {
        return type2;
    }

    public void setType2(Short type2) {
        this.type2 = type2;
    }

    public Short getType3() {
        return type3;
    }

    public void setType3(Short type3) {
        this.type3 = type3;
    }

    public Short getPrice() {
        return price;
    }

    public void setPrice(Short price) {
        this.price = price;
    }

    public String getStart_city() {
        return start_city;
    }

    public void setStart_city(String start_city) {
        this.start_city = start_city;
    }

    public String getEnd_city() {
        return end_city;
    }

    public void setEnd_city(String end_city) {
        this.end_city = end_city;
    }

    public Byte getEvent_status() {
        return event_status;
    }

    public void setEvent_status(Byte event_status) {
        this.event_status = event_status;
    }
}
