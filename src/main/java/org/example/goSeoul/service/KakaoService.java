package org.example.goSeoul.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service
public class KakaoService {

    private final String kakaoClientId = "53907bf2cc99ddbb1929db25394e8fae";
    private final String kakaoRedirectUri = "http://localhost:8080/member/kakao";
    private final String tokenHost = "https://kauth.kakao.com/oauth/token";
    private final String userInfoHost = "https://kapi.kakao.com/v2/user/me";
    private final String scopesHost = "https://kapi.kakao.com/v2/user/scopes";

    public String getToken(String code) throws Exception {

        URL url = new URL(tokenHost);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        String data = "grant_type=authorization_code"
                + "&client_id=" + kakaoClientId
                + "&redirect_uri=" + kakaoRedirectUri
                + "&code=" + code;
        conn.getOutputStream().write(data.getBytes());
        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode node = mapper.readTree(response.toString());
            return node.get("access_token").asText();
        } else {
            throw new Exception("Failed to get token");
        }
    }

    public Map<String, Object> getUserInfo(String accessToken) throws Exception {
        URL url = new URL(userInfoHost);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode node = mapper.readTree(response.toString());
            JsonNode kakaoAccount = node.get("kakao_account");
            JsonNode properties = node.get("properties");
            String id = node.get("id").asText();
            String nickname = properties.get("nickname").asText();
            String ageRange = kakaoAccount.get("age_range").asText();
            Map<String, Object> result = new HashMap<>();
            result.put("id", id);
            result.put("nickname", nickname);
            result.put("age_range", ageRange);
            return result;
        } else {
            throw new Exception("Failed to get user info");
        }
    }

    public String getAgreementInfo(String accessToken) throws Exception {
        URL url = new URL(scopesHost);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                String inputLine;
                StringBuilder response = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                return response.toString();
            }
        } else {
            throw new RuntimeException("responseCode: " + responseCode);
        }
    }
}