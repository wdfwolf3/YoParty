package com.yoparty.service;

/**
 * Created by wdfwolf3 on 2017/3/24.
 */
public class ActivityAjax {
    private final String type1name = "活动性质";
    private final String type2name = "活动强度";
    private final String type3name = "持续时间";
    private Integer id;
    private String title;
    private String start_time;
    private String end_time;
    private String leader_name;
    private String type1;
    private String type2;
    private String type3;
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

    public String getLeader_name() {
        return leader_name;
    }

    public void setLeader_name(String leader_name) {
        this.leader_name = leader_name;
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

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getType1() {
        return type1;
    }

    public void setType1(String type1) {
        this.type1 = type1;
    }

    public String getType2() {
        return type2;
    }

    public void setType2(String type2) {
        this.type2 = type2;
    }

    public String getType3() {
        return type3;
    }

    public void setType3(String type3) {
        this.type3 = type3;
    }

    public String getType1name() {
        return type1name;
    }

    public String getType2name() {
        return type2name;
    }

    public String getType3name() {
        return type3name;
    }
}
