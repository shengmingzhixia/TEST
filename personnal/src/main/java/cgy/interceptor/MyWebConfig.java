package cgy.interceptor;

import org.springframework.boot.SpringBootConfiguration;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

@SpringBootConfiguration
public class MyWebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        List<String> list = new ArrayList<>();
        list.add("/toLogin");
        list.add("/entertouristLogin");
        list.add("/toRegister");
        list.add("/logout");
        list.add("/login");
        list.add("/register");
        list.add("/touristLogin");
        list.add("/getRecruits");
        registry.addInterceptor(new CheckLoginInc()).addPathPatterns("/**").excludePathPatterns(list);
    }
}
