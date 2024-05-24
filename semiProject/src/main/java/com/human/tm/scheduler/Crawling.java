package com.human.tm.scheduler;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class Crawling {

    private final RestTemplate restTemplate;

    public Crawling(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public void Crawl() {
        String url = "http://localhost:8000/crawl/";
        try {
            String response = restTemplate.getForObject(url, String.class);
            System.out.println("Django 서버에 요청을 보냅니다 : " + response);
        } catch (Exception e) {
            System.err.println("문제가 발생했습니다 : " + e.getMessage());
        }
    }
}
