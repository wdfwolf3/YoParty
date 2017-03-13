package com.yoparty.bean;

import java.util.Date;

public class SignupUser {
    private Integer id;

    private String orderNumber;

    private Date orderData;

    private Integer activityId;

    private Integer userId;

    private String location;

    private Integer signupNumber;

    private Byte statue;

    private Byte payType;

    private Byte fullcut;

    private Boolean insurance;

    private String message;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    public Date getOrderData() {
        return orderData;
    }

    public void setOrderData(Date orderData) {
        this.orderData = orderData;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public Integer getSignupNumber() {
        return signupNumber;
    }

    public void setSignupNumber(Integer signupNumber) {
        this.signupNumber = signupNumber;
    }

    public Byte getStatue() {
        return statue;
    }

    public void setStatue(Byte statue) {
        this.statue = statue;
    }

    public Byte getPayType() {
        return payType;
    }

    public void setPayType(Byte payType) {
        this.payType = payType;
    }

    public Byte getFullcut() {
        return fullcut;
    }

    public void setFullcut(Byte fullcut) {
        this.fullcut = fullcut;
    }

    public Boolean getInsurance() {
        return insurance;
    }

    public void setInsurance(Boolean insurance) {
        this.insurance = insurance;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }
}