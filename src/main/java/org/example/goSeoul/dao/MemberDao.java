package org.example.goSeoul.dao;

import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

    @Autowired
    private SqlSession sqlSession;



}
