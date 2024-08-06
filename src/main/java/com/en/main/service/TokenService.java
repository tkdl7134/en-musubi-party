package com.en.main.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class TokenService {

    private Map<String, String> tokenStore = new HashMap<>();

    public String createToken(String m_id) {
        String token = UUID.randomUUID().toString();
        tokenStore.put(token, m_id);
        return token;
    }

    public String validateToken(String token) {
        return tokenStore.get(token);
    }

    public void deleteToken(String token) {
        tokenStore.remove(token);
    }

}
