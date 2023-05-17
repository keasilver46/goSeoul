package org.example.goSeoul.service;

import org.example.goSeoul.dao.MemberDao;
import org.example.goSeoul.model.JoinMemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    public JoinMemberBean checkLogin(String id) throws Exception {
        return memberDao.checkLogin(id);
    }
}
