package com.yoparty.service;

import com.yoparty.mapper.ActivityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/24.
 */
@Service
public class ActivityListPageService {
    @Autowired
    private ActivityMapper activityMapper;

    private int pageSize;
    private int pageNow;
    private String sort = "ASC";
    private String column;
    private String keyword;
    private String searchType;
    private int type1 = 0;
    private int type2 = 0;
    private int type3 = 0;
    private int startIndex;
    private int total;
    private final String type1name = "活动性质";
    private final String type2name = "活动强度";
    private final String type3name = "持续时间";

    public List<ActivityAjax> getActivityList(HttpServletRequest request){
        initParameter(request);
        return select();
    }

    public void initParameter(HttpServletRequest request){
        pageSize = Integer.parseInt(request.getParameter("pageSize"));
        pageNow = Integer.parseInt(request.getParameter("pageNow"));
        startIndex = (pageNow-1) * pageSize;
        total = startIndex + pageSize;
        sort = request.getParameter("sort");
        if(!"prior_status".equals(request.getParameter("column"))){
            column = request.getParameter("column");
        }
        keyword = "%" + request.getParameter("eventInfoFormMap.keyword") + "%";
        if("0".equals(request.getParameter("eventInfoFormMap.searchType"))){
            searchType = "title";
        }else{
            searchType = "leader_name";
        }
        if(request.getParameter("eventInfoFormMap.type0")!=null){
            type1 = Integer.parseInt(request.getParameter("eventInfoFormMap.type0"));
        }
        if(request.getParameter("eventInfoFormMap.type1")!=null){
            type2 = Integer.parseInt(request.getParameter("eventInfoFormMap.type1"));
        }
        if(request.getParameter("eventInfoFormMap.type2")!=null){
            type3 = Integer.parseInt(request.getParameter("eventInfoFormMap.type2"));
        }
    }

    public List<ActivityAjax> select(){
        return activityMapper.select(this);
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public int getType1() {
        return type1;
    }

    public void setType1(int type1) {
        this.type1 = type1;
    }

    public int getType2() {
        return type2;
    }

    public void setType2(int type2) {
        this.type2 = type2;
    }

    public int getType3() {
        return type3;
    }

    public void setType3(int type3) {
        this.type3 = type3;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
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
