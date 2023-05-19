package org.example.goSeoul.dao;

import java.util.List;

import org.example.goSeoul.model.Board;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	// public List<Board> list(int startRow, int endRow) {
	public List<Board> list(Board board) {
		/*
		 * HashMap<String, Integer> hm=new HashMap<String, Integer>();
		 * hm.put("startRow",startRow); 
		 * hm.put("endRow",endRow);
		 */ 
		return sst.selectList("boardns.list", board);
	}

	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}

	public Board select(int free_no) {
		return sst.selectOne("boardns.select", free_no);
	}

	public void selectUpdate(int free_no) {
		sst.update("boardns.selectUpdate", free_no);
	}

	public int update(Board board) {
		return sst.update("boardns.update", board);
	}

	public int delete(int free_no) {
		return sst.update("boardns.delete", free_no);
	}

	public int getMaxNum() {
		return sst.selectOne("boardns.getMaxNum");
	}

	public void updateRe(Board board) {
		sst.update("boardns.updateRe", board);
	}
	public int freeLikeUpdate(int free_no) {
		return sst.update("boardns.freeLikeUpdate", free_no);
	}
	public int freeDislikeUpdate(int free_no) {
		return sst.update("boardns.freeDislikeUpdate", free_no);
	}
	
}