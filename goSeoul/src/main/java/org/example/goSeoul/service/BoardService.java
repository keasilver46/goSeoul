package org.example.goSeoul.service;

import java.util.List;

import org.example.goSeoul.model.Board;

public interface BoardService {
	// List<Board> list(int startRow, int endRow);
	List<Board> list(Board board);
	
	int getTotal(Board board);

	int insert(Board board);

	Board select(int num);

	void selectUpdate(int free_num);

	int update(Board board);

	int delete(int free_num);

	int getMaxNum();

	void updateRe(Board board);
	
	int freeLikeUpdate(int free_no);
	
	int freeDislikeUpdate(int free_no);
	
}

