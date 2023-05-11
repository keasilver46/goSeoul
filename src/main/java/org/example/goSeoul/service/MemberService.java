package org.example.goSeoul.service;

import org.example.goSeoul.dao.MemberDao;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.reflect.annotation.ExceptionProxy;


public interface MemberService {
    public void insert(MemberBean member) throws Exception;

    public int checkMemberId(String id) throws Exception;

    public int checkMemberNick(String nick) throws Exception;
}


/*@Service
public class MemberService {
   @Autowired
    private MemberDao dao;

    public void insertMember(MemberBean member) throws Exception{
        System.out.println("서비스");
        dao.insertMember(member);
    }*/

