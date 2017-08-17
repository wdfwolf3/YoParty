package com.yoparty.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wdfwolf3 on 2017/3/24.
 */
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        Object savedRequestObject = httpServletRequest.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if (savedRequestObject != null) {
            //get the url before register
            String url = ((DefaultSavedRequest) savedRequestObject).getServletPath();
            //redirect to the page we want before register
            httpServletResponse.sendRedirect("/yo-party-net/" + url);
        } else {
            httpServletResponse.sendRedirect("/yo-party-net");
        }
    }
}
