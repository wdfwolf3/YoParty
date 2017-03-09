package com.yoparty.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wdfwolf3 on 2017/3/9.
 */
@Component
public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                      HttpServletResponse response,
                                      Authentication authentication) throws IOException {
        Object savedRequestObject = request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if(savedRequestObject!=null){
            String url = ((DefaultSavedRequest) savedRequestObject).getServletPath();
            User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            System.out.println(url);
            System.out.println(authUser.getUsername()+authUser.getAuthorities());
//            response.sendRedirect(url);
        }else{
            response.sendRedirect("/");
        }
    }
}
