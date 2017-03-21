package com.yoparty.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wdfwolf3 on 2017/3/21.
 */
public class ActivityLists {
    private int pageNow;
    private int pageSize;
    private String column;
    private String sort;
    private Map<String, String> eventInfoFormMap = new HashMap<>();

    public Map<String, String> getEventInfoFormMap() {
        return eventInfoFormMap;
    }

    public void setEventInfoFormMap(Map<String, String> eventInfoFormMap) {
        this.eventInfoFormMap = eventInfoFormMap;
    }
    //    private String eventInfoFormMapKeyword;
//    private int eventInfoFormMapSearchType;
//    private int eventInfoFormMapType0;
//    private int eventInfoFormMapType1;
//    private int eventInfoFormMapType2;
//
//    public String getEventInfoFormMapKeyword() {
//        return eventInfoFormMapKeyword;
//    }
//
//    public void setEventInfoFormMapKeyword(String eventInfoFormMapKeyword) {
//        this.eventInfoFormMapKeyword = eventInfoFormMapKeyword;
//    }
//
//    public int getEventInfoFormMapSearchType() {
//        return eventInfoFormMapSearchType;
//    }
//
//    public void setEventInfoFormMapSearchType(int eventInfoFormMapSearchType) {
//        this.eventInfoFormMapSearchType = eventInfoFormMapSearchType;
//    }
//
//    public int getEventInfoFormMapType0() {
//        return eventInfoFormMapType0;
//    }
//
//    public void setEventInfoFormMapType0(int eventInfoFormMapType0) {
//        this.eventInfoFormMapType0 = eventInfoFormMapType0;
//    }
//
//    public int getEventInfoFormMapType1() {
//        return eventInfoFormMapType1;
//    }
//
//    public void setEventInfoFormMapType1(int eventInfoFormMapType1) {
//        this.eventInfoFormMapType1 = eventInfoFormMapType1;
//    }
//
//    public int getEventInfoFormMapType2() {
//        return eventInfoFormMapType2;
//    }
//
//    public void setEventInfoFormMapType2(int eventInfoFormMapType2) {
//        this.eventInfoFormMapType2 = eventInfoFormMapType2;
//    }

    //    private EventInfoFormMap eventInfoFormMap11;
//
//    public EventInfoFormMap getEventInfoFormMap() {
//        return eventInfoFormMap11;
//    }
//
//    public void setEventInfoFormMap(EventInfoFormMap eventInfoFormMap) {
//        this.eventInfoFormMap11 = eventInfoFormMap;
//    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
