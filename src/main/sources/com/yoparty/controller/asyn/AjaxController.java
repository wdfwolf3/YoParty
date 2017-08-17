package com.yoparty.controller.asyn;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wdfwolf3 on 2017/3/8.
 */

@Controller
@RequestMapping("hello")
public class AjaxController {
    @RequestMapping(value = "hello")
    public String jaaj() {
        return "ajax";
    }

    @RequestMapping(value = "json", method = RequestMethod.GET)
    public String getJso() {
        return "json";
    }

    /**
     * ajax请求不需要返回页面，只需要得到response中的数据即可，所以方法签名为void即可
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "ajax", method = RequestMethod.POST)
    public ModelAndView handleRequest(HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {

        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        System.out.println(name + " : " + password);
        PrintWriter out = response.getWriter();

        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Map<String, String> m1 = new HashMap<String, String>();
        m1.put("activityId", "000001");
        m1.put("activityName", "阿斯蒂芬1");
        Map<String, String> m2 = new HashMap<String, String>();
        m2.put("activityId", "000002");
        m2.put("activityName", "阿斯蒂芬2");
        Map<String, String> m3 = new HashMap<String, String>();
        m3.put("activityId", "000003");
        m3.put("activityName", "阿斯蒂芬3");
        Map<String, String> m4 = new HashMap<String, String>();
        m4.put("activityId", "000004");
        m4.put("activityName", "阿斯蒂芬4");
        Map<String, String> m5 = new HashMap<String, String>();
        m5.put("activityId", "000005");
        m5.put("activityName", "阿斯蒂芬5");
        list.add(m1);
        list.add(m2);
        list.add(m3);
        list.add(m4);
        list.add(m5);
        String s = JSON.toJSONString(list);
//        String s = JSONArray.fromObject(list).toString();
        out.print(s);
        out.close();

        return null;
    }

    /**
     * ajax请求不需要返回页面，只需要得到response中的数据即可，所以方法签名为void即可
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "ajax1", method = RequestMethod.POST)
    public void ajaxDatas(HttpServletRequest request, HttpServletResponse response) {
        String jsonResult = getJSONString(request);
        renderData(response, jsonResult);
    }

    private String getJSONString(HttpServletRequest request) {
        //故意构造一个数组，使返回的数据为json数组，数据更复杂些
        List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>(5);
        Map<String, Object> map1 = new HashMap<String, Object>(10);
        //可以获得ajax请求中的参数
        map1.put("a", request.getParameter("a"));
        map1.put("b", request.getParameter("b"));
        map1.put("c", request.getParameter("c"));
        datas.add(map1);
        //故意构造一个数组，使返回的数据为json数组，数据更复杂些
        Map<String, Object> map2 = new HashMap<String, Object>(10);
        map2.put("a", "11");
        map2.put("b", "22");
        map2.put("c", "33");
        datas.add(map2);
        String jsonResult = JSON.toJSONString(datas);
        return jsonResult;
    }

    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     *
     * @param response
     * @param data
     */
    private void renderData(HttpServletResponse response, String data) {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }
}
