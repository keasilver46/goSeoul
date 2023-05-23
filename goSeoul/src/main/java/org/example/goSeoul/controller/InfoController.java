package org.example.goSeoul.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.InfoService;
import org.example.goSeoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class InfoController {
	
	@Autowired
	private InfoService service;
	@Autowired
	private MemberService mb;
	// 회원 정보
	@GetMapping("memberInfo.do")
	public String getInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberBean dto = service.getInfo(id);
		// List<MemberBean> list = service.getInfo();
		model.addAttribute("info", dto);

		return "member/memberInfo";
	}
	
	// 회원삭제
	@PostMapping("member_delete_ok.do")
	public String member_delete_ok(@RequestParam("pass") String pass, HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberBean dto = service.userCheck(id);
		
		// 비번 틀리면 
		if(!dto.getPass().equals(pass)) {
			return "member/member_delete";
		} else { // 비번 같으면
			
		service.delete(pass);
		System.out.println("삭제성공");
		session.invalidate();
		return "member/memberLogin";
		}
	}
	
	// 회원 수정 폼
	@GetMapping("/memberEdit.do")
	public String getEdit(String id, Model model) {
		MemberBean dto = service.getInfo(id);
		model.addAttribute("edit", dto);

		return "member/memberEdit";
	}
	
	// 회원 정보 수정
	@PostMapping("/memberEdit.do")
	public String postEdit(MemberBean dto, HttpSession session, Model model) {
		service.postEdit(dto);
		
		String id = (String)session.getAttribute("id");
		
		dto = service.getInfo(id);
		model.addAttribute("info", dto);
		return "member/memberInfo";
	}
	// 글목록
	@GetMapping("/getMyList.do")
	public String getMyList(String pageNum, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		System.out.println("getList controller");
		System.out.println(pageNum);
		System.out.println(id);
		List<FreeBean> list = mb.getMyList(id);
		/* 아몰랑^^
		 * final int rowPerPage = 10; if (pageNum == null || pageNum.equals("")) {
		 * pageNum = "1"; } int currentPage = Integer.parseInt(pageNum); String total =
		 * service.getTotal(id); // 검색
		 * 
		 * int startRow = (currentPage - 1) * rowPerPage + 1; int endRow = startRow +
		 * rowPerPage - 1;
		 */
		
		/*
		 * PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		 * pp.setStartRow(startRow); pp.setEndRow(endRow); int no = total - startRow +
		 * 1;
		 */
		
		model.addAttribute("list", list);
		return "member/getMyList";
	}
	
}
