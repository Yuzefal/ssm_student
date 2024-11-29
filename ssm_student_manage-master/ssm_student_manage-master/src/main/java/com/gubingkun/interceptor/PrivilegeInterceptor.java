package com.gubingkun.interceptor;

import com.gubingkun.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class PrivilegeInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user1");
        if (user==null){
            //没有登陆
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;

        }
        return true;
    }
}
