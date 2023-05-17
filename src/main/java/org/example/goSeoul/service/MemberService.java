package org.example.goSeoul.service;

import org.example.goSeoul.dao.MemberDao;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    public MemberBean loginCheck(String id) throws Exception {
        return memberDao.loginCheck(id);
    }

    public MemberBean findMemberId(String name) throws Exception {
        return memberDao.findMemberId(name);
    }
    public MemberBean searchEmail(String email) throws Exception {
        return memberDao.searchEmail(email);
    }

    public void updatePass(MemberBean memberBean) throws Exception {
        memberDao.updatePass(memberBean);
    }
}
