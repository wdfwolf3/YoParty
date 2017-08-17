package com.yoparty.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 * Created by wdfwolf3 on 2017/3/13.
 */
@Controller
public class ImageController {
    @RequestMapping(value = "image", method = RequestMethod.GET)
    public String saveImage0() throws IOException {
        Logger logger = LogManager.getLogger(ImageController.class.getName());
        logger.info("ddad21321");
        logger.error("dd");
        return "image";
    }

    @RequestMapping(value = "image", method = RequestMethod.POST)
    public String saveImage(@RequestPart("file") MultipartFile file) throws IOException {
        byte[] bytes = file.getBytes();
        file.transferTo(new File("D:\\temp\\" + file.getOriginalFilename()));
        return "home";
    }

    @RequestMapping(value = "image1", method = RequestMethod.POST)
    public String saveImage1(@RequestPart("file") Part file) throws IOException {
        file.write("D:\\temp\\" + file.getSubmittedFileName());
        return "main";
    }

}
