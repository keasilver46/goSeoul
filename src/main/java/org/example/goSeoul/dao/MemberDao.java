package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.MemberBean;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Mapper;


//@Mapper
public interface MemberDao {
    public void insert(MemberBean member) throws Exception;
    public int checkMemberId(String id) throws Exception;
    public int checkMemberNick(String nick) throws Exception;
}
