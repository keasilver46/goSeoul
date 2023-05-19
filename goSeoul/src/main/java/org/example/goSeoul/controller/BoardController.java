package org.example.goSeoul.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.Board;
import org.example.goSeoul.service.BoardService;
import org.example.goSeoul.service.PagingPgm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/*import org.springframework.web.bind.annotation.RequestParam;
*/
/*import myspring.model.BoardBean;
*/
@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	@RequestMapping("freeSpecific.do") // 댓글 비동기식 받기 rest api
	public String freeSpecific(int num, String pageNum,HttpSession session, Model model) {
		String id= (String)session.getAttribute("id");
		System.out.println("세션에 id: "+ id);
		
		
		
		bs.selectUpdate(num);
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum); 
		model.addAttribute("id", id); 
		return "free/freeSpecific";
	}
	
	@RequestMapping("freeLikeUpdate.do")
	public String freeLike(int num, String pageNum, Model model) {
		System.out.println("num:"+ num);
		System.out.println("pageNum:"+ pageNum);
		
		int result = bs.freeLikeUpdate(num);
		if(result == 1) System.out.println("좋아요 증가");
		
		return "redirect:freeList.do?pageNum="+pageNum;
	}
	
	@RequestMapping("freeDislikeUpdate.do")
	public String freeDislikeUpdate(int num, String pageNum, Model model) {
		System.out.println("num:"+ num);
		System.out.println("pageNum:"+ pageNum);
		
		int result = bs.freeDislikeUpdate(num);
		if(result == 1) System.out.println(" 싫어요 증가");
		
		return "redirect:freeList.do?pageNum="+pageNum;
	}
	

	@RequestMapping("freeContent.do") // 댓글 비동기식 받기 rest api
	public String freeContent(int num, String pageNum, Model model) {
		bs.selectUpdate(num);
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum); 
		return "free/freeContent";
	}

	@RequestMapping("freeList.do")
	public String list(String pageNum, Board board, Model model) {
		System.out.println("controller list");
		System.out.println("search:" + board.getSearch());
		System.out.println("keyword:" + board.getKeyword());

		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// int total = bs.getTotal();
		int total = bs.getTotal(board); // 검색
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;

		List<Board> list = bs.list(board);
		System.out.println("list:" + list);

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", board.getSearch());
		model.addAttribute("keyword", board.getKeyword());
		return "free/freeList";
	}

	@RequestMapping("/insertForm")
	public String initInsert() {
		return "redirect:insertForm/nm/null/pageNum/1";
	}

	@RequestMapping("/insertForm/nm/{nm}/pageNum/{pageNum}")
	public String insertForm(@PathVariable String nm, @PathVariable String pageNum, Model model) {
		if (nm.equals("null"))
			nm = null;
		int num = 0, ref = 0, re_level = 0, re_step = 0;
		if (nm != null) {
			num = Integer.parseInt(nm);
			Board board = bs.select(num);
			ref = board.getRef();
			re_level = board.getRe_level();
			re_step = board.getRe_step();
		}
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		model.addAttribute("pageNum", pageNum);
		return "insertForm";
	}

	@RequestMapping("/insert")
	public String insert(Board board, Model model, HttpServletRequest request) {
		int num = board.getFree_no();
		int number = bs.getMaxNum();
		if (num != 0) { // 답변글
			bs.updateRe(board);
			board.setRe_level(board.getRe_level() + 1);
			board.setRe_step(board.getRe_step() + 1);
		} else // 원문
			board.setRef(number);
		board.setFree_no(number);
		String ip = request.getRemoteAddr();
		board.setIp(ip);
		int result = bs.insert(board);
		model.addAttribute("result", result);
		return "insert";
	}

	@RequestMapping("/view") // 댓글 비동기식 받기 rest api
	public String view(int num, String pageNum, Model model) {
		bs.selectUpdate(num);
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}

	@RequestMapping("/updateForm/num/{num}/pageNum/{pageNum}")
	public String updateForm(@PathVariable int num, @PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}

	@RequestMapping("/update/pageNum/{pageNum}")
	public String update(Board board, @PathVariable String pageNum, Model model) {
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}

	@RequestMapping("/deleteForm/num/{num}/pageNum/{pageNum}")
	public String deleteForm(@PathVariable int num, @PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}

	@RequestMapping("/delete")
	public String delete(int num, String pageNum, Model model) {
		int result = bs.delete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "delete";
	}
}