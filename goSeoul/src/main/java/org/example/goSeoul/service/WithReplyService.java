package org.example.goSeoul.service;

import java.util.List;

import org.example.goSeoul.dao.WithReplyDao;
import org.example.goSeoul.model.WithReplyBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WithReplyService {

    @Autowired
    private WithReplyDao dao;
    
    public void withReplyInsert(WithReplyBean wrb) throws Exception {
    	dao.withReplyInsert(wrb);
    }
    
    public List<WithReplyBean> getList(int with_no) throws Exception {
    	return dao.getList(with_no);
    }
    
    public void withReplyUpdate(WithReplyBean wrb) throws Exception {
    	dao.withReplyUpdate(wrb);
    }
    
    public void withReplyDelete(WithReplyBean wrb) throws Exception {
    	dao.withReplyDelete(wrb);
    }
}