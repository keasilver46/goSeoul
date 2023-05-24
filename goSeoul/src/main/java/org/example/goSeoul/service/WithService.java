package org.example.goSeoul.service;

import java.util.List;

import org.example.goSeoul.dao.WithDao;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WithService {

    @Autowired
    private WithDao withDao;

    public int getListCount() throws Exception {
        return withDao.getListCount();
    }

    public List<WithBean> getWithList(int page) throws Exception {
        return withDao.getWithList(page);
    }

    public void hit(int with_no) throws Exception {
        withDao.hit(with_no);
    }

    public WithBean getWithDetail(int with_no) throws Exception {
        WithBean with = withDao.getWithDetail(with_no);
        return with;
    }
}
