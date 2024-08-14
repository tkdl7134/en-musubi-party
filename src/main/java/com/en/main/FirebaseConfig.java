package com.en.main;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import javax.annotation.PostConstruct;

@Configuration
public class FirebaseConfig {

    private Storage storage;

    @PostConstruct
    public void init() {
        try {
            ClassPathResource serviceAccount = new ClassPathResource("AccountKey.json");
            storage = StorageOptions.newBuilder().
                    setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream())).
                    setProjectId("enmusubi-8f0dc").build().getService();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    @Bean
    public Storage getStorage() {
        return storage;
    }
}
