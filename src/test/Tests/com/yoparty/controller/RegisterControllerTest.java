package com.yoparty.controller;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceView;


/**
 * Created by wdfwolf3 on 2017/3/1.
 */
public class RegisterControllerTest {
    @Test
    public void test1() throws Exception {
        RegisterController registerController = new RegisterController();
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(registerController).setSingleView(new InternalResourceView("/WEB-INF/views/register.jsp")).build();
//        mockMvc.perform(MockMvcRequestBuilders.get("/register?error=1001"))
//                .andExpect(MockMvcResultMatchers.view().name("register_1001"))
//                .andDo(MockMvcResultHandlers.print())
//                .andReturn();
        mockMvc.perform(MockMvcRequestBuilders.get("/register"))
                .andExpect(MockMvcResultMatchers.view().name("register"))
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }
}
