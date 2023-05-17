package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.JoinMemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl{

    @Autowired
    private SqlSession sqlSession;

    //  회원가입
    public void insert(JoinMemberBean member) throws Exception {
        sqlSession.insert("insertMember", member);
    }

    //   아이디 중복체크
    public int checkMemberId(String id) throws Exception{
        int re = -1;    //  사용 가능한 id
        JoinMemberBean mb = sqlSession.selectOne("id_check", id);
        if(mb != null){
            re = 1;     //  중복 id
        }
        return re;
    }
    
    //	닉네임 중복체크
    public int checkMemberNick(String nick) throws Exception{
        int re = -1;
        JoinMemberBean mb = sqlSession.selectOne("nick_check", nick);
        if(mb != null){
            re = 1;
        }
        return re;
    }
}
