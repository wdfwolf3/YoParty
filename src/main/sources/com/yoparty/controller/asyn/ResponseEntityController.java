package com.yoparty.controller.asyn;

import com.yoparty.bean.User;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

/**
 * Created by wdfwolf3 on 2017/3/16.
 */
@Controller
public class ResponseEntityController {
    @RequestMapping(value = "/entity", method = RequestMethod.GET)
    public ResponseEntity<User> getEntity(UriComponentsBuilder uriComponentsBuilder) {
        HttpHeaders headers = new HttpHeaders();
        URI url = uriComponentsBuilder.path("/dd").build().toUri();
        headers.setLocation(url);
        User user = new User();
        user.setId(1);
        user.setUsername("ds");
        user.setAvatar("sdf");
        return new ResponseEntity<User>(user, headers, HttpStatus.CREATED);
    }
}
