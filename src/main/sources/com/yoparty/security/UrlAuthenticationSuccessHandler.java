package com.yoparty.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * handler function after Authentication-Success
 * <p>
 * Created by wdfwolf3 on 2017/3/9.
 */
@Component
public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        Object savedRequestObject = request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if (savedRequestObject != null) {
            //get the url before register
            String url = ((DefaultSavedRequest) savedRequestObject).getServletPath();
            //redirect to the page we want before register
            if ("/login".equals(url)) {
                response.sendRedirect("/yo-party-net");
            } else {

                response.sendRedirect("/yo-party-net/" + url);
            }
        } else {
            response.sendRedirect("/yo-party-net");
        }
    }
}
