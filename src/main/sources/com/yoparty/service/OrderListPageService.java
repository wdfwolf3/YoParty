package com.yoparty.service;

import com.yoparty.mapper.SignupUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/4/5.
 */
@Service
public class OrderListPageService {
    @Autowired
    private SignupUserMapper signupUserMapper;

    private Integer userId;
    private int pageSize = 10;
    private int pageNow = 1;
    private int status = 0;
    private int startIndex = 0;
    private int rowCount = 0;

    public List<OrderAjax> getActivityList(HttpServletRequest request, Integer userId) {
        initParameter(request, userId);
        return select();
    }

    public void initParameter(HttpServletRequest request, Integer userId) {
        pageSize = Integer.parseInt(request.getParameter("pageSize"));
        pageNow = Integer.parseInt(request.getParameter("pageNow"));
        if (request.getParameter("eventOrderFormMap.status") != null) {
            status = Integer.parseInt(request.getParameter("eventOrderFormMap.status"));
        }
        startIndex = (pageNow - 1) * pageSize;
        this.userId = userId;
    }

    public List<OrderAjax> select() {
        List<OrderAjax> orderAjaxList = signupUserMapper.select(this);
        if (orderAjaxList == null) {

        } else {
            rowCount = orderAjaxList.size();
        }
        return orderAjaxList;
    }

    public int getPageNow() {
        return pageNow;
    }

    public int getRowCount() {
        return rowCount;
    }

    public int getStatus() {
        return status;
    }
}
