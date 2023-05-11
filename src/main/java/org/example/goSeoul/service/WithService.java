package org.example.goSeoul.service;

import org.example.goSeoul.dao.WithDao;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WithService {

    @Autowired
    private WithDao withDao;

    // 동행글 저장
    public void insert(WithBean wb) throws Exception {
        System.out.println("동행글 서비스클래스");
        withDao.insert(wb);
    }


}
