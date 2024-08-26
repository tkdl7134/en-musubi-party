package com.en.main;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // React 관련 경로는 직접 설정
        registry.addResourceHandler("/r/**")
                .addResourceLocations("classpath:/static/")
                .resourceChain(true);

        // 나머지 정적 파일 서빙 경로 설정
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("classpath:/resources/");
    }
}
