package com.en.main;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GoogleMapConfig {

    @Value("${google.maps.api.key}")
    private String googleMapApiKey;

    @Bean
    public String googleMapApiKey() {
        return googleMapApiKey;
    }
}
