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
    private String type1;
    private String type2;
    private String type3;
    private int startIndex;

    public List<ActivityAjax> getActivityList(HttpServletRequest request) {
        initParameter(request);
        return select();
    }

    public void initParameter(HttpServletRequest request) {
        pageSize = Integer.parseInt(request.getParameter("pageSize"));
        pageNow = Integer.parseInt(request.getParameter("pageNow"));
        startIndex = (pageNow - 1) * pageSize;
        sort = request.getParameter("sort");
        if (!"prior_status".equals(request.getParameter("column"))) {
            column = request.getParameter("column");
        } else {
            column = "id";
        }
        if ("".equals(request.getParameter("eventInfoFormMap.keyword"))) {
            keyword = null;
        } else {
            keyword = "%" + request.getParameter("eventInfoFormMap.keyword") + "%";
        }
        if ("0".equals(request.getParameter("eventInfoFormMap.searchType"))) {
            searchType = "title";
        } else {
            searchType = "leader_name";
        }
        if (request.getParameter("eventInfoFormMap.type0") != null) {
            type1 = null;
            type2 = null;
            type3 = null;
        }
        if (request.getParameter("eventInfoFormMap.type1") != null) {
            switch (Integer.parseInt(request.getParameter("eventInfoFormMap.type1"))) {
                case 1:
                    type1 = "脱单";
                    break;
                case 2:
                    type1 = "纯玩";
                    break;
            }
        }
        if (request.getParameter("eventInfoFormMap.type2") != null) {
            switch (Integer.parseInt(request.getParameter("eventInfoFormMap.type2"))) {
                case 1:
                    type2 = "休闲";
                    break;
                case 2:
                    type2 = "轻量";
                    break;
                case 3:
                    type2 = "专业";
                    break;
            }
        }
        if (request.getParameter("eventInfoFormMap.type3") != null) {
            switch (Integer.parseInt(request.getParameter("eventInfoFormMap.type3"))) {
                case 1:
                    type3 = "1日活动";
                    break;
                case 2:
                    type3 = "2日活动";
                    break;
                case 3:
                    type3 = "3日活动";
                    break;
                case 5:
                    type3 = "5日活动";
                    break;
                case 7:
                    type3 = "7日活动";
                    break;
            }
        }
    }

    public List<ActivityAjax> select() {
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

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

}
