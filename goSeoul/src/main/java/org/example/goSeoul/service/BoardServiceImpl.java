package org.example.goSeoul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.example.goSeoul.dao.BoardDao;
import org.example.goSeoul.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	// public List<Board> list(int startRow, int endRow) {
	public List<Board> list(Board board) {
		return bd.list(board);
		// return bd.list(startRow, endRow);
	}
	
	public int getTotal(Board board) {
		return bd.getTotal(board);
	}

	public int insert(Board board) {
		return bd.insert(board);
	}

	public Board select(int free_no) {
		return bd.select(free_no);
	}

	public void selectUpdate(int free_no) {
		bd.selectUpdate(free_no);
	}

	public int update(Board board) {
		return bd.update(board);
	}

	public int delete(int free_no) {
		return bd.delete(free_no);
	}

	
	public int getMaxNum() { 
		return bd.getMaxNum(); }
	

	public void updateRe(Board board) {
		bd.updateRe(board);
	}
	public int freeLikeUpdate(int free_no) {
		return bd.freeLikeUpdate(free_no);
	}
	
	public int freeDislikeUpdate(int free_no) {
		return bd.freeDislikeUpdate(free_no);
	}	
	
	
}