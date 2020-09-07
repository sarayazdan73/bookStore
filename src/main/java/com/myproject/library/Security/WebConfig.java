package com.myproject.library.Security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/home").setViewName("home");
        registry.addViewController("/AccessDenied").setViewName("AccessDenied");
 //     registry.addViewController("/error").setViewName("error");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }

}

