package org.example.goSeoul.service;

import java.util.List;

import org.example.goSeoul.dao.MemberDao;
import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.JoinMemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDao dao;

    public JoinMemberBean checkLogin(String id) throws Exception {
        return dao.checkLogin(id);
    }

    public JoinMemberBean findMemberId(JoinMemberBean dto) throws Exception {
        return dao.findMemberId(dto);
    }
    public void updatePass(JoinMemberBean dto) throws Exception {
        dao.updatePass(dto);
    }
    public JoinMemberBean searchPwd(JoinMemberBean dto) throws Exception {
        return dao.searchPwd(dto);
    }

    public String concat(JoinMemberBean dto) throws Exception {
        return dao.concat(dto);
    }

    public List<FreeBean> getMyList(String id) {
        return dao.getMyList(id);
    }

}
