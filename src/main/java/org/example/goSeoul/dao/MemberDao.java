package org.example.goSeoul.dao;

import jdk.nashorn.internal.runtime.ECMAException;
import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

    @Autowired
    private SqlSession sqlSession;

    // 로그인 인증 체크
    public MemberBean loginCheck(String id) throws Exception {
        return sqlSession.selectOne("loginCheck", id);
    }

    public MemberBean findMemberId(String name) throws Exception {
        return sqlSession.selectOne("findMemberId", name);
    }

    public MemberBean searchEmail (String email) throws Exception {
        return sqlSession.selectOne("searchEmail", email);
    }

    public void updatePass(MemberBean memberBean) throws Exception {
        sqlSession.update("updatePass", memberBean);
    }
}