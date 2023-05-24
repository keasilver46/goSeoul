package org.example.goSeoul.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.JoinMemberBean;
import org.example.goSeoul.model.ReserveBean;
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

    public JoinMemberBean findMemberId(JoinMemberBean dto) throws Exception {
        return sqlSession.selectOne("findMemberId", dto);
    }

    public void updatePass(JoinMemberBean dto) throws Exception {
        sqlSession.update("updatePass", dto);
    }

    public JoinMemberBean searchPwd (JoinMemberBean dto) throws Exception {
        return sqlSession.selectOne("searchPwd", dto);
    }

    public String concat(JoinMemberBean dto) throws Exception {
        return sqlSession.selectOne("concat", dto);
    }

    public List<FreeBean> getMyList(String id) {
        return sqlSession.selectList("getMyListt", id);
    }

    public List<ReserveBean> getMyReserve(String id) {
        return sqlSession.selectList("getMyReserve", id);
    }
}