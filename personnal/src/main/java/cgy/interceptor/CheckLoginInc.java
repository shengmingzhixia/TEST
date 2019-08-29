package cgy.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckLoginInc implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        HttpSession session = request.getSession();
        System.out.println("进入拦截器功能主体");
        Object employeeNow = request.getSession().getAttribute("employeeNow");
        Object cust = request.getSession().getAttribute("cust");
        if (employeeNow == null && cust == null) {
            request.setAttribute("message", "请先登录！");
            System.out.println("用户为空");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
