package com.yoparty.controller;

import com.yoparty.bean.User;
import com.yoparty.bean.UserExample;
import com.yoparty.mapper.UserMapper;
import com.yoparty.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wdfwolf3 on 2017/3/11.
 */
@Controller
public class PageController {
    @Autowired
    protected UserMapper userMapper;

    @RequestMapping("/page")
    public String pageQueryByName(HttpServletRequest request, Model model) {
        Page page = new Page();
        UserExample userExample = new UserExample();
        List<User> userList = userMapper.selectByExample(userExample);
        int totalCount = userList.size();
        int pageCount;
        if (totalCount % page.getPageSize() == 0) {
            pageCount = totalCount / page.getPageSize();
        } else {
            pageCount = totalCount / page.getPageSize() + 1;
        }
        page.setPageCount(pageCount);
        if (request.getParameter("pageNumber") != null)
            page.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
        model.addAttribute("param", page);
        model.addAttribute("list", userList);
        System.out.println("size:" + userList.size());
        return "hello";
    }
}
