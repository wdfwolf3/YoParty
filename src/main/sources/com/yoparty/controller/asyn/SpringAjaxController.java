package com.yoparty.controller.asyn;

import com.yoparty.bean.Activity;
import com.yoparty.exception.UserNotFoundException;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by wdfwolf3 on 2017/3/16.
 */
@RestController
public class SpringAjaxController {
    @RequestMapping(value = "/json", method = RequestMethod.GET)
    public Activity getJson() {
        Activity activity = new Activity();
        activity.setStatus((byte) 'a');
        activity.setId(1);
        activity.setTitle("saf");
        return activity;
    }

    /**
     * 参数produces限制请求的Accept内容,consumes限制content-type内容
     *
     * @param activity
     * @return
     */
    @RequestMapping(value = "/json", method = RequestMethod.POST, produces = "application/json")
    public Activity getJson1(@RequestBody Activity activity) {
        if (activity.getOrigin() == null) {
            throw new UserNotFoundException();
        }
        activity.setStatus((byte) 'a');
        activity.setId(1);
        activity.setTitle("saf");
        return activity;
    }
}
