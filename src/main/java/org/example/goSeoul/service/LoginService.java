package org.example.goSeoul.service;

import org.example.goSeoul.dao.MemberDao;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private MemberDao memberDao;
    @Autowired
    private KakaoService kakaoService;

    public MemberBean loginCheck(MemberBean mb) throws Exception {
        return memberDao.loginCheck(mb);
    }


}
