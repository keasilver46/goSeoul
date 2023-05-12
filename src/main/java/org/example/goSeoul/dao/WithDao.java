package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WithDao {

    @Autowired
    private SqlSession sqlSession;

    // 동행글 저장
    public int insertCheck(WithBean wb) {
        return sqlSession.insert("insertCheck", wb);
    }
}
