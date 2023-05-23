package org.example.goSeoul.service;

import org.example.goSeoul.dao.FreeDao;
import org.example.goSeoul.model.FreeBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeService {

    @Autowired
    private FreeDao freeDao;

    // 동행글 저장
    public int insertCheck(FreeBean fb) throws Exception {
        System.out.println("WithService_insertCheck");
        return freeDao.insertCheck(fb);
    }
}
