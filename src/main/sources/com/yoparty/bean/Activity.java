package com.yoparty.bean;

import java.util.Date;

public class Activity {
    private Integer id;

    private String title;

    private Date startTime;

    private Date endTime;

    private Date submitDate;

    private String leaderName;

    private Short type1;

    private Short type2;

    private Short type3;

    private Short price;

    private String origin;

    private String destination;

    private Short number;

    private Short signupNumber;

    private Byte status;

    private String image;

    private String gather;

    private Boolean completed;

    private Boolean verify;

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
        this.title = title == null ? null : title.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public String getLeaderName() {
        return leaderName;
    }

    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName == null ? null : leaderName.trim();
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

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination == null ? null : destination.trim();
    }

    public Short getNumber() {
        return number;
    }

    public void setNumber(Short number) {
        this.number = number;
    }

    public Short getSignupNumber() {
        return signupNumber;
    }

    public void setSignupNumber(Short signupNumber) {
        this.signupNumber = signupNumber;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getGather() {
        return gather;
    }

    public void setGather(String gather) {
        this.gather = gather == null ? null : gather.trim();
    }

    public Boolean getCompleted() {
        return completed;
    }

    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }

    public Boolean getVerify() {
        return verify;
    }

    public void setVerify(Boolean verify) {
        this.verify = verify;
    }
}