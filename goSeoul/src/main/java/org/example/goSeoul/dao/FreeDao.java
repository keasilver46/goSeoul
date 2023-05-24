package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.FreeBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeDao {

    @Autowired
    private SqlSession sqlSession;

    // 동행글 저장
    public int insertCheck(FreeBean fb) {
        System.out.println("FreeDao_insertCheck");
        return sqlSession.insert("insertCheck", fb);
    }
}
