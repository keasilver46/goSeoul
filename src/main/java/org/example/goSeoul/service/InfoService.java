package org.example.goSeoul.service;

import java.util.List;

import org.example.goSeoul.dao.InfoDao;
import org.example.goSeoul.model.JoinMemberBean;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoService {

	@Autowired
	 private InfoDao dao;
	  
	/*
	 * @Override public List<MemberBean> getInfo() { return mapper.getInfo(); }
	 */

		public JoinMemberBean getInfo(String id) {
			return dao.getInfo(id);
		}

		public int delete(String id) {
			return dao.delete(id);
		}

		public int postEdit(JoinMemberBean dto) {
			return dao.postEdit(dto);
		}

		public JoinMemberBean getEdit(String id) {
			JoinMemberBean dto = dao.getInfo(id);
			return dto;
		}

		
		public ReserveBean getMyReserve(String id) {
			return dao.getMyReserve(id);
		}

		public JoinMemberBean userCheck(String id) {
			return dao.userCheck(id);
		}

		public List<WithBean> getReserveList(int with_no) {
			return dao.getReserveList(with_no);
		}


	/*
	 * @Override public int edit(MemberBean dto) { return mapper.edit(dto); }
	 * 
	 * @Override public MemberBean edit(int no) { MemberBean dto = mapper.edit(no);
	 * return dto; }
	 */

	    
	    
	    
	 
}

/*
 * @Log4j
 * 
 * @Service
 * 
 * @AllArgsConstructor public class BoardServiceImpl implements BoardService{
 * private BoardMapper mapper;
 * 
 * @Override public void register(BoardVO board) { log.info("register......." +
 * board); mapper.insertSelectKey(board); }
 * 
 * @Override public List<BoardVO> getList() { log.info("getList.......");
 * 
 * return mapper.getList(); }
 * 
 * @Override public BoardVO get(Long bno) { log.info("get......" + bno);
 * 
 * return mapper.read(bno); }
 * 
 * @Override public boolean modify(BoardVO board) { log.info("modify......." +
 * board);
 * 
 * return mapper.update(board) == 1; }
 * 
 * @Override public boolean remove(Long bno) { log.info("remover......." + bno);
 * 
 * return mapper.delete(bno) == 1; } }
 */