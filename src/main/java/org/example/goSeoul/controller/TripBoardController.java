package org.example.goSeoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripBoardController {

	 // 여행 지역별 게시판 이동
	 @RequestMapping("tripBoard_form.do") 
	 private String tripBoard_form() { 
		 System.out.println("지역별게시판");
		 return "tripBoard/tripBoard_form"; 
	 }
	 // 여행 종류별 게시판 이동
	 @RequestMapping("tripBoard2_form.do") 
	 private String tripBoard2_form() { 
		 System.out.println("종류별게시판");
		 return "tripBoard/tripBoard2_form"; 
	 }
	 // 여행코스 게시판 이동
	 @RequestMapping("tripBoard3_form.do") 
	 private String tripBoard3_form() { 
		 System.out.println("여행코스게시판");
		 return "tripBoard/tripBoard3_form"; 
	 }
	 // 여행 상세게시판 이동
	 @RequestMapping("tripDetail_form.do") 
	 private String tripDetail_form() { 
		 System.out.println("상세페이지");
		 return "tripBoard/tripDetail_form"; 
	 }
	
	/* 게시판 목록 */
	/*
	 * @RequestMapping("tripBoard_form.do") public String list(HttpServletRequest
	 * request, Model model) throws Exception {
	 * 
	 * List<TripBoardBean> boardlist = new ArrayList<TripBoardBean>();
	 * 
	 * int page = 1; int limit = 10; // 한 화면에 출력할 레코드수
	 * 
	 * if (request.getParameter("page") != null) { page =
	 * Integer.parseInt(request.getParameter("page")); }
	 * 
	 * // 데이터 갯수 int listcount = service.getListCount();
	 * 
	 * // 페이지 번호(page)를 DAO클래스에게 전달한다. boardlist = service.getBoardList(page);
	 * 
	 * // 총 페이지 int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 :
	 * 1);
	 * 
	 * int startpage = ((page - 1) / 10) * limit + 1; // 1, 11, 21.. int endpage =
	 * startpage + 10 - 1; // 10, 20, 30..
	 * 
	 * if (endpage > maxpage) endpage = maxpage;
	 * 
	 * model.addAttribute("page", page); model.addAttribute("startpage", startpage);
	 * model.addAttribute("endpage", endpage); model.addAttribute("maxpage",
	 * maxpage); model.addAttribute("listcount", listcount);
	 * model.addAttribute("boardlist", boardlist);
	 * 
	 * return "tripBoard/tripBoard_form"; }
	 */

}
