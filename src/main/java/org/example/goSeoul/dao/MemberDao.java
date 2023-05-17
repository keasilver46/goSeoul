package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.JoinMemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

    @Autowired
    private SqlSession sqlSession;

    // 로그인 인증 체크
    public JoinMemberBean checkLogin(String id) throws Exception {
        return sqlSession.selectOne("checkLogin", id);
    }
}