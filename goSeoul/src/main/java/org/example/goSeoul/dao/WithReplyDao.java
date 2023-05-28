package org.example.goSeoul.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.WithReplyBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WithReplyDao {

    @Autowired
    private SqlSession session;
    
    public void withReplyInsert(WithReplyBean wrb) throws Exception {
    	session.insert("replyInsert", wrb);
    }
    
    public List<WithReplyBean> getList(int with_no) throws Exception {
    	return session.selectList("getList", with_no);
    }
    
    public void withReplyUpdate(WithReplyBean wrb) throws Exception {
    	session.update("replyUpdate", wrb);
    }
    
    public void withReplyDelete(WithReplyBean wrb) throws Exception {
    	session.delete("replyDelete", wrb);
    }
}