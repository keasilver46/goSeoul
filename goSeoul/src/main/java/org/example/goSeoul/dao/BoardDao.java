package org.example.goSeoul.dao;

import java.util.List;

import org.example.goSeoul.model.Board;

public interface BoardDao {
	// List<Board> list(int startRow, int endRow);
	List<Board> list(Board board);

	int getTotal(Board board);

	int insert(Board board);

	Board select(int free_no);

	void selectUpdate(int free_no);

	int update(Board board);

	int delete(int free_no);

	int getMaxNum();

	void updateRe(Board board);

	int freeLikeUpdate(int free_no);
	
	int freeDislikeUpdate(int free_no);
}


